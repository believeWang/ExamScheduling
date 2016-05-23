package iii.team05.eclogin.controller;

import iii.team05.examinee.ecmodel.ECService;
import iii.team05.examinee.ecmodel.ECVO;
import iii.team05.mail.Email;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CheckmailServlet
 */
@WebServlet("/eclogin/signin")
public class CheckmailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckmailServlet() {
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
		
		response.setContentType("text/html; charset=UTF-8");
		String ecemail = request.getParameter("ecemail");
		System.out.println(ecemail);
		Map<String, String> errors = new HashMap<String, String>();
		request.setAttribute("errors", errors);
		
		if(ecemail.matches("(([A-Za-z0-9]+\\.?)+([A-Za-z0-9]+_?)+)+[A-Za-z0-9]+@([a-zA-Z0-9]+\\.)+(com|edu|gov)(\\.(tw|ch|hk))?")) 
		    {
			System.out.println("OK");
			
			ECService ecSvc = new ECService();
			List<ECVO> ecVO =  ecSvc.check(ecemail);
			String username = null;
		 	 for (ECVO s : ecVO) {
		 		username =s. getEcname();
		 	 }
			PrintWriter out=response.getWriter();
			System.out.println(ecVO);
			if(ecVO.size()==0){		
				out.println("非資策會學生");
			}else{
				out.println("歡迎")	;
				String subject = "【註冊通知】感謝您使用偉康考試預約系統";
				   String content = "Dear " + username + ", \n\n\t感謝您使用偉康考試預約系統，您的帳號及密碼如下，\n請妥善保存：\n\n帳號："
				     + ecemail + "\n\n\n\n\n\n\n\n\t\t\t\t\t\t 感謝您使用偉康考試預約系統 敬上"
				     + "\n\n\n\n\n\n**********此為系統自動發送之信件，請勿直接回覆！**********";
				   Email ssm = new Email();
				   ssm.sendEmail(ecemail, subject, content);
			}
		  }
		else {
			errors.put("ecemail", "E-mail格式錯誤");
			request.getRequestDispatcher(
					"/validate/checkmail.jsp").forward(request, response);
		} 
	
	}

}
