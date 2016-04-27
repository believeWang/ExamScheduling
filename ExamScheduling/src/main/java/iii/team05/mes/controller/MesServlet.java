package iii.team05.mes.controller;

import iii.team05.mes.model.MesService;
import iii.team05.mes.model.MesVO;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class MesServlet
 */
@WebServlet("/mes/mes.do")
public class MesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MesServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");

		/*留言*/
		if ("leave".equals(action)) {
			try {
				String msgname = request.getParameter("msgname");
				String msgmail = request.getParameter("msgmail");
				java.sql.Timestamp msgtime = new java.sql.Timestamp(
						System.currentTimeMillis());
				String msgcontent = request.getParameter("msgcontent");

				MesVO mesVO = new MesVO();
				mesVO.setMsgname(msgname);
				mesVO.setMsgmail(msgmail);
				mesVO.setMsgtime(msgtime);
				mesVO.setMsgcontent(msgcontent);

				/*開始新增資料 */
				MesService mesSvc = new MesService();
				mesVO = mesSvc.leaveMessage(msgname, msgmail, msgtime,
						msgcontent);

				/*新增完成,準備轉交*/
				String url = "/mes/ListAllMessage.jsp";
				RequestDispatcher successView = request
						.getRequestDispatcher(url);
				successView.forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
				RequestDispatcher failureView = request
						.getRequestDispatcher("/mes/LeaveMessage.jsp");
				failureView.forward(request, response);
			}
		}
		
		/*回覆*/
		if ("reply".equals(action)) {
			try {
				Integer messageid = new Integer(request.getParameter("messageid").trim());
				String msgname = request.getParameter("msgname");
				String msgmail = request.getParameter("msgmail");
				java.sql.Timestamp msgtime=java.sql.Timestamp.valueOf(request.getParameter("msgtime"));
				String msgcontent = request.getParameter("msgcontent");
				String rpname = request.getParameter("rpname");		
				java.sql.Timestamp rptime = new java.sql.Timestamp(
						System.currentTimeMillis());
				String rpcontent = request.getParameter("rpcontent");
				MesVO mesVO = new MesVO();
				mesVO.setMessageid(messageid);
				mesVO.setMsgname(msgname);
				mesVO.setMsgmail(msgmail);
				mesVO.setMsgtime(msgtime);
				mesVO.setMsgcontent(msgcontent);
				mesVO.setMsgname(rpname);
				mesVO.setMsgtime(rptime);
				mesVO.setMsgcontent(rpcontent);

	
				MesService mesSvc = new MesService();
				mesVO = mesSvc.replyMessage(messageid,msgname,msgmail,msgtime,msgcontent,rpname,rptime,rpcontent);

				String url = "/mes/ListNotReplyMessage.jsp";
				RequestDispatcher successView = request
						.getRequestDispatcher(url);
				successView.forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
				RequestDispatcher failureView = request
						.getRequestDispatcher("/mes/ListNotReplyMessage.jsp");
				failureView.forward(request, response);
			}
		}

		if ("getOne_For_Message".equals(action)) { 

			try {

				Integer messageid = new Integer(
						request.getParameter("messageid"));
				MesService empSvc = new MesService();
				MesVO mesVO = empSvc.getOneMes(messageid);
				request.setAttribute("mesVO", mesVO); 
				String url = "/mes/ListOneMessage.jsp";
				RequestDispatcher successView = request
						.getRequestDispatcher(url);
				successView.forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		
		if ("getOne_Not_RePlay_Message".equals(action)) {
			try {

				Integer messageid = new Integer(
						request.getParameter("messageid"));
				MesService empSvc = new MesService();
				MesVO mesVO = empSvc.getOneMes(messageid);
				request.setAttribute("mesVO", mesVO); 
				String url = "/mes/ReplyMessage.jsp";
				RequestDispatcher successView = request
						.getRequestDispatcher(url);
				successView.forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		if ("delete".equals(action)) {
	
			try {

				Integer messageid = new Integer(request.getParameter("messageid"));
				

				MesService empSvc = new MesService();
				empSvc.deleteMes(messageid);
							
				String url = "/mes/ListAllMessage.jsp";
				RequestDispatcher successView = request.getRequestDispatcher(url);
				successView.forward(request, response);
				
				
			} catch (Exception e) {
				RequestDispatcher failureView = request
						.getRequestDispatcher("/mes/ListAllMessage.jsp");
				failureView.forward(request, response);
			}
		}
	
	}

}
