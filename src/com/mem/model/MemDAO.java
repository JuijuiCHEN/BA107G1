package com.mem.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


public class MemDAO implements MemDAO_interface {
	
	//針對一個資料庫 ,共用DataSource
		private static DataSource ds = null;
		static {
			try {
				Context ctx = new InitialContext();
				ds = (DataSource) ctx.lookup("java:comp/env/jdbc/BA107G1");
			} catch (NamingException e) {
				e.printStackTrace();
			}
		}
		//新增(註冊)會員
		private static final String INSERT_STMT = "INSERT INTO mem (mem_id,mem_acc,mem_pw,mem_name,mem_email,mem_addr,mem_tel,mem_status,mem_sex,mem_introduction,mem_exp_owner) VALUES ('M'||LPAD(to_char(MEM_pk_seq.NEXTVAL), 6, '0'),?,?,?,?,?,?,?,?,?,?)";
		//取全部會員資料
		private static final String GET_ALL_STMT = "SELECT * FROM mem  order by mem_id";
		//取一個會員資料
		private static final String GET_ONE_STMT = "SELECT * FROM mem where mem_id = ?";
		//修改
		private static final String UPDATE = "UPDATE mem set mem_pw=?, mem_name=?,mem_email=?,mem_addr=?,mem_tel=? , mem_status=?,mem_sex=? ,mem_file = ? ,mem_introduction=?,mem_exp_owner=? where mem_id = ?";
		//登入會員判斷
		private static final String CHECK_LOGIN = "select mem_acc,mem_pw from MEM where mem_acc= ? and mem_pw=? ";
		//給登入用查詢
		private static final String GET_ACC = "SELECT * FROM mem where mem_acc = ?";

		private static final String UPDATE_INTRD = "UPDATE MEM SET MEM_INTRODUCTION=? WHERE MEM_ID=?";

		
		@Override
	public void insert(MemVO memVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);


			
			pstmt.setString(1, memVO.getMem_acc());
			pstmt.setString(2, memVO.getMem_pw());
			pstmt.setString(3, memVO.getMem_name());
			pstmt.setString(4, memVO.getMem_email());
			pstmt.setString(5, memVO.getMem_addr());
			pstmt.setString(6, memVO.getMem_tel());
			pstmt.setString(7, memVO.getMem_status());;
			pstmt.setString(8,memVO.getMem_sex());
			pstmt.setString(9,memVO.getMem_introduction());
			pstmt.setString(10, memVO.getMem_exp_owner());
			
			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
//			 Clean up JDBC resources
//			se.printStackTrace();
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
	public void update(MemVO memVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {


			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);
						
			pstmt.setString(1, memVO.getMem_pw());
			pstmt.setString(2, memVO.getMem_name());
			pstmt.setString(3, memVO.getMem_email());
			pstmt.setString(4, memVO.getMem_addr());
			pstmt.setString(5, memVO.getMem_tel());
			pstmt.setString(6, memVO.getMem_status());
			pstmt.setString(7, memVO.getMem_sex());
			pstmt.setBytes(8, memVO.getMem_file());
			pstmt.setString(9, memVO.getMem_introduction());
			pstmt.setString(10, memVO.getMem_exp_owner());
			pstmt.setString(11, memVO.getMem_id());	
			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (SQLException se) {
//			throw new RuntimeException("A database error occured. " + se.getMessage());
			se.printStackTrace();
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
	public MemVO findByPrimaryKey(String mem_id) {

		MemVO memVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			System.out.println("memid="+mem_id);
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1, mem_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// memVo 也稱為 Domain objects
				memVO = new MemVO();
				System.out.println("mem_id="+rs.getString("mem_id"));
				memVO.setMem_id(rs.getString("mem_id"));
				memVO.setMem_acc(rs.getString("mem_acc"));
				memVO.setMem_pw(rs.getString("mem_pw"));
				memVO.setMem_name(rs.getString("mem_name"));
				memVO.setMem_email(rs.getString("mem_email"));
				memVO.setMem_addr(rs.getString("mem_addr"));
				memVO.setMem_tel(rs.getString("mem_tel"));
				memVO.setMem_status(rs.getString("mem_status"));
				memVO.setMem_rgdate(rs.getDate("mem_rgdate"));
				memVO.setMem_sex(rs.getString("mem_sex"));
				memVO.setMem_introduction(rs.getString("mem_introduction"));
				memVO.setMem_exp_owner(rs.getString("mem_exp_owner"));
			}
			
			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
		return memVO;
	}
	@Override
	public boolean checkLogin(String mem_acc, String mem_pw){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			con = ds.getConnection();
			pstmt = con.prepareStatement(CHECK_LOGIN);
			pstmt.setString(1, mem_acc);
			pstmt.setString(2, mem_pw);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				return true;
			}
		}catch (SQLException e){
			System.out.println("UserNameIsExist指令錯誤");
		}finally{
			if(rs != null){
				try{
					rs.close();
				} catch (SQLException se){
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null){
				try{
					pstmt.close();
				} catch (SQLException se){
					se.printStackTrace(System.err);
				}
			}
			if (con != null){
				try{
					con.close();
				} catch (Exception e){
					e.printStackTrace(System.err);
				}
			}
		}
		return false;
	}
	
