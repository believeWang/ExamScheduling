package iii.team05.job.controller;

import iii.team05.Employee.model.EmployeeDAO;
import iii.team05.Employee.model.EmployeeVO;
import iii.team05.job.model.JobDAO;
import iii.team05.job.model.JobVO;
import iii.team05.jober.model.JobErDAO;
import iii.team05.jober.model.JobErVO;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;


/**
 * Servlet implementation class InserJobServlet
 */
@WebServlet("/job/JobSaveServlet")
public class JobSaveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JobSaveServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=UTF-8"); 
		PrintWriter out = response.getWriter();
		
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String jobname = request.getParameter("jobname");
		String employee = request.getParameter("employee");
		
		int empno = Integer.valueOf(employee);
		
		if(id == null){
			//add
			JobVO jobVO = new JobVO();
			jobVO.setJobname(jobname);
			
			JobDAO jobDAO = new JobDAO();
			int jobid = jobDAO.insert_return_id(jobVO);
			
			
			JobErVO jobErVO = new JobErVO();
			jobErVO.setJobid(jobid);  //等job inser into 取 pk鍵
			jobErVO.setEmpno(empno);
			
			JobErDAO jobErDAO = new JobErDAO();
			jobErDAO.insert(jobErVO);
			
			List<JobVO> count = jobDAO.getAll();
			int size = count.size();
			String size_str = String.valueOf(size);
			
			
			JobVO jobData = jobDAO.findByPrimaryKey(jobid);
			String Jobid = jobData.getJobid().toString();
			
			List<String> target = new ArrayList();
			target.add(Jobid);
			target.add(jobData.getJobname());
//			System.out.println(jobData.getJobid());
//			System.out.println(jobData.getJobname());
			for(EmployeeVO emp : jobData.getEmployee()){
//				System.out.println(emp.getEmpname());
				target.add(emp.getEmpname());
			}
			target.add(size_str);
			
			Gson gson = new Gson();
			//String jobJSON = gson.toJson(jobVO);
			String jobJSON2 = gson.toJson(target);
			//out.print(jobJSON);
			out.print(jobJSON2);
			
		}else{
			//update
			System.out.println("沒有");
		}
		
		
//		if ("update".equals(action)) {
//			
//		}
//		
//		if ("delete".equals(action)) {
//			System.out.println("delete");
//		}
//		
	}

}
