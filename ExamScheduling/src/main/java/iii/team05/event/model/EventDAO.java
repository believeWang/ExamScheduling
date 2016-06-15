package iii.team05.event.model;

import java.util.*;
import java.sql.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import iii.team05.event.model.EventVO;

public class EventDAO implements EventDAO_interface {

	// 一個應用程式中,針對一個資料庫 ,共用一個DataSource即可
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/ESDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	private static final String INSERT_STMT = "INSERT INTO Event_Exist (empno, starttime, endtime, bgcolor, title, ecno, eventremark, rendering) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
	private static final String GET_ALL_STMT = "SELECT eventid, empno, starttime, endtime, bgcolor, title, ecno, eventremark, rendering FROM Event_Exist";
	private static final String GET_ONE_STMT = "SELECT eventid, empno, starttime, endtime, bgcolor, title, ecno, eventremark, rendering FROM Event_Exist where eventid = ?";
	private static final String DELETE_STMT = "DELETE FROM Event_Exist where eventid = ?";
	private static final String UPDATE_STMT = "UPDATE Event_Exist set empno=?, starttime=?, endtime=?, bgcolor=?, title=?, ecno=?, eventremark=?, rendering=? where eventid = ?";

	private static final String GET_ALL_SCORE = "SELECT eventid, empno, starttime, endtime, bgcolor, title, ecno, eventremark, rendering FROM Event_Exist";
	private static final String GET_EMP_BYNO = "SELECT eventid, empno, starttime, endtime, bgcolor, title, ecno, eventremark, rendering FROM Event_Exist where empno=?";

	
	
	@Override
	public void insert(EventVO eventVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setInt(1, eventVO.getEmpno());
			pstmt.setTimestamp(2, eventVO.getStarttime());
			pstmt.setTimestamp(3, eventVO.getEndtime());
			pstmt.setString(4, eventVO.getBgcolor());
			pstmt.setString(5, eventVO.getTitle());
			pstmt.setString(6, eventVO.getEcno());
			pstmt.setString(7, eventVO.getEventremark());
			pstmt.setString(8, eventVO.getRendering());

			pstmt.executeUpdate();

			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}

	@Override
	public void update(EventVO eventVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_STMT);

			pstmt.setInt(1, eventVO.getEmpno());
			pstmt.setTimestamp(2, eventVO.getStarttime());
			pstmt.setTimestamp(3, eventVO.getEndtime());
			pstmt.setString(4, eventVO.getBgcolor());
			pstmt.setString(5, eventVO.getTitle());
			pstmt.setString(6, eventVO.getEcno());
			pstmt.setString(7, eventVO.getEventremark());
			pstmt.setString(8, eventVO.getRendering());
			pstmt.setInt(9, eventVO.getEventid());

