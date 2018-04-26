package com.mem.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class MemJDBCDAO implements MemDAO_interface {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "BA107G1";
	String passwd = "BA107G1";

	private static final String INSERT_STMT = "INSERT INTO mem (mem_id,mem_acc,mem_pw,mem_name,mem_email,mem_addr,mem_tel,mem_status,mem_sex,mem_introduction,mem_exp_owner) VALUES ('M'||LPAD(to_char(MEM_pk_seq.NEXTVAL), 6, '0'),?,?,?,?,?,?,?,?,?,?)";
	private static final String GET_ALL_STMT = "SELECT * FROM mem  order by mem_id";
	private static final String GET_ONE_STMT = "SELECT * FROM mem where mem_id = ?";
	private static final String UPDATE = "UPDATE mem set mem_pw=?, mem_name=?,mem_email=?,mem_addr=?,mem_tel=? , mem_status=? ,mem_introduction=?,mem_exp_owner=? where mem_id = ?";

	@Override
	public void insert(MemVO memVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);


			
			pstmt.setString(1, memVO.getMem_acc());
			pstmt.setString(2, memVO.getMem_pw());
			pstmt.setString(3, memVO.getMem_name());
			pstmt.setString(4, memVO.getMem_email());
			pstmt.setString(5, memVO.getMem_addr());
			pstmt.setString(6, memVO.getMem_tel());
			pstmt.setString(7, memVO.getMem_status());
			pstmt.setString(8,memVO.getMem_sex());
			pstmt.setString(9,memVO.getMem_introduction());
			pstmt.setString(10, memVO.getMem_exp_owner());
			
			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
//			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
			se.printStackTrace();
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
			
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);
			

			
			pstmt.setString(1, memVO.getMem_pw());
			pstmt.setString(2, memVO.getMem_name());
			pstmt.setString(3, memVO.getMem_email());
			pstmt.setString(4, memVO.getMem_addr());
			pstmt.setString(5, memVO.getMem_tel());
			pstmt.setString(6, memVO.getMem_status());
			pstmt.setString(7, memVO.getMem_introduction());
			pstmt.setString(8, memVO.getMem_exp_owner());
			pstmt.setString(9, memVO.getMem_id());	
			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
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

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1, mem_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVo 也稱為 Domain objects
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
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
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
	public List<MemVO> getAll() {
		List<MemVO> list = new ArrayList<MemVO>();
		MemVO memVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVO 也稱為 Domain objects
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
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
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

	public static void main(String[] args) {

		MemJDBCDAO dao = new MemJDBCDAO();

		 // 新增
		 MemVO memVO1 = new MemVO();
//		 memVO1.setMem_acc("a98646bcb");
//		 memVO1.setMem_pw("a5c1e46c");
//		 memVO1.setMem_name("測試名2");
//		 memVO1.setMem_email("321bedta@gmail.com");
//		 memVO1.setMem_addr("測試新增用地址3");
//		 memVO1.setMem_tel("0983666665");
//		 memVO1.setMem_status("一般會員");
//		 memVO1.setMem_sex("男");
//		 memVO1.setMem_introduction("JAVA好簡單32");
//		 memVO1.setMem_exp_owner("關閉");
//		 dao.insert(memVO1);
//		 
//		
//		 // 修改
		 MemVO memVO2 = new MemVO();
		 memVO2.setMem_id("M000001");
		 memVO2.setMem_pw("12345");
		 memVO2.setMem_name("PeTeR");
		 memVO2.setMem_email("peter123456peter@gmail.com");
		 memVO2.setMem_addr("台北市非洲區厚德路69巷87號");
		 memVO2.setMem_tel("0983123487");
		 memVO2.setMem_status("停權會員");
		 memVO2.setMem_introduction("安安妳好測試修改成功>皿<");
		 memVO2.setMem_exp_owner("關閉");
		 dao.update(memVO2);
		 
//
//		// 查詢
//		MemVO memVO3 = dao.findByPrimaryKey("M000001");
//		System.out.print(memVO3.getMem_id() + ",");
//		System.out.print(memVO3.getMem_acc() + ",");
//		System.out.print(memVO3.getMem_pw() + ",");
//		System.out.print(memVO3.getMem_name() + ",");
//		System.out.print(memVO3.getMem_email() + ",");
//		System.out.print(memVO3.getMem_addr() + ",");
//		System.out.print(memVO3.getMem_tel() + ",");
//		System.out.print(memVO3.getMem_status() + ",");
//		System.out.print(memVO3.getMem_rgdate() + ",");
//		System.out.print(memVO3.getMem_sex() + ",");
//		System.out.print(memVO3.getMem_introduction() + ",");
//		System.out.println(memVO3.getMem_exp_owner() + ",");
//		System.out.println("-★-☆-★-☆-★-☆-★-☆-★-☆-★-☆-★");

////	 查詢
//		List<MemVO> list = dao.getAll();
//		for (MemVO aMem : list) {
//		System.out.print(aMem.getMem_id() + ",");
//		System.out.print(aMem.getMem_acc() + ",");
//		System.out.print(aMem.getMem_pw() + ",");
//		System.out.print(aMem.getMem_name() + ",");
//		System.out.print(aMem.getMem_email() + ",");
//		System.out.print(aMem.getMem_addr() + ",");
//		System.out.print(aMem.getMem_tel()+ ",");
//		System.out.print(aMem.getMem_status()+ ",");
//		System.out.println(aMem.getMem_rgdate());
//		System.out.print(aMem.getMem_sex() + ",");
//		System.out.print(aMem.getMem_introduction() + ",");
//		System.out.println(aMem.getMem_exp_owner() + ",");
//		System.out.println("-★-☆-★-☆-★-☆-★-☆-★-☆-★-☆-★");
//		}
	}

	@Override
	public boolean checkLogin(String mem_acc, String mem_pw) {
		return false;
	}

	@Override
	public MemVO login(String mem_acc) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateIntrd(String introduction, String mem_id) {
		// TODO Auto-generated method stub
		
	}
}