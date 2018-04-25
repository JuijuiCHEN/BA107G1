package com.guideComm.model;

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

public class GuideCommDAO implements GuideCommDAO_interface {

	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/BA107G1");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	private static final String INSERT_STMT = "INSERT INTO guide_comm(comm_id,guide_id,mem_id,commnet_content,comm_status)"
			+ "VALUES('GC'||LPAD(to_char(GUIDE_PK_SEQ.NEXTVAL), 6, '0'),?,?,?,?)";
	private static final String UPDATE = "UPDATE guide_comm set commnet_content=?, comm_status=? where comm_id = ?";
	private static final String DELETE = "DELETE FROM guide_comm where comm_id = ?";
	private static final String GET_ONE_STMT = "SELECT comm_id,guide_id,mem_id,commnet_content,guide_commnet_time,comm_status FROM guide_comm where comm_id = ?";

	// 查詢一篇文章所有留言
	private static final String GET_ALL_FROM_GUIDEID = "SELECT COMM_ID,GUIDE_ID,MEM_ID,COMMNET_CONTENT,GUIDE_COMMNET_TIME,COMM_STATUS FROM GUIDE_COMM WHERE GUIDE_ID= ?";
	// 刪除一篇文章所有留言
	private static final String DELETE_ALL_FROM_GUIDEID = "DELETE FROM guide_comm where GUIDE_ID = ?";

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
			pstmt = con.prepareStatement("Update guide set GUIDE_COMM_SIZE = GUIDE_COMM_SIZE+1 where GUIDE_ID=?");
			pstmt.setString(1, guideCommVO.getGuideId());
			pstmt.executeUpdate();
			// Handle any SQL errors
		} catch (Exception se) {
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
	public List<GuideCommVO> getAllFromGuideId(String guideId) {

		List<GuideCommVO> list = new ArrayList<GuideCommVO>();
		GuideCommVO guideCommVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_FROM_GUIDEID);
			pstmt.setString(1, guideId);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				guideCommVO = new GuideCommVO();
				guideCommVO.setCommId(rs.getString("COMM_ID"));
				guideCommVO.setGuideId(rs.getString("GUIDE_ID"));
				guideCommVO.setMemId(rs.getString("mem_id"));

				guideCommVO.setCommContent(rs.getString("COMMNET_CONTENT"));
				guideCommVO.setGuideCommTime(rs.getTimestamp("GUIDE_COMMNET_TIME"));
				guideCommVO.setCommStatus(rs.getInt("COMM_STATUS"));
				list.add(guideCommVO);
			}
			// Handle any driver errors
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

		return list;
	}

	@Override
	public void deleteAll(String guideId) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE_ALL_FROM_GUIDEID);

			pstmt.setString(1, guideId);
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

}
