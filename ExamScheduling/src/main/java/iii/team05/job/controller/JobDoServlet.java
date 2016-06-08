package iii.team05.job.controller;

import iii.team05.Employee.model.EmployeeDAO;
import iii.team05.Employee.model.EmployeeVO;
import iii.team05.event.model.EventDAO;
import iii.team05.job.model.Job111DAO;
import iii.team05.job.model.JobDAO;
import iii.team05.job.model.JobVO;
import iii.team05.jober.model.JobErDAO;

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
@WebServlet("/job/JobDoServlet")
public class JobDoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JobDoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		
		if ("delete".equals(action)) {
			
			String id = request.getParameter("id");
			int jobid = Integer.valueOf(id);
			
			//刪除 子表jober
			JobErDAO jobErDAO = new JobErDAO();
			//jobErDAO.delete(jobid);
			
			//刪除 主表job
			JobDAO jobDAO = new JobDAO();
			JobVO jobVO = jobDAO.findByPrimaryKey(jobid);
			jobVO.setEmployee(null);
			jobDAO.delete_VO(jobVO);
			
			//撈全部 job
			List<JobVO> joblists = jobDAO.getAll();
			
			//撈所有主考官
			EmployeeDAO empDAO = new EmployeeDAO();
			List<EmployeeVO> emplists = empDAO.getExam();
			
			request.setAttribute("emplists", emplists); 
			request.setAttribute("joblists", joblists);
			
			RequestDispatcher jb = request.getRequestDispatcher("/job/job_lists.jsp");
			jb.forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
