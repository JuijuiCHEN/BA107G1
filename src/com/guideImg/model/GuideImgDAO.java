package com.guideImg.model;

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

public class GuideImgDAO implements GuideImgDAO_interface {
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/AntiDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	private static final String INSERT_STMT = "INSERT INTO gd_img(g_img_id,guide_id,guide_img_content)"
			+ "VALUES('GI'||LPAD(to_char(GUIDE_PK_SEQ.NEXTVAL), 6, '0'),?,?)";
	private static final String DELETE = "DELETE FROM gd_img where g_img_id = ?";
	private static final String GET_ONE_STMT = "SELECT * FROM gd_img where g_img_id = ?";
	private static final String GET_ALL_IMG_FROM_ONE_ID = "SELECT * FROM gd_img WHERE GUIDE_ID = ?";
	// private static final String GET_ALL_STMT = "SELECT * FROM gd_img where guide_id = ?";

	@Override
	public void insert(GuideImgVO guideImgVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, guideImgVO.getGuideId());
			pstmt.setBytes(2, guideImgVO.getGuideImgContent());

			pstmt.executeUpdate();

			// Handle any SQL errors
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

	// 在同一個連線(參數傳進來的), 新增文章後、再繼續對相同文章新增多張圖
	@Override
	public void insertList(String guideId, List<GuideImgVO> imgList, Connection con) {
		PreparedStatement pstmt = null;
		try {
			// 跑迴圈對於一張圖做一次新增, 直到沒有圖片
			for (GuideImgVO guideImgVO : imgList) {
				pstmt = con.prepareStatement(INSERT_STMT);
				pstmt.setString(1, guideId);
				pstmt.setBytes(2, guideImgVO.getGuideImgContent());
				pstmt.executeUpdate();
			}
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
		}
	}

	@Override
	public void delete(String guideImgId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, guideImgId);
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
	public GuideImgVO findByPrimaryKey(String guideImgId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		GuideImgVO guideImgVO = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1, guideImgId);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				guideImgVO = new GuideImgVO();
				guideImgVO.setGuideImgId(rs.getString("g_img_id"));
				guideImgVO.setGuideId(rs.getString("guide_id"));
				guideImgVO.setGuideImgContent(rs.getBytes("guide_img_content"));
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

		return guideImgVO;
	}

	// @Override
	// public List<GuideImgVO> oneIdGetAll(String guideId) {
	// Connection con = null;
	// PreparedStatement pstmt = null;
	// GuideImgVO guideImgVO = null;
	// ResultSet rs = null;
	// List<GuideImgVO> data =
	//
	// try {
	// con = ds.getConnection();
	// pstmt = con.prepareStatement(GET_ALL_STMT);
	//
	// pstmt.setString(1, guideId);
	// rs = pstmt.executeQuery();
	//
	// while (rs.next()) {
	// guideImgVO = new GuideImgVO();
	// guideImgVO.setGuideImgId(rs.getString("g_img_id"));
	// guideImgVO.setGuideId(rs.getString("guide_id"));
	// guideImgVO.setGuideImgContent(rs.getBytes("guide_img_content"));
	// }
	//
	// } catch (SQLException se) {
	// throw new RuntimeException("資料庫錯誤" + se.getMessage());
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
	//
	// return guideImgVO;
	// }

	@Override
	public List<String> getAllImgFromId(String guideId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<String> guideImgList = new ArrayList<String>();

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_IMG_FROM_ONE_ID);

			pstmt.setString(1, guideId);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				if (null == rs.getString("GUIDE_IMG_CONTENT")) {
					continue;
				}
				guideImgList.add(rs.getString("G_IMG_ID"));
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

		return guideImgList;
	}

}
