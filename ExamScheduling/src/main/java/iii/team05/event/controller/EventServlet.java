package iii.team05.event.controller;

import iii.team05.event.model.EventDAO;
import iii.team05.event.model.EventVO;
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
		
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		
		if ("add".equals(action)) {
			String jobid = request.getParameter("jobid");
			String date = request.getParameter("date");
			String empno = request.getParameter("empno");
			
			SectionDAO secDAO = new SectionDAO();
			List<SectionVO> seclists = secDAO.getAll();		

			request.setAttribute("jobid", jobid);
			request.setAttribute("seclists", seclists);
			request.setAttribute("date", date);
			request.setAttribute("empno", empno);
			
	        RequestDispatcher rd = request.getRequestDispatcher("/fullcalendar/event_add.jsp");
			rd.forward(request, response);
		
		}
		
		if ("edit".equals(action)) {
			
			String empno = request.getParameter("empno");
			String id = request.getParameter("id");
			int id1 = Integer.valueOf(id);
			
			EventDAO eventDAO = new EventDAO();
			EventVO eventVO = eventDAO.findByPrimaryKey(id1);
			
			java.sql.Timestamp starttime = eventVO.getStarttime();//取出時間
			String time = starttime.toString();//轉字串
			int postion = time.indexOf(" ");//作字串切割
			String section_time = time.substring(postion+1,19);//攫取所要部分
			
			String section_date = time.substring(0,postion);
			
			SectionDAO sectionDAO = new SectionDAO();
			List<SectionVO> seclists = sectionDAO.getAll();
			
			request.setAttribute("id", id);
			request.setAttribute("eventVO", eventVO);
			request.setAttribute("section_time", section_time);
			request.setAttribute("section_date", section_date);
			request.setAttribute("seclists", seclists);
			request.setAttribute("empno", empno);
			
			RequestDispatcher rd = request.getRequestDispatcher("/fullcalendar/event_update.jsp");
			rd.forward(request, response);
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
