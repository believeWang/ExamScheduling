package iii.team05.section.controller;


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
 * Servlet implementation class SectionServlet
 */
@WebServlet("/section/SectionServlet")
public class SectionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SectionServlet() {
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
		
		SectionDAO sectionDAO = new SectionDAO();
		List<SectionVO> sectionlists = sectionDAO.getAll();
		
		for(SectionVO sectionVO : sectionlists){
			System.out.println(sectionVO.getSectionid());
			System.out.println(sectionVO.getSectiontime());
			System.out.println(sectionVO.getSectionStatus());
		}
		
		request.setAttribute("sectionlists", sectionlists);
		
		RequestDispatcher jb = request.getRequestDispatcher("/section/section_lists.jsp");
		jb.forward(request, response);
		

	}

}
