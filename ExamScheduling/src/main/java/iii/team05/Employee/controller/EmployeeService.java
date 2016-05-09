package iii.team05.Employee.controller;

import iii.team05.Employee.model.EmployeeDAO;
import iii.team05.Employee.model.EmployeeVO;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Text
 */
@WebServlet("/Text2")
public class EmployeeService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EmployeeService() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		EmployeeDAO dao = new EmployeeDAO();
		List<EmployeeVO> employee = dao.getAll();
		for (EmployeeVO s : employee) {
			System.out.println(s.getEmpno());
			System.out.println(s.getEmpname());
			System.out.println(s.getEmpemail());
			System.out.println(s.getPosition());
		}

	}

}
