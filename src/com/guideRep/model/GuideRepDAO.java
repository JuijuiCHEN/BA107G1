package com.guideRep.model;

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

public class GuideRepDAO implements GuideRepDAO_interface {

	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/BA107G1");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	private static final String INSERT_STMT = "INSERT INTO gd_rep(guide_rep_id,guide_id,mem_id,guide_rep_content,guide_rep_status)"
			+ "VALUES('GR'||LPAD(to_char(GUIDE_PK_SEQ.NEXTVAL), 6, '0'),?,?,?,?)";
	private static final String UPDATE = "UPDATE gd_rep set guide_rep_status=? where guide_rep_id=?";
	private static final String DELETE = "DELETE FROM gd_rep where guide_rep_id = ?";
	private static final String GET_ONE_STMT = "SELECT guide_rep_id,guide_id,mem_id,guide_rep_content,guide_rep_date,guide_rep_status FROM gd_rep where guide_rep_id = ?";
	private static final String GET_ALL_STATUS = "SELECT GUIDE_REP_ID,GUIDE_ID,MEM_ID,GUIDE_REP_DATE,GUIDE_REP_CONTENT,GUIDE_REP_STATUS FROM GD_REP WHERE GUIDE_REP_STATUS=?";

	@Override
	public void insert(GuideRepVO guideRepVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);
			pstmt.setString(1, guideRepVO.getGuideId());
			pstmt.setString(2, guideRepVO.getMemId());
			pstmt.setString(3, guideRepVO.getGuideRepContent());
			pstmt.setInt(4, 1);
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
	public void update(GuideRepVO guideRepVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setInt(1, guideRepVO.getGuideRepStatus()); // 1=未審核, 2=已結案
			pstmt.setString(2, guideRepVO.getGuideRepId());

			int a = pstmt.executeUpdate();
			System.out.println("修改了" + a + "筆資料");

		} catch (SQLException se) {
			throw new RuntimeException("資料庫錯誤" + se.getMessage());
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
	public void delete(String guideRepId) {

		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, guideRepId);
			pstmt.executeUpdate();

		} catch (SQLException se) {
			throw new RuntimeException("資料庫錯誤" + se.getMessage());
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
	public GuideRepVO findByPrimaryKey(String guideRepId) {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		GuideRepVO guideRepVO = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);
			pstmt.setString(1, guideRepId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				guideRepVO = new GuideRepVO();
				guideRepVO.setGuideRepId(rs.getString("guide_rep_id"));
				guideRepVO.setGuideId(rs.getString("guide_id"));
				guideRepVO.setMemId(rs.getString("mem_id"));
				guideRepVO.setGuideRepDate(rs.getTimestamp("guide_rep_date"));
				guideRepVO.setGuideRepContent(rs.getString("guide_rep_content"));
				guideRepVO.setGuideRepStatus(rs.getInt("guide_rep_status"));
				System.out.println(guideRepVO);
			}

		} catch (SQLException se) {
			throw new RuntimeException("資料庫錯誤" + se.getMessage());
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

		return guideRepVO;
	}

	@Override
	public List<GuideRepVO> getAllStatus(Integer guideRepStatus) {

		List<GuideRepVO> guideRepList = new ArrayList<GuideRepVO>();
		GuideRepVO guideRepVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STATUS);
			pstmt.setInt(1, guideRepStatus);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				guideRepVO = new GuideRepVO();
				guideRepVO.setGuideRepId(rs.getString("GUIDE_REP_ID"));
				guideRepVO.setGuideId(rs.getString("GUIDE_ID"));
				guideRepVO.setMemId(rs.getString("MEM_ID"));

				guideRepVO.setGuideRepDate(rs.getTimestamp("GUIDE_REP_DATE"));
				guideRepVO.setGuideRepContent(rs.getString("GUIDE_REP_CONTENT"));
				guideRepVO.setGuideRepStatus(rs.getInt("GUIDE_REP_STATUS"));
				guideRepList.add(guideRepVO);
			}
		} catch (SQLException se) {
			se.printStackTrace();
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
		return guideRepList;
	}

}
