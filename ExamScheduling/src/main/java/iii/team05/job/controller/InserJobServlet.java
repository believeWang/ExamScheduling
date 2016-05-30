package iii.team05.job.controller;

import iii.team05.event.model.EventDAO;
import iii.team05.job.model.JobDAO;
import iii.team05.job.model.JobVO;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class InserJobServlet
 */
@WebServlet("/job/InserJobServlet")
public class InserJobServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InserJobServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("doGET");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		
		String jbname = request.getParameter("job");
		
		JobVO jbvo = new JobVO();
		jbvo.setJobname(jbname);
		
        try{
			
        	JobDAO jbDAo = new JobDAO();
        	jbDAo.insert(jbvo);
			
        	List<JobVO> jblists = jbDAo.getAll();
        	
		}catch(Exception e){
			e.printStackTrace();
		}
        
        
        
        //request.setAttribute("jblists", jblists);
        
        RequestDispatcher jb = request.getRequestDispatcher("/job/job_show.jsp");
		jb.forward(request, response);
		return;
        
//		System.out.println("doPost");
	}

}
