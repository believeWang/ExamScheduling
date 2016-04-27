package iii.team05.examinee.eccontrol;

import iii.team05.examinee.ecmodel.ECHibernateDAO;
import iii.team05.examinee.ecmodel.ECJNDIDao;
import iii.team05.examinee.ecmodel.ExamineeCatVO;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ectest
 */
@WebServlet("/ectest")
public class ectest extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		//testJNDI(res);
		testHibernate(res);
	}
	
	private void testJNDI(HttpServletResponse res)throws ServletException, IOException {
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();
		ECJNDIDao dao = new ECJNDIDao();
		ExamineeCatVO examineeCatVO = new ExamineeCatVO();
		examineeCatVO.setEcno("EEIT8517");
		examineeCatVO.setEcname("彥淳");
		examineeCatVO.setEcemail("believe91326@hotmail");
		examineeCatVO.setEcstatus(false);
		dao.insert(examineeCatVO);
		examineeCatVO.setEcno("EEIT8517");
		examineeCatVO.setEcname("淳阿");
		dao.update(examineeCatVO);
		// dao.delete("EEIT8517");
		ExamineeCatVO examineeCatVO2 = dao.findByPrimaryKey("EEIT8517");
		out.print(examineeCatVO2.getEcname());
		List<ExamineeCatVO> list = dao.getAll();
		for (ExamineeCatVO ecVO : list) {
			out.println(ecVO.getEcno() + " " + ecVO.getEcname() + " "
					+ ecVO.getEcstatus());
		}
	}
	private void testHibernate(HttpServletResponse res)throws ServletException, IOException {
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();
		ECHibernateDAO ecHDAO=new ECHibernateDAO();
		ExamineeCatVO examineeCatVO = new ExamineeCatVO();
		examineeCatVO.setEcno("EEIT8517");
		examineeCatVO.setEcname("彥淳");
		examineeCatVO.setEcemail("believe91326@hotmail");
		examineeCatVO.setEcstatus(false);
		ecHDAO.insert(examineeCatVO);
		examineeCatVO.setEcno("EEIT8517");
		examineeCatVO.setEcname("淳阿");
		ecHDAO.update(examineeCatVO);
		ExamineeCatVO examineeCatVO2 = ecHDAO.findByPrimaryKey("EEIT8517");
		out.print(examineeCatVO2.getEcname());
		List<ExamineeCatVO> list = ecHDAO.getAll();
		for (ExamineeCatVO ecVO : list) {
			out.println(ecVO.getEcno() + " " + ecVO.getEcname() + " "
					+ ecVO.getEcstatus()+"<br/>");
		}
	}

}
