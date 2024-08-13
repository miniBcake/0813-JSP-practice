package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.MemberDTO;
import model.JDBCUtil;

public class MemberDAO {
	private final static String INSERT = "INSERT INTO JSP_MEMBER(MID, PASSWORD, NAME, ROLE) VALUES(?, ?, ?, 'USER')";
	private final static String UPDATE_NAME = "UPDATE JSP_MEMBER SET NAME = ? WHERE MID = ?";
	private final static String DELETE = "DELETE FROM JSP_MEMBER WHERE MID = ?";
	private final static String SELECT_LOGIN = "SELECT MID, NAME, ROLE FROM JSP_MEMBER WHERE MID = ? AND PASSWORD = ?";
	private final static String SELECT_ALL = "SELECT MID, NAME, ROLE FROM JSP_MEMBER";
	
	
	public boolean insert(MemberDTO memberDTO) {
		System.out.println("insert start");
		
		Connection conn = JDBCUtil.connect();
		PreparedStatement pstmt = null;
		boolean flag = false;
		
		try {
			pstmt = conn.prepareStatement(INSERT);
			pstmt.setString(1, memberDTO.getMid());
			pstmt.setString(2, memberDTO.getPassword());
			pstmt.setString(3, memberDTO.getName());
			int num = pstmt.executeUpdate();
			if(num > 0) {				
				flag = true;
				System.out.println("insert success :"+num);
			}
		} catch (SQLException e) {
			System.err.println("insert SQL fail");
		} catch (Exception e) {
			System.err.println("insert exception fail");
		} finally {
			if(!JDBCUtil.disconnect(conn, pstmt)){
				System.err.println("insert disconnect fail");
				return false;
			}
			System.out.println("insert disconnect success ");
		}
		System.out.println("insert end");
		return flag;
	}
	
	
	public boolean update(MemberDTO memberDTO) {
		System.out.println("update start");
		
		Connection conn = JDBCUtil.connect();
		PreparedStatement pstmt = null;
		boolean flag = false;
		
		try {
			pstmt = conn.prepareStatement(UPDATE_NAME);
			pstmt.setString(1, memberDTO.getName());
			pstmt.setString(2, memberDTO.getMid());
			int num = pstmt.executeUpdate();
			if(num > 0) {				
				flag = true;
				System.out.println("update success :"+num);
			}
		} catch (SQLException e) {
			System.err.println("update SQL fail");
		} catch (Exception e) {
			System.err.println("update exception fail");
		} finally {
			if(!JDBCUtil.disconnect(conn, pstmt)){
				System.err.println("update disconnect fail");
				return false;
			}
			System.out.println("update disconnect success ");
		}
		System.out.println("update end");
		return flag;
	}
	
	
	public boolean delete(MemberDTO memberDTO) {
		System.out.println("delete start");
		
		Connection conn = JDBCUtil.connect();
		PreparedStatement pstmt = null;
		boolean flag = false;
		
		try {
			pstmt = conn.prepareStatement(DELETE);
			pstmt.setString(1, memberDTO.getMid());
			int num = pstmt.executeUpdate();
			if(num > 0) {				
				flag = true;
				System.out.println("delete success :"+num);
			}
		} catch (SQLException e) {
			System.err.println("delete SQL fail");
		} catch (Exception e) {
			System.err.println("delete exception fail");
		} finally {
			if(!JDBCUtil.disconnect(conn, pstmt)){
				System.err.println("delete disconnect fail");
				return false;
			}
			System.out.println("delete disconnect success ");
		}
		System.out.println("delete end");
		return flag;
	}
	
	
	public ArrayList<MemberDTO> selectAll(MemberDTO memberDTO){
		System.out.println("selectAll start");
		Connection conn = JDBCUtil.connect();
		PreparedStatement pstmt = null;
		ArrayList<MemberDTO> datas = new ArrayList<>();
		MemberDTO data = null;
		try {
			pstmt = conn.prepareStatement(SELECT_ALL);
			ResultSet result = pstmt.executeQuery();
			
			while(result.next()) {
				data = new MemberDTO();
				data.setMid(result.getString("MID"));
				data.setName(result.getString("NAME"));
				data.setRole(result.getString("ROLE"));
				datas.add(data);
			}
			System.out.println("selectAll success");
		} catch (SQLException e) {
			datas.clear();
			System.err.println("selectAll SQL fail");
		} catch (Exception e) {
			datas.clear();
			System.err.println("selectAll exception fail");
		} finally {
			if(!JDBCUtil.disconnect(conn, pstmt)) {
				datas.clear();
				System.err.println("selectAll disconnect fail");
			}
		}
		System.out.println("selectAll end");
		return datas;
	}
	
	
	public MemberDTO selectOne(MemberDTO memberDTO){
		System.out.println("selectOne start");
		
		Connection conn = JDBCUtil.connect();
		PreparedStatement pstmt = null;
		MemberDTO data = null;
		try {
			pstmt = conn.prepareStatement(SELECT_LOGIN);
			pstmt.setString(1, memberDTO.getMid());
			pstmt.setString(2, memberDTO.getPassword());
			ResultSet result = pstmt.executeQuery();
			
			if(result.next()) {
				data = new MemberDTO();
				data.setMid(result.getString("MID"));
				data.setName(result.getString("NAME"));
				data.setRole(result.getString("ROLE"));
			}
			System.out.println("selectOne success");
		} catch (SQLException e) {
			data = null;
			System.err.println("selectOne SQL fail");
		} catch (Exception e) {
			data = null;
			System.err.println("selectOne exception fail");
		} finally {
			if(!JDBCUtil.disconnect(conn, pstmt)) {
				data = null;
				System.err.println("selectOne disconnect fail");
			}
		}
		System.out.println("selectOne end");
		return data;
	}
}
