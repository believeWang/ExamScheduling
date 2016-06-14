package iii.team05.login_front.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LogoutServlet
 */
@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	//登出
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//清空session
		request.getSession().invalidate();

		response.sendRedirect("/ExamScheduling/AboutServlet");
		
	}
}
