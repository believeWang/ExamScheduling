package iii.team05.event.controller;

import iii.team05.event.model.EventDAO;
import iii.team05.event.model.EventVO;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class EventSaveServlet
 */
@WebServlet("/fullcalendar/EventSaveServlet")
public class EventSaveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EventSaveServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8"); 
		PrintWriter out = response.getWriter();
		
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		String date = request.getParameter("date");
		String jobid = request.getParameter("jobid");
		String ecemail = request.getParameter("ecemail");
		String empno = request.getParameter("empno");
		String section = request.getParameter("section");  //time
		String title = request.getParameter("title");
		//System.out.println(date+" "+section);
		
		Timestamp ts = new Timestamp(System.currentTimeMillis());  
		String datetime = date+" "+section;
        try {  
            ts = Timestamp.valueOf(datetime);  
            System.out.println(ts);  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
		
		
		
		EventVO evo = new EventVO();
		evo.setEmpno(1);
		evo.setStarttime(ts);
		evo.setEndtime(ts);
		evo.setBgcolor("#337AB7");
		evo.setTitle(title);
		evo.setEcno("EEIT8501");
		//evo.setEventremark();
		
		try{
			
			EventDAO edao = new EventDAO();
			edao.insert(evo);
			
			out.println("1");
			
		}catch(Exception e){
			out.println("寫入失敗");
			e.printStackTrace();
		}
		
		System.out.println("action="+action+"date="+date+"section="+section+"jobid="+jobid+"ecemail="+ecemail+"empno="+empno);
	}

}
