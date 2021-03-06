package iii.team05.job.controller;


import iii.team05.Employee.model.EmployeeDAO;
import iii.team05.Employee.model.EmployeeVO;
import iii.team05.job.model.Job111DAO;
import iii.team05.job.model.JobDAO;
import iii.team05.job.model.JobVO;
import iii.team05.jober.model.JobEr1DAO;
import iii.team05.jober.model.JobErDAO;
import iii.team05.jober.model.JobErVO;
import iii.team05.section.model.SectionDAO;
import iii.team05.section.model.SectionVO;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class JobServlet
 */
@WebServlet("/job/JobServlet")
public class JobServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JobServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		System.out.println("doJobServlet");
		request.setCharacterEncoding("UTF-8");
		
		//撈所有職位
		JobDAO jobDAO = new JobDAO();
		List<JobVO> joblists = jobDAO.getAll();
		
		//撈所有主考官
		EmployeeDAO empDAO = new EmployeeDAO();
		List<EmployeeVO> emplists = empDAO.getExam();
		
		request.setAttribute("joblists", joblists);
		request.setAttribute("emplists", emplists);
		
		RequestDispatcher jb = request.getRequestDispatcher("/job/job_lists.jsp");
		jb.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
