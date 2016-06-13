package iii.team05.mes.controller;

import iii.team05.mes.model.MesService;
import iii.team05.mes.model.MesVO;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;




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
		 DateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm");
		/* 留言 */
		if ("leave".equals(action)) {
			try {
				String msgname = request.getParameter("msgname");
				String msgmail = request.getParameter("msgmail");
				java.sql.Timestamp msgtime1 = new java.sql.Timestamp(
						System.currentTimeMillis());
				String msgtime = sdf.format(msgtime1);
				
				String msgcontent = request.getParameter("msgcontent");

				if (msgcontent.contains("<script>")) {
					response.setContentType("text/html; charset=UTF-8");
					request.setAttribute("status", "NG");
					RequestDispatcher failureView = request
					.getRequestDispatcher("/WEB-INF/mes/LeaveMessage.jsp");
			failureView.forward(request, response);

				} else {
					MesVO mesVO = new MesVO();
					mesVO.setMsgname(msgname);
					mesVO.setMsgmail(msgmail);
					mesVO.setMsgtime(msgtime);
					mesVO.setMsgcontent(msgcontent);

					/* 開始新增資料 */
					MesService mesSvc = new MesService();
					mesVO = mesSvc.leaveMessage(msgname, msgmail, msgtime,
							msgcontent);

					/* 新增完成,準備轉交 */
//					String url = "ListAllMessage.jsp";
					// RequestDispatcher successView = request
					// .getRequestDispatcher(url);
					// successView.forward(request, response);
					response.sendRedirect(response.encodeRedirectURL("/ExamScheduling/MesTurn?turn=LAM"));
				}
			} catch (Exception e) {
				e.printStackTrace();
				e.printStackTrace();
				RequestDispatcher failureView = request
						.getRequestDispatcher("/WEB-INF/mes/LeaveMessage.jsp");
				failureView.forward(request, response);
			}

		}

		/* 回覆 */
		if ("reply".equals(action)) {
			try {
				Integer messageid = new Integer(request.getParameter(
						"messageid").trim());
				String msgname = request.getParameter("msgname");
				String msgmail = request.getParameter("msgmail");
				
				String msgtime = request.getParameter("msgtime");
				String msgcontent = request.getParameter("msgcontent");
				String rpname = request.getParameter("rpname");
				java.sql.Timestamp rptime1 = new java.sql.Timestamp(
						System.currentTimeMillis());
				String rptime = sdf.format(rptime1);
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
				mesVO = mesSvc.replyMessage(messageid, msgname, msgmail,
						msgtime, msgcontent, rpname, rptime, rpcontent);

//				String url = "ListNotReplyMessage.jsp";
				// RequestDispatcher successView = request
				// .getRequestDispatcher(url);
				// successView.forward(request, response);
				response.sendRedirect(response.encodeRedirectURL("/ExamScheduling/MesTurn?turn=LNRM"));

			} catch (Exception e) {
				e.printStackTrace();
				RequestDispatcher failureView = request
						.getRequestDispatcher("/WEB-INF/mes/ListNotReplyMessage.jsp");
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
				String url = "/WEB-INF/mes/ListOneMessage.jsp";
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

				String url = "/WEB-INF/mes/ReplyMessage.jsp";
				RequestDispatcher successView = request
						.getRequestDispatcher(url);
				successView.forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		if ("delete".equals(action)) {

			try {

				Integer messageid = new Integer(
						request.getParameter("messageid"));

				MesService empSvc = new MesService();
				empSvc.deleteMes(messageid);

				String url = "/WEB-INF/mes/ListAllMessage.jsp";
				RequestDispatcher successView = request
						.getRequestDispatcher(url);
				successView.forward(request, response);

			} catch (Exception e) {
				RequestDispatcher failureView = request
						.getRequestDispatcher("/WEB-INF/mes/ListAllMessage.jsp");

				failureView.forward(request, response);
			}
		}


	}
    public static java.sql.Timestamp strToDate() {

        java.util.Date result;

        try {

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:MM");

            sdf.setLenient(false);
            Date date=new Date();
            result = sdf.parse(String.valueOf(date));
            System.out.println("ss"+result);

        } catch (Exception e) {

            return null;

        }

        return new java.sql.Timestamp(result.getTime());

    }
}
