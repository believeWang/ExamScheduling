package iii.team05.mes.controller;

import iii.team05.examinee.ecmodel.ECService;
import iii.team05.examinee.ecmodel.ECVO;
import iii.team05.mes.model.MesService;
import iii.team05.mes.model.MesVO;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CheckServlet
 */
@WebServlet("/mes/CheckServlet")
public class CheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckServlet() {
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
		response.setContentType("text/html; charset=UTF-8");
		String ecemail = request.getParameter("ecemail");
		System.out.println(ecemail);
		ECService ecSvc = new ECService();
		List<ECVO> ecVO =  ecSvc.check(ecemail);
		PrintWriter out=response.getWriter();
		System.out.println(ecVO);
		if(ecVO.size()==0){		
			out.println("非資策會學生");
		}else{
			out.println("歡迎")	;	
		}
	}

}
