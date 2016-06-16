package iii.team05.event.controller;

import iii.team05.event.model.EventDAO;
import iii.team05.event.model.EventVO;
import iii.team05.examinee.ecmodel.ESHibernateDAO;
import iii.team05.examinee.ecmodel.ESVO;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class EventShowServlet
 */
@WebServlet("/fullcalendar/EventJSONServlet")
public class EventJSONServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EventJSONServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.print("doGET");
		
		response.setContentType("text/html; charset=UTF-8"); 
		PrintWriter out = response.getWriter();
		
		request.setCharacterEncoding("UTF-8");
		String empno_str = request.getParameter("empno");
		int empno = Integer.valueOf(empno_str);
		
		//14天內有效期
		String ecno = request.getParameter("ecno");
		ESHibernateDAO esDAO = new ESHibernateDAO();
		ESVO esVO = esDAO.findByPrimaryKey(ecno);
		Date eshiredate = esVO.getEshiredate();
		
		//起頭天
		Timestamp startDate = new Timestamp(eshiredate.getTime());
		System.out.println(startDate+"start");
		
		//結尾天
		long long1 = eshiredate.getTime() + 13*24*60*60*1000L;
		Timestamp endDate = new Timestamp(long1);
		System.out.println(endDate+"end");
		
		//創立事件物件
		EventVO eventVO = new EventVO();
		eventVO.setStarttime(startDate);
		eventVO.setEndtime(endDate);
		eventVO.setRendering("null");//background
		eventVO.setBgcolor("#ff9f89");
		
		//撈所有事件物件
		EventDAO edao = new EventDAO();
		List<EventVO> elists = edao.getEmpEvent(empno);
		
		//塞事件進去撈出來的事件物件
		elists.add(eventVO);
		
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
			    out.print("\"rendering\":");
			    out.print("\"");
			    out.print(evo.getRendering());
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
