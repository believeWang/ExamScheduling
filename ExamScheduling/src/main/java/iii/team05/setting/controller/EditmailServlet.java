package iii.team05.setting.controller;

import iii.team05.examinee.ecmodel.ECService;
import iii.team05.setting.model.STService;
import iii.team05.setting.model.STVO;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class EditmailServlet
 */
@WebServlet("/setting/editmail")
public class EditmailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditmailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		STService stSvc = new STService();


		  if ("Mail_Subject_Query".equals(action)){     // 來自loadmail.jsp的action查詢請求 
				List<STVO> mailArticle = stSvc.query();
				String subject= null;
				for(STVO s:mailArticle){
					subject = s.getEmailsubject();
					System.out.println(subject);
	      }
				request.setAttribute("mail", subject);     // 將第一項資訊放入request物件內
		        RequestDispatcher rd =                     // 準備將移轉程式的執行順序
		               request.getRequestDispatcher("/setting/editsubject.jsp");
		        rd.forward(request, response);             // 移轉程式的執行順序
		        return ;                                   // forward()之後會有一個return敘述	
		  } 
			
		  if ("Mail_Content_Query".equals(action)){    // 來自loadmail.jsp的action查詢請求 
			List<STVO> mailArticle = stSvc.query();
			String content= null;
			for(STVO s:mailArticle){
			 content = s.getEmailcontent();
				System.out.println(content);
			}
			request.setAttribute("mail", content);        // 將第一項資訊放入request物件內
	        RequestDispatcher rd =                        // 準備將移轉程式的執行順序
	               request.getRequestDispatcher("/setting/editcontent.jsp");
	        rd.forward(request, response);                // 移轉程式的執行順序
	        return ;                                      // forward()之後會有一個return敘述	
		  }
		  
		  
		  if ("Mail_Subject_Update".equals(action)){
			  String emailsubject = request.getParameter("subject");
			  System.out.println(emailsubject);            //測試editmail.jsp有傳更新資料進來
			  stSvc.updateMailsubject(emailsubject);       //呼叫STService的updatemail()方法工作
		  }
		
		  if ("Mail_Content_Update".equals(action)){
			  String emailcontent = request.getParameter("content");
			  System.out.println(emailcontent);            //測試editmail.jsp有傳更新資料進來
			  stSvc.updateMailcontent(emailcontent);       //呼叫STService的updatemail()方法工作
		  }
response.sendRedirect("/ExamScheduling/setting/loadmail.jsp");
}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
