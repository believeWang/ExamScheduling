package iii.team05.exam_select.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import iii.team05.examinee.ecmodel.*;

@WebServlet("/exam_select/exam_select.do")
public class Exam_selectServlet extends HttpServlet {
	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		String lab  = req.getParameter("lab");
		String interview  = req.getParameter("interview");
		String labtime  = req.getParameter("labtime");
		String onlineex  = req.getParameter("onlineex");
		ScoreVO scovo= new ScoreVO();
		
		scovo.setEcno("EEIT8501");
		scovo.setLab(1);
		scovo.setInterview(1);
		scovo.setOnlineex(1);
		
}
}
