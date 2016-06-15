package iii.team05.gmail_login;

import iii.team05.Employee.model.EmployeeDAO;
import iii.team05.Employee.model.EmployeeService;
import iii.team05.Employee.model.EmployeeVO;
import iii.team05.examinee.ecmodel.ECService;
import iii.team05.examinee.ecmodel.ECVO;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONException;
import org.json.JSONObject;



/**
 * Servlet implementation class GoogleChecks
 */
@WebServlet("/GoogleCheck")
public class GoogleCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GoogleCheck() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Google取得access_token的url
		Map<String, String> errors = new HashMap<String, String>();
		request.setAttribute("googleLoginErrors", errors);
		String token = null;
		String email = null;
		String name = null;

		int empno = 0;
		int pos = 0;
		String empToken=null;
		response.setContentType("text/html; charset=UTF-8");
		URL ut =new URL("https://accounts.google.com/o/oauth2/token");
		HttpsURLConnection ct=(HttpsURLConnection) ut.openConnection();
	ct.setRequestMethod("POST");
	ct.setDoOutput(true);
	OutputStreamWriter ow =new OutputStreamWriter(ct.getOutputStream());
	
	ow.write("code="+request.getParameter("code")+"&");
	 ow.write("client_id=14162985850-ukk7ka9npfvhatl0vi7mccqgnhnq2ui0.apps.googleusercontent.com&");   // client_id
	  ow.write("client_secret=TtLUTbLgWi_CAjDnvj04xasE&");   // client_serect
	  ow.write("redirect_uri=http://localhost:8081/ExamScheduling/GoogleCheck&");   // redirect_uri
	  ow.write("grant_type=authorization_code");  
	  ow.close();
	if(ct.getResponseCode()==HttpsURLConnection.HTTP_OK){
		StringBuilder sb = new StringBuilder("");
	BufferedReader reader=new BufferedReader(new InputStreamReader(ct.getInputStream(),"utf-8"));
	String strLine ="";
	while((strLine=reader.readLine())!=null){
		    sb.append(strLine);
		    
		   }
	try{
		JSONObject jo = new JSONObject(sb.toString());
		 token=jo.getString("access_token"); 

	}catch (JSONException e) {
	    e.printStackTrace();
	   }
	
	}

	URL urUserInfo =   
		     new URL("https://www.googleapis.com/oauth2/v3/userinfo?access_token="+token); 
		 HttpURLConnection connObtainUserInfo =  (HttpURLConnection) urUserInfo.openConnection();
		 //如果認證成功
		 if (connObtainUserInfo.getResponseCode() == HttpURLConnection.HTTP_OK){
		  StringBuilder sbLines   = new StringBuilder("");
		  // 取得Google回傳的資料(JSON格式)
		  BufferedReader reader = 
		   new BufferedReader(new InputStreamReader(connObtainUserInfo.getInputStream(),"utf-8"));
		  String strLine = "";
		  while((strLine=reader.readLine())!=null){
		   sbLines.append(strLine);
		  }	  
		  try {
		   // 把上面取回來的資料，放進JSONObject中，以方便我們直接存取到想要的參數
		   JSONObject jo = new JSONObject(sbLines.toString());		    
		  email =jo.getString("email");
//		  name =jo.getString("name");
		  } catch (JSONException e) {
		   e.printStackTrace();
		  }
		 }
			EmployeeService emSvc = new EmployeeService();
			List<EmployeeVO> ecVO =  emSvc.check(email);
			

		 	 for (EmployeeVO s : ecVO) {
		 		pos=s.getPosition();
		 		empToken = s.getToken();
		 		name=s.getEmpname();
		 		empno=s.getEmpno();
		 	 }
		 	if(ecVO.size()==0){
				errors.put("loginNg", "您非我司員工");
				RequestDispatcher failureView = request

						.getRequestDispatcher("recaptcha.jsp");
				failureView.forward(request, response);
			}else if(pos==0){		
				errors.put("loginNg", "您沒有使用本系統的權限，請洽系統管理員");
				RequestDispatcher failureView = request
						.getRequestDispatcher("index.jsp");
				failureView.forward(request, response);
			}else if(pos==1){
				HttpSession session = request.getSession();
				session.setAttribute("GoogleUser", name);
				session.setAttribute("GoogleEmail", email);
				session.setAttribute("EmpNO", empno);
				String from=  (String) session.getAttribute("dest");
				if(from==null){
//				RequestDispatcher failureView = request
//				.getRequestDispatcher("mes/index2.jsp");
//				failureView.forward(request, response);
					if(empToken==null){
					emSvc.insertToken(email, token);				
					}
					response.sendRedirect(response.encodeRedirectURL("EmpCaes?empturn=CAL"));				
					}else{
						response.sendRedirect(response.encodeRedirectURL(from));
						
					}
				

			}else{
				HttpSession session = request.getSession();
				session.setAttribute("GoogleUser", name);
				session.setAttribute("GoogleEmail", email);
				
				String from =  (String) session.getAttribute("dests");

				  if(from==null){
							if(empToken==null){
							emSvc.insertToken(email, token);				
							}
							response.sendRedirect(response.encodeRedirectURL("sa.jsp"));				
							}else{
								response.sendRedirect(response.encodeRedirectURL(from));
								
							}
			}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
