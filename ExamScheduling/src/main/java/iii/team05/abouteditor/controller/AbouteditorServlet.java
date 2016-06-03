package iii.team05.abouteditor.controller;

import iii.team05.abouteditor.AboutService;
import iii.team05.abouteditor.AbouteditorVO;
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
@WebServlet("/aboutedit")
public class AbouteditorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AbouteditorServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		AboutService abSvc = new AboutService();
		// 來自jsp的查詢請求
		List<AbouteditorVO> AboutArticle = abSvc.query();
		String aboutcontent = null;
		for (AbouteditorVO s : AboutArticle) {
			aboutcontent = s.getAboutcontent();
//			System.out.println(aboutcontent);
		}
			request.setAttribute("about", aboutcontent); // 將第一項資訊放入request物件內
			RequestDispatcher rd = // 準備將移轉程式的執行順序
			request.getRequestDispatcher("/aboutedit.jsp");
			rd.forward(request, response); // 移轉程式的執行順序
		

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");

		AboutService abSvc = new AboutService();
		String aboutcontent = request.getParameter("content");
		System.out.println(aboutcontent);
		if ("Editor_Update".equals(action)) {
			abSvc.updateAbout(aboutcontent);// 呼叫Service
//			System.out.println(aboutcontent); // 測試jsp有傳更新資料進來
		}
			 
		

	}

}