			pstmt.executeUpdate();

			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}

	@Override
	public void delete(Integer eventid) {
		int updateCount_EMPs = 0;

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			
			pstmt = con.prepareStatement(DELETE_STMT);
			pstmt.setInt(1, eventid);
			updateCount_EMPs = pstmt.executeUpdate();
			
			System.out.println("刪除事件id＝" + eventid +"有"+ updateCount_EMPs
					+ "筆被刪除");
			
			// Handle any SQL errors
		} catch (SQLException se) {
			if (con != null) {
				try {
					// 3●設定於當有exception發生時之catch區塊內
					con.rollback();
				} catch (SQLException excep) {
					throw new RuntimeException("rollback error occured. "
							+ excep.getMessage());
				}
			}
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}

	@Override
	public EventVO findByPrimaryKey(Integer eventid) {

		EventVO eventVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, eventid);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				
				eventVO = new EventVO();
				eventVO.setEventid(rs.getInt("eventid"));
				eventVO.setEmpno(rs.getInt("empno"));
				eventVO.setStarttime(rs.getTimestamp("starttime"));
				eventVO.setEndtime(rs.getTimestamp("endtime"));
				eventVO.setBgcolor(rs.getString("bgcolor"));
				eventVO.setTitle(rs.getString("title"));
				eventVO.setEcno(rs.getString("ecno"));
				eventVO.setEventremark(rs.getString("eventremark"));
				eventVO.setRendering(rs.getString("rendering"));
				
			}

			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return eventVO;
	}

	@Override
	public List<EventVO> getAll() {
		List<EventVO> list = new ArrayList<EventVO>();
		EventVO eventVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				eventVO = new EventVO();
				eventVO.setEventid(rs.getInt("eventid"));
				eventVO.setEmpno(rs.getInt("empno"));
				eventVO.setStarttime(rs.getTimestamp("starttime"));
				eventVO.setEndtime(rs.getTimestamp("endtime"));
				eventVO.setBgcolor(rs.getString("bgcolor"));
				eventVO.setTitle(rs.getString("title"));
				eventVO.setEcno(rs.getString("ecno"));
				eventVO.setEventremark(rs.getString("eventremark"));
				eventVO.setRendering(rs.getString("rendering"));
				list.add(eventVO); // Store the row in the list
			}

			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return list;
	}
	@Override
	public List<EventVO> getAll_score() {
		List<EventVO> list = new ArrayList<EventVO>();
		EventVO eventVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_SCORE);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				eventVO = new EventVO();
				eventVO.setEventid(rs.getInt("eventid"));
				eventVO.setEmpno(rs.getInt("empno"));
				eventVO.setStarttime(rs.getTimestamp("starttime"));
				eventVO.setEndtime(rs.getTimestamp("endtime"));
				eventVO.setBgcolor(rs.getString("bgcolor"));
				eventVO.setTitle(rs.getString("title"));
				eventVO.setEcno(rs.getString("ecno"));
				eventVO.setEventremark(rs.getString("eventremark"));
				eventVO.setRendering(rs.getString("rendering"));
				list.add(eventVO); // Store the row in the list
			}

			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return list;
	}
	
	
	
	@Override
	public List<EventVO> getEmpEvent(Integer empno) {
		
		List<EventVO> list = new ArrayList<EventVO>();
		EventVO eventVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_EMP_BYNO);
			pstmt.setInt(1, empno);
			rs = pstmt.executeQuery();
			

			while (rs.next()) {
				eventVO = new EventVO();
				eventVO.setEventid(rs.getInt("eventid"));
				eventVO.setEmpno(rs.getInt("empno"));
				eventVO.setStarttime(rs.getTimestamp("starttime"));
				eventVO.setEndtime(rs.getTimestamp("endtime"));
				eventVO.setBgcolor(rs.getString("bgcolor"));
				eventVO.setTitle(rs.getString("title"));
				eventVO.setEcno(rs.getString("ecno"));
				eventVO.setEventremark(rs.getString("eventremark"));
				eventVO.setRendering(rs.getString("rendering"));
				list.add(eventVO); // Store the row in the list
			}

			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return list;
	}
	
	
	

//	@Override
//	public List<EventVO> getEmpEvent(Integer empno) {
//		
//		List<EventVO> list = new ArrayList<EventVO>();
//		EventVO eventVO = null;
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//
//		try {
//
//			con = ds.getConnection();
//			pstmt = con.prepareStatement(GET_EMP_BYNO);
//			pstmt.setInt(1, empno);
//			rs = pstmt.executeQuery();
//			
//
//			while (rs.next()) {
//				eventVO = new EventVO();
//				eventVO.setEventid(rs.getInt("eventid"));
//				eventVO.setEmpno(rs.getInt("empno"));
//				eventVO.setStarttime(rs.getTimestamp("starttime"));
//				eventVO.setEndtime(rs.getTimestamp("endtime"));
//				eventVO.setBgcolor(rs.getString("bgcolor"));
//				eventVO.setTitle(rs.getString("title"));
//				eventVO.setEcno(rs.getString("ecno"));
//				eventVO.setEventremark(rs.getString("eventremark"));
//				list.add(eventVO); // Store the row in the list
//			}
//
//			// Handle any SQL errors
//		} catch (SQLException se) {
//			throw new RuntimeException("A database error occured. "
//					+ se.getMessage());
//		} finally {
//			if (rs != null) {
//				try {
//					rs.close();
//				} catch (SQLException se) {
//					se.printStackTrace(System.err);
//				}
//			}
//			if (pstmt != null) {
//				try {
//					pstmt.close();
//				} catch (SQLException se) {
//					se.printStackTrace(System.err);
//				}
//			}
//			if (con != null) {
//				try {
//					con.close();
//				} catch (Exception e) {
//					e.printStackTrace(System.err);
//				}
//			}
//		}
//		return list;
//	}
//	
	

}
