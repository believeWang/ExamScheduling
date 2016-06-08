package iii.team05.slide.controller;

import iii.team05.exam.model.ExamVO;
import iii.team05.slide.model.BannerService;
import iii.team05.slide.model.BannerVO;

import java.io.IOException;
import java.util.HashMap;
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
@MultipartConfig(fileSizeThreshold=1024*1024*2, // 2MB
maxFileSize=1024*1024*10,      // 10MB
maxRequestSize=1024*1024*50)   // 50MB
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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BannerService baSvc = new BannerService();
		BannerVO bannerVO = new BannerVO();
		Part filePart = request.getPart("image");
		
		if(filePart!=null&&filePart.getSize()!=0)		
			bannerVO.setSlidephoto(IOUtils.toByteArray(filePart.getInputStream()));
		else{
			//待製作錯誤訊息
//			System.out.println(bannerVO.getSlideid());
//			ExamVO oldVO=service.getExam(bannerVO.getSlideid());
//			if(oldVO!=null&&oldVO.getExamImg()!=null)
//				bannerVO.setSlidephoto(oldVO.getExamImg());
		}
		
		baSvc.insertBanner(bannerVO);
	}

}
