package iii.team05.Event.controller;

import iii.team05.Section.model.SectionDAO;
import iii.team05.Section.model.SectionVO;

import java.util.List;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class EventServlet
 */
@WebServlet("/fullcalendar/EventServlet")
public class EventServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EventServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGetEvent");
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		String jobid = request.getParameter("jobid");
		String date = request.getParameter("date");
		//System.out.println("action="+action+"jobid="+jobid+"date="+date);
		
		SectionDAO secDAO = new SectionDAO();
		List<SectionVO> seclists = secDAO.getAll();		
		
//		for(SectionVO selist : seclists){
//			System.out.println(selist.getSectiontime());
//		}
		
		request.setAttribute("jobid", jobid);
		request.setAttribute("seclists", seclists);
		request.setAttribute("date", date);
		
        RequestDispatcher rd = request.getRequestDispatcher("/fullcalendar/event_add.jsp");
		rd.forward(request, response);
		return;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
