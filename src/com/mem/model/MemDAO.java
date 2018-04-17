package com.mem.model;

import java.sql.Connection;
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

	// 針對一個資料庫 ,共用DataSource
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/AntiDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	private static final String INSERT_STMT = "INSERT INTO mem (mem_id,mem_acc,mem_pw,mem_name,mem_email,mem_addr,mem_tel,mem_status,mem_sex,mem_introduction,mem_exp_owner) VALUES ('M'||LPAD(to_char(MEM_pk_seq.NEXTVAL), 6, '0'),?,?,?,?,?,?,?,?,?,?)";
	private static final String GET_ALL_STMT = "SELECT * FROM mem  order by mem_id";
	private static final String GET_ONE_STMT = "SELECT * FROM mem where mem_id = ?";
	private static final String UPDATE = "UPDATE mem set mem_pw=?, mem_name=?,mem_email=?,mem_addr=?,mem_tel=? , mem_status=? ,mem_introduction=?,mem_exp_owner=? where mem_id = ?";

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
			pstmt.setString(7, memVO.getMem_status());
			;
			pstmt.setString(8, memVO.getMem_sex());
			pstmt.setString(9, memVO.getMem_introduction());
			pstmt.setString(10, memVO.getMem_exp_owner());

			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
			// se.printStackTrace();
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
			pstmt.setString(7, memVO.getMem_introduction());
			pstmt.setString(8, memVO.getMem_exp_owner());
			pstmt.setString(9, memVO.getMem_id());
			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// se.printStackTrace();
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

			con = ds.getConnection();
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

			con = ds.getConnection();
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
}