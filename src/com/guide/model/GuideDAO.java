package com.guide.model;

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

import com.guideImg.model.GuideImgVO;

public class GuideDAO implements GuideDAO_interface {
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/AntiDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	private static final String INSERT_STMT = "INSERT INTO guide(guide_id,mem_id,guide_title,guide_content,guide_read_size,guide_comm_size,guide_vote_size,guide_status,guide_area)"
			+ "VALUES('G'||LPAD(to_char(GUIDE_PK_SEQ.NEXTVAL), 6, '0'),?,?,?,?,?,?,?,?)";
	private static final String GET_ALL_STMT = "SELECT guide_id,mem_id,guide_title,guide_content,guide_create_time,guide_read_size,guide_comm_size,guide_vote_size,guide_status FROM guide order by guide_id";
	// private static final String GET_ONE_STMT = "SELECT
	// guide_id,mem_id,guide_title,guide_content,guide_create_time,guide_read_size,guide_comm_size,guide_vote_size,guide_status
	// FROM guide where guide_id = ?";
	private static final String DELETE = "DELETE FROM guide where guide_id = ?";
	private static final String UPDATE = "UPDATE guide set guide_title=?, guide_content=?, guide_status=? where guide_id = ?";
	private static final String GET_ONE_STMT = "SELECT GU.GUIDE_ID, GU.MEM_ID, GU.GUIDE_TITLE, GU.GUIDE_CONTENT, GU.GUIDE_AREA, GU.GUIDE_CREATE_TIME, GU.GUIDE_READ_SIZE, GU.GUIDE_COMM_SIZE, GU.GUIDE_VOTE_SIZE, GU.GUIDE_STATUS, GI.G_IMG_ID, GI.GUIDE_IMG_CONTENT "
			+ "FROM GUIDE GU LEFT JOIN GD_IMG GI " + "ON GU.GUIDE_ID = GI.GUIDE_ID " + "WHERE GU.GUIDE_ID = ?";

	@Override
	public void insert(GuideVO guideVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, guideVO.getMemId());
			pstmt.setString(2, guideVO.getGuideTitle());
			pstmt.setString(3, guideVO.getGuideContent());
			pstmt.setInt(4, 0);
			pstmt.setInt(5, 0);
			pstmt.setInt(6, 0);
			pstmt.setInt(7, 2);
			pstmt.setString(8, guideVO.getGuideArea());

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
	public void update(GuideVO guideVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, guideVO.getGuideTitle());
			pstmt.setString(2, guideVO.getGuideContent());
			pstmt.setInt(3, guideVO.getGuideStatus());
			pstmt.setString(4, guideVO.getGuideId());
			// a=被修改的資料幾筆
			int a = pstmt.executeUpdate();
			System.out.println(a);

			// Handle any driver errors
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
	public void delete(String guideId) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, guideId);

			pstmt.executeUpdate();

			// Handle any driver errors
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

	// @Override
	// public GuideVO findByPrimaryKey(String guideId) {
	//
	// GuideVO guideVO = null;
	// Connection con = null;
	// PreparedStatement pstmt = null;
	// ResultSet rs = null;
	//
	// try {
	//
	// con = ds.getConnection();
	// pstmt = con.prepareStatement(GET_ONE_STMT);
	//
	// pstmt.setString(1, guideId);
	//
	// rs = pstmt.executeQuery();
	//
	// while (rs.next()) {
	//
	// guideVO = new GuideVO();
	// guideVO.setGuideId(rs.getString("guide_id"));
	// guideVO.setMemId(rs.getString("mem_id"));
	// guideVO.setGuideTitle(rs.getString("guide_title"));
	// guideVO.setGuideContent(rs.getString("guide_content"));
	// guideVO.setGuideCreateTime(rs.getTimestamp("guide_create_time"));
	// guideVO.setGuideReadSize(rs.getInt("guide_read_size"));
	// guideVO.setGuideCommSize(rs.getInt("guide_comm_size"));
	// guideVO.setGuideVoteSize(rs.getInt("guide_vote_size"));
	// guideVO.setGuideStatus(rs.getInt("guide_status"));
	// }
	// } catch (SQLException se) {
	// throw new RuntimeException("資料庫錯誤" + se.getMessage());
	// // Clean up JDBC resources
	// } finally {
	// if (rs != null) {
	// try {
	// rs.close();
	// } catch (SQLException se) {
	// se.printStackTrace(System.err);
	// }
	// }
	// if (pstmt != null) {
	// try {
	// pstmt.close();
	// } catch (SQLException se) {
	// se.printStackTrace(System.err);
	// }
	// }
	// if (con != null) {
	// try {
	// con.close();
	// } catch (Exception e) {
	// e.printStackTrace(System.err);
	// }
	// }
	// }
	// return guideVO;
	// }

	@Override
	public GuideVO findByPrimaryKey(String guideId) {

		GuideVO guideVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1, guideId);

			rs = pstmt.executeQuery();

			List<GuideImgVO> guideImgList = new ArrayList<GuideImgVO>();
			while (rs.next()) {
				guideVO = new GuideVO();
				guideVO.setGuideId(rs.getString("guide_id"));
				guideVO.setMemId(rs.getString("mem_id"));
				guideVO.setGuideTitle(rs.getString("guide_title"));
				guideVO.setGuideContent(rs.getString("guide_content"));
				guideVO.setGuideCreateTime(rs.getTimestamp("guide_create_time"));
				guideVO.setGuideReadSize(rs.getInt("guide_read_size"));
				guideVO.setGuideCommSize(rs.getInt("guide_comm_size"));
				guideVO.setGuideVoteSize(rs.getInt("guide_vote_size"));
				guideVO.setGuideStatus(rs.getInt("guide_status"));
				guideVO.setGuideArea(rs.getString("guide_area"));
				GuideImgVO guideImgVO = new GuideImgVO();
				guideImgVO.setGuideImgId(rs.getString("g_img_id"));
				guideImgList.add(guideImgVO);

			}
			guideVO.setGuideImgList(guideImgList);

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
		return guideVO;
	}

	@Override
	public List<GuideVO> getAll() {
		List<GuideVO> list = new ArrayList<GuideVO>();
		GuideVO guideVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVO 也稱為 Domain objects
				guideVO = new GuideVO();
				guideVO.setGuideId(rs.getString("guide_id"));
				guideVO.setMemId(rs.getString("mem_id"));
				guideVO.setGuideTitle(rs.getString("guide_title"));
				guideVO.setGuideContent(rs.getString("guide_content"));
				guideVO.setGuideCreateTime(rs.getTimestamp("guide_create_time"));
				guideVO.setGuideReadSize(rs.getInt("guide_read_size"));
				guideVO.setGuideCommSize(rs.getInt("guide_comm_size"));
				guideVO.setGuideVoteSize(rs.getInt("guide_vote_size"));
				guideVO.setGuideStatus(rs.getInt("guide_status"));
				guideVO.setGuideArea(rs.getString("guide_area"));
				list.add(guideVO);
			}

			// Handle any driver errors
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

		return list;
	}

}
