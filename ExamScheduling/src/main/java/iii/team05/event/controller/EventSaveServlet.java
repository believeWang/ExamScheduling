package iii.team05.event.controller;

import iii.team05.event.model.EventDAO;
import iii.team05.event.model.EventVO;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8"); 
		PrintWriter out = response.getWriter();
		
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		
		HttpSession session = request.getSession();
		Object ecno_o = session.getAttribute("ecno");
		
		if("add".equals(action)){
			String date = request.getParameter("date");
			String jobid = request.getParameter("jobid");
			String ecemail = request.getParameter("ecemail");
			String empno_str = request.getParameter("empno");
			String section = request.getParameter("section");  //time
			String title = request.getParameter("title");
			String remark = request.getParameter("remark");
			String ecno = String.valueOf(ecno_o);
			
			Integer empno = Integer.valueOf(empno_str);
			
			Timestamp ts = new Timestamp(System.currentTimeMillis());  
			String datetime = date+" "+section;
	        try {  
	            ts = Timestamp.valueOf(datetime);  
	            System.out.println(ts);  
	        } catch (Exception e) {  
	            e.printStackTrace();  
	        }  
			
			EventVO evo = new EventVO();
			evo.setEmpno(empno);
			evo.setStarttime(ts);
			evo.setEndtime(ts);
			evo.setBgcolor("#58A4B0");//337AB7
			evo.setTitle(title);
			evo.setEcno(ecno);
			evo.setEventremark(remark);
			
			try{
				EventDAO edao = new EventDAO();
				edao.insert(evo);
				out.println("1");
				
			}catch(Exception e){
				out.println("寫入失敗");
				e.printStackTrace();
			}
		}
		if("edit".equals(action)){
			
			String id = request.getParameter("id");
			String date = request.getParameter("date");
			String section = request.getParameter("section");  //time
			String title = request.getParameter("title");
			String remark = request.getParameter("remark");
			String empno_str = request.getParameter("empno");
			String ecno = String.valueOf(ecno_o);
			
			Integer empno = Integer.valueOf(empno_str);
			int id_int = Integer.valueOf(id);
			
			Timestamp ts = new Timestamp(System.currentTimeMillis());  
			String datetime = date+" "+section;
	        try {  
	            ts = Timestamp.valueOf(datetime);  
	            System.out.println(ts);  
	        } catch (Exception e) {  
	            e.printStackTrace();  
	        }  
	        
	        EventVO evo = new EventVO();
			evo.setEmpno(empno);
			evo.setStarttime(ts);
			evo.setEndtime(ts);
			evo.setBgcolor("#58A4B0");//337AB7
			evo.setTitle(title);
			evo.setEcno(ecno);
			evo.setEventremark(remark);
			evo.setEventid(id_int);
			
			try{
				EventDAO edao = new EventDAO();
				edao.update(evo);
				out.println("1");
				
			}catch(Exception e){
				out.println("寫入失敗");
				e.printStackTrace();
			}
	        
		}
		
		if("del".equals(action)){
			//System.out.println("do del");
			String id = request.getParameter("id");
			int id_int = Integer.valueOf(id);
			
			try{
				EventDAO edao = new EventDAO();
				edao.delete(id_int);
				out.println("1");
				
			}catch(Exception e){
				out.println("寫入失敗");
				e.printStackTrace();
			}
		}
		//System.out.println("action="+action+"date="+date+"section="+section+"jobid="+jobid+"ecemail="+ecemail+"empno="+empno);
	}

}
