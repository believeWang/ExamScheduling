package iii.team05.recaptcha;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class captcha
 */
@WebServlet("/captcha")
public class captcha extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public captcha() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String g_recaptcha_response = (String)request.getParameter("g-recaptcha-response");
		  
			String secret="6LcppyETAAAAAGLUn4dNUKCY2qY3UjguTko8-fn2";
		   URL dest = new URL("https://www.google.com/recaptcha/api/siteverify?secret="+secret+"&response="+g_recaptcha_response);
		   URLConnection yc = dest.openConnection();
		   BufferedReader in = new BufferedReader(new InputStreamReader(yc.getInputStream()));
		   String inputLine;
		   String webdata="";
		   String msg;

		   while ((inputLine = in.readLine()) != null)
		       		webdata=webdata+inputLine;
		   in.close();
		   if(webdata.indexOf("true")>0){
			   msg="Pass";
		   RequestDispatcher failureView = request
					.getRequestDispatcher("/gmail_login/login.do");
			failureView.forward(request, response);
		   } else if(webdata.indexOf("missing-input-response")>0){
			   msg="請勾選我不是機器人";   
			   session.setAttribute("CaptchaErro", msg);
			   RequestDispatcher failureView = request
						.getRequestDispatcher("/recaptcha.jsp");
				failureView.forward(request, response);
		   }else {
			   msg="發生錯誤，請稍候在試";
				   session.setAttribute("CaptchaErro", msg);
				   RequestDispatcher failureView = request
							.getRequestDispatcher("/recaptcha.jsp");
					failureView.forward(request, response);
			   }
	}

}
