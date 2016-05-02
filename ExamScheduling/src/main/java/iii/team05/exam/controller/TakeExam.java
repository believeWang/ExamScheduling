package iii.team05.exam.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.w3c.dom.Document;



/**
 * Servlet implementation class TakeExam
 */
@WebServlet("/TakeExam")
public class TakeExam extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		/*request.getSession().setAttribute("currentExam", null);
		request.getSession().setAttribute("totalNumberOfQuizQuestions",null);
		request.getSession().setAttribute("quizDuration",null);
		request.getSession().setAttribute("min",null);
		request.getSession().setAttribute("sec",null);

		String exam = request.getParameter("test");
		request.getSession().setAttribute("exam", exam);

		System.out.println(request.getSession().getAttribute("user"));
		if (request.getSession().getAttribute("user") == null) {
			request.getRequestDispatcher("/login").forward(request,
					response);
			
		} else {
			RequestDispatcher dispatcher = request
					.getRequestDispatcher("/WEB-INF/jsps/quizDetails.jsp");
			Document document=null;
			try{
			document=iii.team05.exam.model.CreateDOM.getDOM(exam);
			
		   
			request.getSession().setAttribute("totalNumberOfQuizQuestions",document.getElementsByTagName("totalQuizQuestions").item(0).getTextContent());
			request.getSession().setAttribute("quizDuration",document.getElementsByTagName("quizDuration").item(0).getTextContent());
			request.getSession().setAttribute("min",document.getElementsByTagName("quizDuration").item(0).getTextContent());
			request.getSession().setAttribute("sec",0);
			
			
			}				
			catch(Exception e){e.printStackTrace();}
			dispatcher.forward(request, response);
		}
	
	*/
	
	}



	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
