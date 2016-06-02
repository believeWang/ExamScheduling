package iii.team05.mes.controller;

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
@WebServlet("/MesTurn")
public class MesTurn extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MesTurn() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String turn=request.getParameter("turn");
		switch (turn) {
		case "LM":
			request.getRequestDispatcher("/WEB-INF/mes/LeaveMessage.jsp").forward(request, response);	
			break;
		case "LAM":
			request.getRequestDispatcher("/WEB-INF/mes/ListAllMessage.jsp").forward(request, response);	
			break;
		case "LNRM":
			request.getRequestDispatcher("/WEB-INF/mes/ListNotReplyMessage.jsp").forward(request, response);
			break;
		case "LOM":
			request.getRequestDispatcher("/WEB-INF/mes/ListOneMessage.jsp").forward(request, response);
			break;
		case "RM":
			request.getRequestDispatcher("/WEB-INF/mes/ReplyMessage.jsp").forward(request, response);
			break;
		case "MQTT":
			request.getRequestDispatcher("/WEB-INF/chat/mqtt31.jsp").forward(request, response);
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
	}

}
