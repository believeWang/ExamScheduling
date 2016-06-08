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
@WebServlet("/section/SectionSaveServlet")
public class SectionSaveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SectionSaveServlet() {
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
			String hour = request.getParameter("hour");
			String minute = request.getParameter("minute");
			String sectionStatus = request.getParameter("sectionStatus");
			
			String datetime = hour+':'+minute;
			DateFormat formatter = new SimpleDateFormat("HH:mm");
			
			String sectionStatus2 = null;
			if("1".equals(sectionStatus)){
				sectionStatus2 = "True";
			}else{
				sectionStatus2 = "False";
			}
			Boolean active = Boolean.valueOf(sectionStatus2);
			
			try {
				
				java.sql.Time timeValue = new java.sql.Time(formatter.parse(datetime).getTime());
				System.out.println(timeValue);
				System.out.println(active);
				
				SectionVO sectionVO = new SectionVO();
				sectionVO.setSectiontime(timeValue);
				sectionVO.setSectionStatus(active);
				
				SectionDAO sectionDAO = new SectionDAO();
				sectionDAO.insert(sectionVO);
				
				List<SectionVO> sectionlists = sectionDAO.getAll();
				request.setAttribute("sectionlists", sectionlists);
				
				RequestDispatcher sc = request.getRequestDispatcher("/section/section_lists.jsp");
				sc.forward(request, response);
				
			}catch (Exception e) {
				
				e.printStackTrace();
			}
			
		}
		
		if("modify".equals(action)){
			String id_str = request.getParameter("id");
			String hour = request.getParameter("hour");
			String minute = request.getParameter("minute");
			String sectionStatus = request.getParameter("sectionStatus");
			
			int id = Integer.valueOf(id_str);
			
			String datetime = hour+':'+minute;
			DateFormat formatter = new SimpleDateFormat("HH:mm");
			
			String sectionStatus2 = null;
			if("1".equals(sectionStatus)){
				sectionStatus2 = "True";
			}else{
				sectionStatus2 = "False";
			}
			Boolean active = Boolean.valueOf(sectionStatus2);
			
			try {
				
				java.sql.Time timeValue = new java.sql.Time(formatter.parse(datetime).getTime());
				System.out.println(timeValue);
				System.out.println(active);
				
				SectionVO sectionVO = new SectionVO();
				sectionVO.setSectiontime(timeValue);
				sectionVO.setSectionStatus(active);
				sectionVO.setSectionid(id);
				
				SectionDAO sectionDAO = new SectionDAO();
				sectionDAO.update(sectionVO);
				
				List<SectionVO> sectionlists = sectionDAO.getAll();
				request.setAttribute("sectionlists", sectionlists);
				
				RequestDispatcher sc = request.getRequestDispatcher("/section/section_lists.jsp");
				sc.forward(request, response);
				
			}catch (Exception e) {
				
				e.printStackTrace();
			}
		}
		
		
	}

}
