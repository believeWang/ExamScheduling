package iii.team05.Employee.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MesTurn
 */
@WebServlet("/EmpCaes")
public class Empcase extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Empcase() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String empturn=request.getParameter("empturn");
		switch (empturn) {
		case "CAL":
			request.getRequestDispatcher("/WEB-INF/emp/calender.jsp").forward(request, response);	
			break;
//			以下為系統管理者新刪修
		case "EMPF":
			request.getRequestDispatcher("/WEB-INF/employee/empform.jsp").forward(request, response);	
			break;
		
		default:
			break;
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/WEB-INF/mes/ListAllMessage.jsp").forward(request, response);
	}

}
