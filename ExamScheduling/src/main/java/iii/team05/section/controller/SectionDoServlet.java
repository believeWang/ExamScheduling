package iii.team05.section.controller;

import iii.team05.section.model.SectionDAO;
import iii.team05.section.model.SectionVO;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SectionServlet
 */
@WebServlet("/section/SectionDoServlet")
public class SectionDoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SectionDoServlet() {
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
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		
		String action = request.getParameter("action");
		
		if("add".equals(action)){
			System.out.println("add");
			RequestDispatcher jb = request.getRequestDispatcher("/section/section_show.jsp");
			jb.forward(request, response);
		}
		if("modify".equals(action)){
			String id_str = request.getParameter("id");
			int id = Integer.valueOf(id_str);
			try {
				
				SectionDAO sectionDAO = new SectionDAO();
				SectionVO sectionVO = sectionDAO.findByPrimaryKey(id);
				
				java.sql.Time time = sectionVO.getSectiontime();
				String time_str = String.valueOf(time);
				
				String[] time_array = time_str.split(":");
				for (String token:time_array) {
				    System.out.println(token);
				}
				
				request.setAttribute("sectionVO", sectionVO);
				request.setAttribute("time_array", time_array);
				
				RequestDispatcher jb = request.getRequestDispatcher("/section/section_modify_show.jsp");
				jb.forward(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		if("delete".equals(action)){
			String id_str = request.getParameter("id");
			int id = Integer.valueOf(id_str);
			try {
				
				SectionDAO sectionDAO = new SectionDAO();
				sectionDAO.delete(id);
				
				List<SectionVO> sectionlists = sectionDAO.getAll();
				request.setAttribute("sectionlists", sectionlists);
				
				RequestDispatcher jb = request.getRequestDispatcher("/section/section_lists.jsp");
				jb.forward(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
	}

}
