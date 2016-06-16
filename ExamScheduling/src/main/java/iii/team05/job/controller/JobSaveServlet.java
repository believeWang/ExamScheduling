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
import java.util.HashSet;
import java.util.List;
import java.util.Set;

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
		//String id = request.getParameter("id");
//		String jobid_str = request.getParameter("jobid");
//		String jobname = request.getParameter("jobname");
		//String employee = request.getParameter("employee");
//		String employee = request.getParameter("empno");
		String action = request.getParameter("action");
//		int empno = Integer.valueOf(employee);
//		int jobid = Integer.valueOf(jobid_str);
		
//		if(id == null){
//			//jobVO
//			JobVO jobVO = new JobVO();
//			jobVO.setJobname(jobname);
//			
//			Set<EmployeeVO> employee_set = new HashSet<EmployeeVO>();
//			EmployeeDAO empDAO = new EmployeeDAO();
//			//EmployeeVO empVO = empDAO.findByPrimaryKey(empno);
//			//employee_set.add(empVO);
//			
//			jobVO.setEmployee(employee_set);
//			
//			//新增job並返回當前ID
//			JobDAO jobDAO = new JobDAO();
//			int jobid = jobDAO.insert_return_id(jobVO);
//			
//			//塞資料進job_ErVO
////			JobErVO jobErVO = new JobErVO();
////			jobErVO.setJobid(jobid);  //等job inser into 取 pk鍵
////			jobErVO.setEmpno(empno);
//			
////			JobErDAO jobErDAO = new JobErDAO();
////			jobErDAO.insert(jobErVO);
//			
//			//撈資料數目
//			List<JobVO> count = jobDAO.getAll();
//			int size = count.size();
//			String size_str = String.valueOf(size);
//			
//			//撈指定的單筆job
//			JobVO jobData = jobDAO.findByPrimaryKey(jobid);
//			String Jobid = jobData.getJobid().toString();
//			
//			//字串轉JSON
//			List<String> target = new ArrayList();
//			target.add(Jobid);
//			target.add(jobData.getJobname());
//			for(EmployeeVO emp : jobData.getEmployee()){
//				target.add(emp.getEmpname());
//			}
//			target.add(size_str);
//			
//			Gson gson = new Gson();
//			String jobJSON2 = gson.toJson(target);
//			out.print(jobJSON2);
//			
//		}
		if ("add".equals(action)) {
			
			String jobname = request.getParameter("jobname");
			String employee = request.getParameter("empno");
			
			int empno = Integer.valueOf(employee);
			
			JobVO jobVO = new JobVO();
			jobVO.setJobname(jobname);
			
			Set<EmployeeVO> employee_set = new HashSet<EmployeeVO>();
			EmployeeDAO empDAO = new EmployeeDAO();
			EmployeeVO empVO = empDAO.findByPrimaryKey(empno);
			employee_set.add(empVO);
			
			jobVO.setEmployee(employee_set);
			
			JobDAO jobDAO = new JobDAO();
			jobDAO.insert(jobVO);
			
			//撈全部 job
			List<JobVO> joblists = jobDAO.getAll();
			
			//撈所有主考官
			List<EmployeeVO> emplists = empDAO.getExam();
			
			request.setAttribute("joblists", joblists);
			request.setAttribute("emplists", emplists); 
			
			RequestDispatcher jb = request.getRequestDispatcher("/job/job_lists.jsp");
			jb.forward(request, response);
		}
		
		if ("edit".equals(action)) {
			System.out.println("edit");
			
			String jobid_str = request.getParameter("jobid");
			String jobname = request.getParameter("jobname");
			String employee = request.getParameter("empno");
			
			int empno = Integer.valueOf(employee);
			int jobid = Integer.valueOf(jobid_str);
			
			//jobVO
			JobVO jobVO = new JobVO();
			jobVO.setJobname(jobname);
			jobVO.setJobid(jobid);
			
			Set<EmployeeVO> employee_set = new HashSet<EmployeeVO>();
			EmployeeDAO empDAO = new EmployeeDAO();
			EmployeeVO empVO = empDAO.findByPrimaryKey(empno);
			employee_set.add(empVO);
			
			jobVO.setEmployee(employee_set);
			
			//修改job並返回當前ID
			JobDAO jobDAO = new JobDAO();
			jobDAO.update(jobVO);
			
			//撈全部 job
			List<JobVO> joblists = jobDAO.getAll();
			
			//撈所有主考官
			List<EmployeeVO> emplists = empDAO.getExam();
			
			request.setAttribute("joblists", joblists);
			request.setAttribute("emplists", emplists); 
			
			RequestDispatcher jb = request.getRequestDispatcher("/job/job_lists.jsp");
			jb.forward(request, response);
		}

	}

}
