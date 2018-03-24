package com.guideComm.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class GuideCommDAO implements GuideComm_interface {

	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/AntiDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	private static final String INSERT_STMT = "INSERT INTO guide_comm(comm_id,guide_id,mem_id,commnet_content,comm_status)"
			+ "VALUES('GC'||LPAD(to_char(GUIDE_PK_SEQ.NEXTVAL), 6, '0'),?,?,?,?)";
	private static final String UPDATE = "UPDATE guide_comm set commnet_content=?, comm_status=? where comm_id = ?";
	private static final String DELETE = "DELETE FROM guide_comm where comm_id = ?";
	private static final String GET_ONE_STMT = "SELECT comm_id,guide_id,mem_id,commnet_content,guide_commnet_time,comm_status FROM guide_comm where comm_id = ?";

	@Override
	public void insert(GuideCommVO guideCommVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);
			pstmt.setString(1, guideCommVO.getGuideId());
			pstmt.setString(2, guideCommVO.getMemId());
			pstmt.setString(3, guideCommVO.getCommContent());
			pstmt.setInt(4, 2);

			pstmt.executeUpdate();

			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("資料庫錯誤" + se.getMessage());
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
	public void update(GuideCommVO guideCommVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, guideCommVO.getCommContent());
			pstmt.setInt(2, guideCommVO.getCommStatus());
			pstmt.setString(3, guideCommVO.getCommId());

			System.out.println(guideCommVO.toString());

			int a = pstmt.executeUpdate();
			System.out.println(a);

		} catch (SQLException se) {
			throw new RuntimeException("資料庫錯誤" + se.getMessage());
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
	public void delete(String commId) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, commId);
			pstmt.executeUpdate();

		} catch (SQLException se) {
			throw new RuntimeException("資料庫錯誤" + se.getMessage());
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
	public GuideCommVO findByPrimaryKey(String commId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		GuideCommVO guideCommVO = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1, commId);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				guideCommVO = new GuideCommVO();
				guideCommVO.setCommId(rs.getString("comm_id"));
				guideCommVO.setGuideId(rs.getString("guide_id"));
				guideCommVO.setMemId(rs.getString("mem_id"));
				guideCommVO.setCommContent(rs.getString("commnet_content"));
				guideCommVO.setGuideCommTime(rs.getTimestamp("guide_commnet_time"));
				guideCommVO.setCommStatus(rs.getInt("comm_status"));
			}

		} catch (SQLException se) {
			throw new RuntimeException("資料庫錯誤" + se.getMessage());
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

		return guideCommVO;
	}

	@Override
	public List<GuideCommVO> getAll() {
		return null;
	}

}
