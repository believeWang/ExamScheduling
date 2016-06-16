package iii.team05.abouteditor.controller;

import iii.team05.abouteditor.AboutService;
import iii.team05.abouteditor.AbouteditorVO;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AboutServlet")
public class AboutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AboutServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		AboutService abSvc = new AboutService();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		List<AbouteditorVO> AboutArticle = abSvc.query();
		String aboutcontent = null;
		for (AbouteditorVO s : AboutArticle) {
			aboutcontent = s.getAboutcontent();
			// System.out.println(aboutcontent+"333");
		}

		request.setAttribute("aboutcontent", aboutcontent); // 將第一項資訊放入request物件內
		RequestDispatcher rd = // 準備將移轉程式的執行順序
		request.getRequestDispatcher("/WEB-INF/about.jsp");
		rd.forward(request, response); // 移轉程式的執行順序
		
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

	}

}
