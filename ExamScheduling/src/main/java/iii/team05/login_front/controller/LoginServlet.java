package iii.team05.login_front.controller;

import iii.team05.examinee.ecmodel.ECService;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/login_front/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ecno=request.getParameter("username");
		String psd=request.getParameter("password");	
		ECService ecService =new ECService();
		boolean hasAccount=ecService.hasAccount(ecno, psd);
		if(hasAccount){
			 HttpSession session=request.getSession();
		     session.setAttribute("ecno",ecno);
			 RequestDispatcher rd=request.getRequestDispatcher("/quiz_front/choose.jsp");
			 rd.forward(request, response);
		}else{
			
		}
		
	}

}
