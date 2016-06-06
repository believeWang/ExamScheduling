package iii.team05.job.controller;

import iii.team05.Employee.model.EmployeeDAO;
import iii.team05.Employee.model.EmployeeVO;
import iii.team05.event.model.EventDAO;
import iii.team05.job.model.Job111DAO;
import iii.team05.job.model.JobVO;

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
		
		if ("add".equals(action)) {
			//System.out.println("do add");
			
			EmployeeDAO empDAO = new EmployeeDAO();
			List<EmployeeVO> emplists = empDAO.getExam();
			
//			for(EmployeeVO datas : emplists){
//				System.out.println(datas.getEmpno());
//				System.out.println(datas.getEmpname());
//				System.out.println(datas.getPosition());
//				System.out.println(datas.getEmpemail());
//				System.out.println(" ");
//			}
			
			request.setAttribute("action", action);
			request.setAttribute("emplists", emplists);
			
			RequestDispatcher jb = request.getRequestDispatcher("/job/job_show.jsp");
			jb.forward(request, response);
		}
		
		if ("update".equals(action)) {
			System.out.println("do update");
			
			String id_str = request.getParameter("id");
			int id = Integer.valueOf(id_str);
			
			EmployeeDAO empDAO = new EmployeeDAO();
			List<EmployeeVO> emplists = empDAO.getExam();
			
			for(EmployeeVO datas : emplists){
				System.out.println(datas.getEmpno());
				System.out.println(datas.getEmpname());
				System.out.println(datas.getPosition());
				System.out.println(datas.getEmpemail());
				System.out.println(" ");
			}
			
			request.setAttribute("action", action);
			request.setAttribute("id", id);
			request.setAttribute("emplists", emplists);
			
			RequestDispatcher jb = request.getRequestDispatcher("/job/job_show.jsp");
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
