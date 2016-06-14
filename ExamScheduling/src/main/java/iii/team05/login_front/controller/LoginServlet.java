package iii.team05.login_front.controller;

import iii.team05.examinee.ecmodel.ECService;
import iii.team05.examinee.ecmodel.ECVO;

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
		HttpSession session=request.getSession();
		//註冊後會有該屬性
		session.removeAttribute("regi");
		if(hasAccount){

			ECVO user =ecService.findByPrimaryKey(ecno);
			String examEmail= user.getEcemail();
			String examName= user.getEcname();
			

		     session.setAttribute("ecno",ecno);
		     session.setAttribute("ExamEmail", examEmail);
		     session.setAttribute("ExamName", examName);
		     //判斷是否有來源
		     String dest=(String) session.getAttribute("dest_front");
		     if(dest!=null&&dest.length()!=0){
		    	 session.removeAttribute("dest_front");
		    	response.sendRedirect(dest);
		     }else{
		    	 //沒有就回到選擇頁面
		    	 response.sendRedirect("choose");
			    
		     }
		    
			
		}else{
			request.getSession().setAttribute("regi", "帳號密碼錯誤");
			 response.sendRedirect("login");
		}
		
	}

}
