package iii.team05.event.controller;

import iii.team05.event.model.EventDAO;
import iii.team05.event.model.EventVO;

import iii.team05.job.model.Job111DAO;
import iii.team05.job.model.JobVO;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		String jobid = request.getParameter("jobid");
		//String ecemail = request.getParameter("ecemail");  //考生Email
		
		//撈主考官id
		//int jobid = Integer.parseInt(jobid);
		//Job_ErDAO jober = new Job_ErDAO();
		//JobVO jerVo = jober.findByPrimaryKey(jobid);//要寫一個用jobid撈這個id全部的主考官id
		
		Job111DAO jbDAO = new Job111DAO();
		List<JobVO> jdlists = jbDAO.getAll();
		
		request.setAttribute("jdlists", jdlists);
		request.setAttribute("jobid", jobid);
		//request.setAttribute("ecemail", ecemail);  //考生
		//request.setAttribute("empno", empno);  //架設這是主考官id
		
		RequestDispatcher failureView = request.getRequestDispatcher("/fullcalendar/index.jsp");
		failureView.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
