package iii.team05.eclogin.controller;


import iii.team05.examinee.ecmodel.ECService;
import iii.team05.examinee.ecmodel.ECVO;
import iii.team05.login_front.controller.PasswordMd5;
import iii.team05.setting.model.STService;
import iii.team05.setting.model.STVO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CheckmailServlet
 */
@WebServlet("/eclogin/cheakmail")
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

		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		String ecemail = request.getParameter("ecemail");
		//System.out.println(ecemail); //測試收到請求內容的資料
		Map<String, String> errors = new HashMap<String, String>();
		request.setAttribute("errors", errors);
//		MessageDigest mDsgest = null;
		if(ecemail.matches("(([A-Za-z0-9]+\\.?)+([A-Za-z0-9]+_?)+)+[A-Za-z0-9]+@([a-zA-Z0-9]+\\.)+(com|edu|gov)(\\.(tw|ch|hk))?")) 
		    {
		//	System.out.println("maile格式驗證 OK");
			
			ECService ecSvc = new ECService();
			List<ECVO> ecVO = ecSvc.check(ecemail);
			String username = null;
			String ecno = null;
			for (ECVO s : ecVO) {
		 		username =s.getEcname();
		 	 }
			for (ECVO s : ecVO) {
				ecno =s.getEcno();
		 	 }
			PrintWriter out=response.getWriter();
		//	System.out.println(ecVO);
			if(ecVO.size()==0){		
				errors.put("ecemail", "<h5 style='color:red'>"+"非資策會學生請聯絡管理者處理"+"</h5>");
				request.getRequestDispatcher("/regi").forward(request, response);
			}else{
				//out.println("等考生登入頁面做好跳轉至此");
			   String cap1 = String.valueOf((char) ((Math.random()*26) + 65));
			   String cap2 = String.valueOf((char) ((Math.random()*26) + 65));
			   String cap3 = String.valueOf((char) ((Math.random()*26) + 65));
				
			   String num1 = String.valueOf((int) (Math.random()*10));
			   String num2 = String.valueOf((int) (Math.random()*10));
			   String num3 = String.valueOf((int) (Math.random()*10));
			   
			   String low1 = String.valueOf((char) ((Math.random()*26) + 97));
			   String low2 = String.valueOf((char) ((Math.random()*26) + 97));
			   
			   String ecpsd = cap1+cap2+cap3+num1+num2+num3+low1+low2;
			  // System.out.println("random隨機密碼:"+ecpsd);
				
			   PasswordMd5 p5 =new PasswordMd5();//MD5加密
				byte[] bytepsd=p5.encryption(ecpsd);

			   ecSvc.updatePsd(ecno,bytepsd);
			   
			   STService stSvc = new STService();
			   
			   //取出資料庫subject(主旨)的值
			   List<STVO> mailSubject = stSvc.query();
				String subject= null;
				for(STVO s:mailSubject){
				 subject = s.getEmailsubject();
					//System.out.println(subject);			
				}
				//呼叫下方delHTMLTag方法將前端的各種符號格式去除後return至subject
				subject=delHTMLTag(subject);
			
				
				//取出資料庫content(內文)的值
			   List<STVO> mailArticle = stSvc.query();
				String content= null;
				for(STVO s:mailArticle){
				 content = s.getEmailcontent();
				//	System.out.println(content);			
				}
				
//				String subject = "感謝您使用偉康考試預約系統";
//				String content = "Dear " + username + ", \n\n\t感謝您使用偉康考試預約系統，您的帳號及密碼如下，\n請妥善保存：\n\n帳號："
//				     + ecemail + "\n\n密碼：" + ecpsd + "\n\n\n\n\n\n\n\n\t\t\t\t\t\t 感謝您使用偉康考試預約系統 敬上"
//				     + "\n\n\n\n\n\n**********此為系統自動發送之信件，請勿直接回覆！**********";
				   
				//啟動Email()方法傳mail內各值進去
				Email ssm = new Email();
				ssm.sendEmail(ecemail, subject, content+"</br>"+"帳號:"+ecno+"</br>"+"\t"+"密碼:"+ecpsd);
				request.getSession().setAttribute("regi", "請至信箱收信");
				response.sendRedirect("/ExamScheduling/login");
				//request.getRequestDispatcher("/login").forward(request, response);
			}
		  }
		else {
			errors.put("ecemail", "<h5 style='color:red'>"+"E-mail格式錯誤"+"</h5>");
			request.getRequestDispatcher("/regi").forward(request, response);
		} 
	
	}
	
		public static String delHTMLTag(String htmlStr){ 
	        String regEx_script="<script[^>]*?>[\\s\\S]*?<\\/script>"; //定義script的正則表示式 
	        String regEx_style="<style[^>]*?>[\\s\\S]*?<\\/style>"; //定義style的正則表示式
	        String regEx_html="<[^>]+>"; //定義HTML標籤的正則表示式
	        
	        Pattern p_script=Pattern.compile(regEx_script,Pattern.CASE_INSENSITIVE); 
	        Matcher m_script=p_script.matcher(htmlStr); 
	        htmlStr=m_script.replaceAll(""); //過濾script標籤 
	        
	        Pattern p_style=Pattern.compile(regEx_style,Pattern.CASE_INSENSITIVE); 
	        Matcher m_style=p_style.matcher(htmlStr); 
	        htmlStr=m_style.replaceAll(""); //過濾style標籤 
	        
	        Pattern p_html=Pattern.compile(regEx_html,Pattern.CASE_INSENSITIVE); 
	        Matcher m_html=p_html.matcher(htmlStr); 
	        htmlStr=m_html.replaceAll(""); //過濾html標籤 
	
	       return htmlStr.trim(); //返回文本字符串
       
         } 

}
