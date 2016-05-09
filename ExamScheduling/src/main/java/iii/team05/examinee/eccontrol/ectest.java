package iii.team05.examinee.eccontrol;

import iii.team05.examinee.ecmodel.ECHibernateDAO;
import iii.team05.examinee.ecmodel.ECJNDIDao;
import iii.team05.examinee.ecmodel.ESHibernateDAO;
import iii.team05.examinee.ecmodel.ECVO;
import iii.team05.examinee.ecmodel.ESVO;
import iii.team05.examinee.ecmodel.ScoreHibernateDAO;
import iii.team05.examinee.ecmodel.ScoreVO;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 測試用~~~~
 */
@WebServlet("/ectest")
public class ectest extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		//testJNDI(res);
		//testHibernate(res);
		//testSubHibernate(res);
		//testScoreHibernate(res);
		
		testHibernateAll(res);
	}
	private void testHibernateAll(HttpServletResponse res)throws ServletException, IOException {
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();
		ECHibernateDAO dao = new ECHibernateDAO();
		
		ECVO examineeCatVO =dao.findByPrimaryKey("EEIT8517");
		if(examineeCatVO!=null){
			out.print("查詢成功 查詢到"+examineeCatVO.getEcno()+" "+examineeCatVO.getEcname()+"<br/>並準備刪除<br/>");
			//刪除
		
			 dao.delete("EEIT8517");
		}
		
		//建立考生主表
		 examineeCatVO = new ECVO();
		examineeCatVO.setEcno("EEIT8517");
		examineeCatVO.setEcname("彥淳");
		examineeCatVO.setEcemail("believe91326@hotmail");
		examineeCatVO.setEcstatus(false);
		
		//建立考生副表
		ESVO eSVO = new ESVO();
		eSVO.setEcno("EEIT8517");
		eSVO.setEsschool("淡江");
		eSVO.setEssex(true);
		eSVO.seteCVO(examineeCatVO);
		
		//建立分數表
		ScoreVO scoreVO = new ScoreVO();
		scoreVO.setEcno("EEIT8517");
		scoreVO.setInterview(123);
		scoreVO.seteCVO(examineeCatVO);
		
		//兩張表加入主表中
		examineeCatVO.seteSVO(eSVO);
		examineeCatVO.setScoreVO(scoreVO);
		
		//因為casecade all 所以只要新增一個主表就會自動新增其他兩張表
		dao.insert(examineeCatVO);
		
		//查詢
		 examineeCatVO =dao.findByPrimaryKey("EEIT8517");
		 out.print("新增後結果為"+examineeCatVO.getEcno()+" "+examineeCatVO.getEcname()+"<br/>");
		
		//修改
		 eSVO.setEsschool("江淡");
		 scoreVO.setInterview(321);
		 examineeCatVO.setEcname("淳阿");
		 
		 //修改
		 dao.update(examineeCatVO);
		 
		 //查詢
		 examineeCatVO =dao.findByPrimaryKey("EEIT8517");
		 out.print("修改後結果為"+examineeCatVO.getEcno()+" "+examineeCatVO.getEcname());
		 
		
	}
	private void testJNDI(HttpServletResponse res)throws ServletException, IOException {
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();
		ECJNDIDao dao = new ECJNDIDao();
		ECVO examineeCatVO = new ECVO();
		examineeCatVO.setEcno("EEIT8517");
		examineeCatVO.setEcname("彥淳");
		examineeCatVO.setEcemail("believe91326@hotmail");
		examineeCatVO.setEcstatus(false);
		dao.insert(examineeCatVO);
		examineeCatVO.setEcno("EEIT8517");
		examineeCatVO.setEcname("淳阿");
		dao.update(examineeCatVO);
		// dao.delete("EEIT8517");
		ECVO examineeCatVO2 = dao.findByPrimaryKey("EEIT8517");
		out.print(examineeCatVO2.getEcname());
		List<ECVO> list = dao.getAll();
		for (ECVO ecVO : list) {
			out.println(ecVO.getEcno() + " " + ecVO.getEcname() + " "
					+ ecVO.getEcstatus());
		}
	}
	private void testHibernate(HttpServletResponse res)throws ServletException, IOException {
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();
		ECHibernateDAO ecHDAO=new ECHibernateDAO();
		ECVO examineeCatVO = new ECVO();
		examineeCatVO.setEcno("EEIT8517");
		examineeCatVO.setEcname("彥淳");
		examineeCatVO.setEcemail("believe91326@hotmail");
		examineeCatVO.setEcstatus(false);
		ecHDAO.insert(examineeCatVO);
		examineeCatVO.setEcno("EEIT8517");
		examineeCatVO.setEcname("淳阿");
		ecHDAO.update(examineeCatVO);
		ECVO examineeCatVO2 = ecHDAO.findByPrimaryKey("EEIT8517");
		out.print(examineeCatVO2.getEcname());
		//ecHDAO.delete("EEIT8517");
		List<ECVO> list = ecHDAO.getAll();
		for (ECVO ecVO : list) {
			out.println(ecVO.getEcno() + " " + ecVO.getEcname() + " "
					+ ecVO.getEcstatus()+"<br/>");
		}
	}
	private void testSubHibernate(HttpServletResponse res)throws ServletException, IOException {
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();
		ESHibernateDAO esHDAO=new ESHibernateDAO();
		ESVO examineeSubVO = new ESVO();
		examineeSubVO.setEcno("EEIT8517");
		examineeSubVO.setEsschool("淡江");
		examineeSubVO.setEssex(true);
		
		esHDAO.insert(examineeSubVO);
		examineeSubVO.setEcno("EEIT8517");
		examineeSubVO.setEsschool("江淡");
		
		esHDAO.update(examineeSubVO);
		ESVO examineeSubVO2 = esHDAO.findByPrimaryKey("EEIT8517");
		out.println(examineeSubVO2.getEcno());
		//esHDAO.delete("EEIT8517");
		List<ESVO> list = esHDAO.getAll();
		for (ESVO esVO : list) {
			out.println(esVO.getEcno() + " " + esVO.getEsschool() + " "
					+ esVO.getEssex()+"<br/>");
		}
	}
	private void testScoreHibernate(HttpServletResponse res)throws ServletException, IOException {
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();
		ScoreHibernateDAO sHDAO=new ScoreHibernateDAO();
		ScoreVO scoreVO = new ScoreVO();
		scoreVO.setEcno("EEIT8517");
		scoreVO.setInterview(123);
		
		sHDAO.insert(scoreVO);
		scoreVO.setEcno("EEIT8517");
		scoreVO.setInterview(321);
		
		sHDAO.update(scoreVO);
		ScoreVO scoreVO2 = sHDAO.findByPrimaryKey("EEIT8517");
		
		out.println(scoreVO2.getEcno());
		//sHDAO.delete("EEIT8517");
		List<ScoreVO> list = sHDAO.getAll();
		for (ScoreVO scoreVO3 : list) {
			out.println(scoreVO3.getEcno() +" "+scoreVO3.getInterview()+"<br/>");
		}
	}
	
	

}
