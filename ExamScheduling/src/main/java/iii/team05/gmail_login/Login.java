package iii.team05.gmail_login;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MesServlet
 */
@WebServlet("/gmail_login/login.do")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Login() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
			String login="https://accounts.google.com/o/oauth2/auth?response_type=code&client_id=14162985850-ukk7ka9npfvhatl0vi7mccqgnhnq2ui0.apps.googleusercontent.com&redirect_uri=http://localhost:8081/ExamScheduling/GoogleCheck&scope=https://www.googleapis.com/auth/userinfo.email+https://www.googleapis.com/auth/userinfo.profile+https://www.googleapis.com/auth/calendar&access_type=offline";
		response.sendRedirect(response.encodeRedirectURL(login));

	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String login="https://accounts.google.com/o/oauth2/auth?response_type=code&client_id=14162985850-ukk7ka9npfvhatl0vi7mccqgnhnq2ui0.apps.googleusercontent.com&redirect_uri=http://localhost:8081/ExamScheduling/GoogleCheck&scope=https://www.googleapis.com/auth/userinfo.email+https://www.googleapis.com/auth/userinfo.profile+https://www.googleapis.com/auth/admin.directory.resource.calendar&access_type=offline";
	response.sendRedirect(response.encodeRedirectURL(login));
	

}
}