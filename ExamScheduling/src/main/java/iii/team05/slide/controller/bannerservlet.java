package iii.team05.slide.controller;

import iii.team05.exam.model.ExamService;
import iii.team05.exam.model.ExamVO;
import iii.team05.examinee.ecmodel.ECVO;
import iii.team05.setting.model.STVO;
import iii.team05.slide.model.BannerService;
import iii.team05.slide.model.BannerVO;

import java.io.IOException;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.poi.util.IOUtils;

/**
 * Servlet implementation class bannerservlet
 */
@WebServlet("/bannerservlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 10, // 10MB
maxRequestSize = 1024 * 1024 * 50)
// 50MB
public class bannerservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public bannerservlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		request.getRequestDispatcher("/WEB-INF/bannerset.jsp").forward(request,
				response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		BannerService baSvc = new BannerService();
		BannerVO bannerVO = new BannerVO();
		String action = request.getParameter("action");

		// 新增圖片insert
		if ("Banner_Imag_Insert".equals(action)) {
			Part filePart = request.getPart("image");
			if (filePart != null && filePart.getSize() != 0)
				bannerVO.setSlidephoto(IOUtils.toByteArray(filePart
						.getInputStream()));

			baSvc.insertBanner(bannerVO);
			// request.getRequestDispatcher("/bannerset.jsp").forward(request,
			// response); //新增和刪除的跳轉都直接寫在外部用Redirect

		}

		// 刪除Imag的需求
		if ("Banner_Imag_Delete".equals(action)) {
			Integer deImag = Integer.valueOf(request.getParameter("deImag"));
			System.out.println(deImag); // 測試banner.jsp有傳Delete資料進來
			baSvc.delete(deImag);
			// request.getRequestDispatcher("/bannerset.jsp").forward(request,
			// response); //新增和刪除的跳轉都直接寫在外部用Redirect
		}
		new ExamService().putAllBannerImag(getServletContext());
		response.sendRedirect("/ExamScheduling/forwardBanner");

	}
}
