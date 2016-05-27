package iii.team05.gmail_login;

import iii.team05.mes.model.MesService;
import iii.team05.mes.model.MesVO;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class MesServlet
 */
@WebServlet("/gmail_login/loginout.do")
public class LoginOut extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginOut() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
	//	session.removeAttribute("GoogleUser");
			session.invalidate();
		request.setAttribute("loginout", "您已經成功登出");
	//	response.sendRedirect(response.encodeRedirectURL(request.getContextPath()+"/index2.jsp"));
		RequestDispatcher failureView = request
				.getRequestDispatcher("/index.jsp");
		failureView.forward(request, response);	 
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
	

}
}