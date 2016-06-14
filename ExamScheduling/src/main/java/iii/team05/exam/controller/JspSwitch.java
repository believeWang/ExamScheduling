package iii.team05.exam.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ChooseExam
 */
@WebServlet(urlPatterns = { "/login", "/choose",  "/logout" ,"/JspSwitch","/regi"})
public class JspSwitch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       //轉接到web-inf中的jsp
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String applicationContextPath = request.getContextPath();
		
		//選擇考試畫面
		if (request.getRequestURI().equals(
				applicationContextPath + "/choose")) {
			RequestDispatcher dispatcher = request
					.getRequestDispatcher("/WEB-INF/quiz_front/choose.jsp");
			dispatcher.forward(request, response);
		
		//登入畫面
		} else if (request.getRequestURI().equals(
				applicationContextPath + "/login")) {
			
			RequestDispatcher dispatcher = request
					.getRequestDispatcher("/WEB-INF/login_front/login.jsp");
			dispatcher.forward(request, response);
			
		//註冊
		} else if (request.getRequestURI().equals(
				applicationContextPath + "/regi")) {
			
			RequestDispatcher dispatcher = request
					.getRequestDispatcher("/WEB-INF/login_front/regi.jsp");
			dispatcher.forward(request, response);
			
		
		} 
		
		
		
		
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
