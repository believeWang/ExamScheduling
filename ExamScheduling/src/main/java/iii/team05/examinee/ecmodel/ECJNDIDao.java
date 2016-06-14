package iii.team05.examinee.ecmodel;



import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.sql.DataSource;


public class ECJNDIDao implements ECDao_interface {



	private static final String INSERT_STMT = "insert into Examinee_Cat values (?,?,?,?,?,?)";
	private static final String GET_ALL_STMT = "SELECT * FROM Examinee_Cat";
	private static final String GET_ONE_STMT = "SELECT * FROM Examinee_Cat where ecno = ?";
	
	
	private static final String DELETE_ECs = "DELETE FROM Examinee_Cat where ecno = ?";
	
	
	private static final String UPDATE = "UPDATE Examinee_Cat set ecname=?, ecemail=?,ecpsd=?,ecstatus=?,ecremark1=? where ecno = ?";
	private static DataSource ds = null;
	static {
        try {
    		
        	
        	InitialContext cxt = new InitialContext();
        	 ds = (DataSource) cxt.lookup( "java:/comp/env/jdbc/ESDB" );

        	if ( ds == null ) {
        	   throw new Exception("Data source not found!");
        	}   
        	
        	
        	
        	 
        } catch (Throwable ex) {
            // Make sure you log the exception, as it might be swallowed
            System.err.println("Initial Connection creation failed." + ex);
            throw new ExceptionInInitializerError(ex);
        }
	}
	
	@Override
	public void insert(ECVO examineeCatVO){
		Connection con = null;
		PreparedStatement pstmt = null;
		try{
			con=ds.getConnection();
		pstmt=con.prepareStatement(INSERT_STMT);
		pstmt.setString(1,examineeCatVO.getEcno() );
		pstmt.setString(2,examineeCatVO.getEcname() );
		pstmt.setString(3,examineeCatVO.getEcemail() );
		pstmt.setBytes(4,examineeCatVO.getEcpsd());
		pstmt.setBoolean(5,examineeCatVO.getEcstatus() );
		pstmt.setString(6,examineeCatVO.getEcremark1() );
		pstmt.executeUpdate();
		
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			if(con!=null)
				try {
					
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
	}

	@Override
	public void update(ECVO examineeCatVO) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		try{
			con=ds.getConnection();
		pstmt=con.prepareStatement(UPDATE);
		pstmt.setString(6,examineeCatVO.getEcno() );
		pstmt.setString(1,examineeCatVO.getEcname() );
		pstmt.setString(2,examineeCatVO.getEcemail() );
		pstmt.setBytes(3,examineeCatVO.getEcpsd());
		pstmt.setBoolean(4,examineeCatVO.getEcstatus() );
		pstmt.setString(5,examineeCatVO.getEcremark1() );
		pstmt.executeUpdate();
		
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			if(con!=null)
				try {
					
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		
	}

	@Override
	public void delete(String ecno) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try{
			con=ds.getConnection();
		pstmt=con.prepareStatement(DELETE_ECs);
		pstmt.setString(1,ecno);
		
		pstmt.executeUpdate();
		
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			if(con!=null)
				try {
					
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		
	}

	@Override
	public ECVO findByPrimaryKey(String ecno) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ECVO examineeCatVO=null;
		try{
			con=ds.getConnection();
		pstmt=con.prepareStatement(GET_ONE_STMT);
		pstmt.setString(1,ecno);
		
		ResultSet rs= pstmt.executeQuery();
		
		if(rs.next()){
			examineeCatVO =new  ECVO();
			examineeCatVO.setEcno(rs.getString(1));
			examineeCatVO.setEcname(rs.getString(2));
			examineeCatVO.setEcemail(rs.getString(3));
			examineeCatVO.setEcpsd(rs.getBytes(4));
			examineeCatVO.setEcstatus(rs.getBoolean(5));
			examineeCatVO.setEcremark1(rs.getString(6));
		}
		
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			if(con!=null)
				try {
					
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		return examineeCatVO;
	}

	@Override
	public List<ECVO> getAll() {
		List<ECVO> list = new ArrayList<ECVO>();
		ECVO examineeCatVO=null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			con=ds.getConnection();
		pstmt=con.prepareStatement(GET_ALL_STMT);
		
		
		 rs= pstmt.executeQuery();
		
		while(rs.next()){
			examineeCatVO =new  ECVO();
			examineeCatVO.setEcno(rs.getString(1));
			examineeCatVO.setEcname(rs.getString(2));
			examineeCatVO.setEcemail(rs.getString(3));
			examineeCatVO.setEcpsd(rs.getBytes(4));
			examineeCatVO.setEcstatus(rs.getBoolean(5));
			examineeCatVO.setEcremark1(rs.getString(6));
			list.add(examineeCatVO);
		}
		
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			if(rs!=null)
				try {
					rs.close();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			if(pstmt!=null)
				try {
					pstmt.close();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}	
			if(con!=null)
				try {
					
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		
		
	
		return list;
	}

}

	