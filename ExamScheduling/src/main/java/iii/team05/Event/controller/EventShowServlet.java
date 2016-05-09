package iii.team05.Event.controller;

import iii.team05.Event.model.EventDAO;
import iii.team05.Event.model.EventVO;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

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
		//System.out.print("doGET111");
		
		response.setContentType("text/html; charset=UTF-8"); 
		PrintWriter out = response.getWriter();
		
		EventDAO edao = new EventDAO();
		List<EventVO> elists = edao.getAll();
		
		out.print("[");
			for(EventVO evo: elists){
				out.print("{");
				
				out.print("\"id\":");
			    out.print("\"");
			    out.print(evo.getEventid());
			    out.print("\",");
			    out.print("\"title\":");
			    out.print("\"");
			    out.print(evo.getTitle());
			    out.print("\",");
			    out.print("\"start\":");
			    out.print("\"");
			    out.print(evo.getStarttime());
			    out.print("\",");
			out.print("\"end\":");
			    out.print("\"");
			    out.print(evo.getEndtime());
			    out.print("\",");
			    out.print("\"color\":");
			    out.print("\"");
				out.print(evo.getBgcolor());
				out.print("\"");
				if(elists.size()-1 == elists.indexOf(evo)){
					out.print("}");
				}else{
					out.print("},");	
				}
			}
		out.print("]");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
