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


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ecno=request.getParameter("username");
		String psd=request.getParameter("password");	
		ECService ecService =new ECService();
		PasswordMd5 p5 =new PasswordMd5();
		byte[] bytepsd=p5.encryption(psd);
		boolean hasAccount=ecService.hasAccount(ecno, bytepsd);
		if(hasAccount){
			 HttpSession session=request.getSession();
		     session.setAttribute("ecno",ecno);
		     //判斷是否有來源
		     String dest=(String) session.getAttribute("dest");
		     if(dest!=null&&dest.length()!=0){
		    	 session.removeAttribute("dest");
		    	response.sendRedirect(dest);
		     }else{
		    	 //沒有就回到選擇頁面
			     RequestDispatcher dispatcher = request
							.getRequestDispatcher("/WEB-INF/quiz_front/choose.jsp");
					dispatcher.forward(request, response);
		     }
		    
			
		}else{
			System.out.println("查無此人");
		}
		
	}

}
