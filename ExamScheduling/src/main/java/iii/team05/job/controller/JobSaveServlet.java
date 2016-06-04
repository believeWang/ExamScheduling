package iii.team05.job.controller;

import iii.team05.Employee.model.EmployeeDAO;
import iii.team05.Employee.model.EmployeeVO;
import iii.team05.event.model.EventDAO;
import iii.team05.job.model.Job111DAO;
import iii.team05.job.model.JobVO;
import iii.team05.jober.model.JobErVO;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class InserJobServlet
 */
@WebServlet("/job/JobSaveServlet")
public class JobSaveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JobSaveServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String jobname = request.getParameter("jobname");
		String empno_str = request.getParameter("empno");
		
		int empno = Integer.valueOf(empno_str);
		
		if(id == null){
			//add
			JobVO jobVo = new JobVO();
			jobVo.setJobname(jobname);
			
//			Job111DAO jobDAO = new Job111DAO();
//			int jobid = jobDAO.insert_return_id(jobVo);
			
//			System.out.println(jobid);
			
			JobErVO joberVO = new JobErVO();
//			joberVO.setJobid(jobid);
			joberVO.setEmpno(empno);
			
			
			
		}else{
			//update
			System.out.println("沒有");
		}
		
//		if ("add".equals(action)) {
//			
//			EmployeeDAO empDAO = new EmployeeDAO();
//			List<EmployeeVO> emplists = empDAO.getExam();
//			
//			for(EmployeeVO datas : emplists){
//				System.out.println(datas.getEmpno());
//				System.out.println(datas.getEmpname());
//				System.out.println(datas.getPosition());
//				System.out.println(datas.getEmpemail());
//				System.out.println(" ");
//			}
//			
//			request.setAttribute("action", action);
//			request.setAttribute("emplists", emplists);
//			
//			RequestDispatcher jb = request.getRequestDispatcher("/job/job_show.jsp");
//			jb.forward(request, response);
//			
//		}
		
//		if ("update".equals(action)) {
//			
//		}
//		
//		if ("delete".equals(action)) {
//			
//		}
		
	}

}
