package iii.team05.event.controller;

import iii.team05.event.model.EventDAO;
import iii.team05.event.model.EventVO;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TestConfig
 */
@WebServlet("/TestConfig")
public class TestConfig extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TestConfig() {
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
		//java.sql.Date.valueOf("2016-04-21");
		
		EventDAO dao = new EventDAO();
		//insert
//		EventVO eventVo = new EventVO();
//		eventVo.setEmpno(1);
//		eventVo.setStarttime(Timestamp.valueOf("2016-04-21 11:49:45"));
//		eventVo.setEndtime(Timestamp.valueOf("2016-04-21 11:49:45"));
//		eventVo.setBgcolor("#808080");
//		eventVo.setTitle("職位");
//		eventVo.setEcno("EEIT-85-01");
//		eventVo.setEventremark("備註");
//		dao.insert(eventVo);
		
		//update
		EventVO eventVo = new EventVO();
		eventVo.setEventid(1);
		eventVo.setEmpno(12);
		eventVo.setStarttime(Timestamp.valueOf("2016-04-21 11:49:45"));
		eventVo.setEndtime(Timestamp.valueOf("2016-04-21 11:49:45"));
		eventVo.setBgcolor("#404040");
		eventVo.setTitle("更新");
		eventVo.setEcno("EEIT-99");
		eventVo.setEventremark("sasaldjldjdls中文中文中文中文中文中文");
		dao.update(eventVo);
		System.out.println("daPost");
		
		//delete
		//dao.delete(5);
		
		//select_one
//		EventVO eventVo = dao.findByPrimaryKey(3);
//		System.out.println(eventVo.getEventid());
//		System.out.println(eventVo.getEmpno());
//		System.out.println(eventVo.getStarttime());
//		System.out.println(eventVo.getEndtime());
//		System.out.println(eventVo.getBgcolor());
//		System.out.println(eventVo.getTitle());
//		System.out.println(eventVo.getEcno());
//		System.out.println(eventVo.getEventremark());
		
		//select_all
//		List<EventVO> eventVOs = dao.getAll();
//		for(EventVO eventVO : eventVOs){
//			System.out.println(eventVO.getEventid()+",");
//			System.out.println(eventVO.getEmpno()+",");
//			System.out.println(eventVO.getStarttime()+",");
//			System.out.println(eventVO.getEndtime()+",");
//			System.out.println(eventVO.getBgcolor()+",");
//			System.out.println(eventVO.getTitle()+",");
//			System.out.println(eventVO.getEcno()+",");
//			System.out.println(eventVO.getEventremark()+"\n");
//		}
		
		
		
	}

}
