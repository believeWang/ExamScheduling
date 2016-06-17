package iii.team05.event.controller;

import iii.team05.examinee.ecmodel.ESHibernateDAO;
import iii.team05.examinee.ecmodel.ESVO;
import iii.team05.job.model.Job111DAO;
import iii.team05.job.model.JobVO;
import iii.team05.jober.model.JobEr1DAO;
import iii.team05.jober.model.JobErVO;

import java.io.IOException;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
//import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class EventShowServlet
 */
@WebServlet("/fullcalendar/EventShowServlet")
public class EventShowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EventShowServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String jobid_str = request.getParameter("jobid"); //當前職缺
		int jobid = 0;
		
		//判斷沒有id時自動撈資料庫第一筆顯示
		if(jobid_str == null){
			
			Job111DAO jbDAO = new Job111DAO();
			List<JobVO> joblists = jbDAO.getAll();
			if(joblists.size() != 0){
				JobVO jobVO = joblists.get(0);
				jobid = jobVO.getJobid();
			}else{
				RequestDispatcher failureView = request.getRequestDispatcher("/fullcalendar/error.jsp");
				failureView.forward(request, response);
				return;
			}
			
		}else{
			jobid = Integer.valueOf(jobid_str); //轉型
		}
		
		//當前登入考生 撈session
		HttpSession session = request.getSession();
		Object ecno_o = session.getAttribute("ecno");
		
		if(ecno_o =="" || ecno_o ==null){
			ecno_o = "EEIT8501";
		}
		
		//旁邊的job導覽列
		Job111DAO jbDAO = new Job111DAO();
		List<JobVO> jdlists = jbDAO.getAll();
		
		//主考官
		JobEr1DAO JobEr1DAO = new JobEr1DAO();
		JobErVO jobErVO = JobEr1DAO.findByPrimaryKey(jobid); //只能抓一筆  之後再寫SQL抓多筆
		Integer empno = jobErVO.getEmpno(); //這個職缺當前負責的主考官
		
		//撈考生eshiredate 用這個算考生可以預約的14天時間
		String ecno = String.valueOf(ecno_o);
		ESHibernateDAO esDAO = new ESHibernateDAO();
		ESVO esVO = esDAO.findByPrimaryKey(ecno);
		Date eshiredate = esVO.getEshiredate();
		//date to string
		DateFormat df = new SimpleDateFormat("yyy-MM-dd");
		String text = df.format(eshiredate);
		
		String[] datearray = text.split("-");//切割字串
		
		request.setAttribute("jdlists", jdlists);
		request.setAttribute("jobid", jobid);
		request.setAttribute("ecno", ecno);
		request.setAttribute("empno", empno);
		request.setAttribute("datearray", datearray);
		
		RequestDispatcher failureView = request.getRequestDispatcher("/fullcalendar/index.jsp");
		failureView.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