	@Override
	public List<MemVO> getAll() {
		List<MemVO> list = new ArrayList<MemVO>();
		MemVO memVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// memVO 也稱為 Domain objects
				memVO = new MemVO();		
				memVO.setMem_id(rs.getString("mem_id"));
				memVO.setMem_acc(rs.getString("mem_acc"));
				memVO.setMem_pw(rs.getString("mem_pw"));
				memVO.setMem_name(rs.getString("mem_name"));
				memVO.setMem_email(rs.getString("mem_email"));
				memVO.setMem_addr(rs.getString("mem_addr"));
				memVO.setMem_tel(rs.getString("mem_tel"));
				memVO.setMem_status(rs.getString("mem_status"));
				memVO.setMem_rgdate(rs.getDate("mem_rgdate"));
				memVO.setMem_sex(rs.getString("mem_sex"));
				memVO.setMem_introduction(rs.getString("mem_introduction"));
				memVO.setMem_exp_owner(rs.getString("mem_exp_owner"));
				
				
				list.add(memVO); // Store the row in the list
			}

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
		return list;
	}

	@Override
	public MemVO login(String mem_acc) {

		MemVO memVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			System.out.println("memid="+mem_acc);
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ACC);

			pstmt.setString(1, mem_acc);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// memVo 也稱為 Domain objects
				memVO = new MemVO();
				System.out.println("mem_id="+rs.getString("mem_id"));
				memVO.setMem_id(rs.getString("mem_id"));
				memVO.setMem_acc(rs.getString("mem_acc"));
				memVO.setMem_pw(rs.getString("mem_pw"));
				memVO.setMem_name(rs.getString("mem_name"));
				memVO.setMem_email(rs.getString("mem_email"));
				memVO.setMem_addr(rs.getString("mem_addr"));
				memVO.setMem_tel(rs.getString("mem_tel"));
				memVO.setMem_status(rs.getString("mem_status"));
				memVO.setMem_rgdate(rs.getDate("mem_rgdate"));
				memVO.setMem_sex(rs.getString("mem_sex"));
				memVO.setMem_introduction(rs.getString("mem_introduction"));
				memVO.setMem_exp_owner(rs.getString("mem_exp_owner"));
			}
			
			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
		return memVO;
	}

	//new add
	public void updateIntrd(String introduction, String mem_id){
		Connection con = null;
		PreparedStatement pstmt = null;

		try {


			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_INTRD);
						
			pstmt.setString(1, introduction);
			pstmt.setString(2, mem_id);
			
			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (SQLException se) {
//			throw new RuntimeException("A database error occured. " + se.getMessage());
			se.printStackTrace();
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
}