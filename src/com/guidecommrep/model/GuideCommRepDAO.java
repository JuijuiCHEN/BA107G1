package com.guidecommrep.model;

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

public class GuideCommRepDAO implements GuideCommRepDAO_interface {

	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/BA107G1");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	private static final String INSERT_STMT = "insert into g_comm_rep(g_comm_rep_id, comm_id, mem_id, guide_comm_rep_content, guide_comm_rep_status)values('GCR'||LPAD(to_char(R_COMM_REP_pk_seq.NEXTVAL), 6, '0'), ?, ?, ?, '未審核')";
	private static final String GET_ALL_STMT = "SELECT * from g_comm_rep order by g_comm_rep_id";
	private static final String GET_ONE_STMT = "SELECT * from g_comm_rep where g_comm_rep_id = ?";
	private static final String DELETE = "DELETE from g_comm_rep where g_comm_rep_id =?";
	private static final String UPDATE = "UPDATE g_comm_rep set guide_comm_rep_status = ? where g_comm_rep_id = ?";
	private static final String GET_ALL_STATUS = "SELECT * FROM g_comm_rep WHERE guide_comm_rep_status=?";

	@Override
	public void insert(GuideCommRepVO guideCommRepVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, guideCommRepVO.getComm_id());
			pstmt.setString(2, guideCommRepVO.getMem_id());
			pstmt.setString(3, guideCommRepVO.getGuide_comm_rep_content());
			pstmt.setString(4, guideCommRepVO.getGuide_comm_rep_status());

			pstmt.executeUpdate();

		} catch (SQLException se) {
			throw new RuntimeException("無法載入資料庫驅動程序" + se.getMessage());
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {

					e.printStackTrace();
				}
			}
		}

	}

	@Override
	public void update(GuideCommRepVO guideCommRepVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, guideCommRepVO.getGuide_comm_rep_status());
			pstmt.setString(2, guideCommRepVO.getG_comm_rep_id());

			pstmt.executeUpdate();

		} catch (SQLException se) {
			throw new RuntimeException("發生資料庫錯誤" + se.getMessage());
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}

	@Override
	public void delete(String g_comm_rep_id) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);
			pstmt.setString(1, g_comm_rep_id);
			pstmt.executeUpdate();

		} catch (SQLException se) {
			throw new RuntimeException("發生資料庫錯誤" + se.getMessage());
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}

	@Override
	public GuideCommRepVO findByPrimaryKey(String g_comm_rep_id) {

		GuideCommRepVO guideCommRepVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1, g_comm_rep_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				guideCommRepVO = new GuideCommRepVO();
				guideCommRepVO.setG_comm_rep_id(rs.getString("g_comm_rep_id"));
				guideCommRepVO.setComm_id(rs.getString("comm_id"));
				guideCommRepVO.setMem_id(rs.getString("mem_id"));
				guideCommRepVO.setGuide_comm_rep_date(rs.getDate("guide_comm_rep_date"));
				guideCommRepVO.setGuide_comm_rep_content(rs.getString("guide_comm_rep_content"));
				guideCommRepVO.setGuide_comm_rep_status(rs.getString("guide_comm_rep_status"));

			}

		} catch (SQLException se) {
			se.printStackTrace();
			// throw new RuntimeException("發生資料庫錯誤" + se.getMessage());

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
		return guideCommRepVO;
	}

	@Override
	public List<GuideCommRepVO> getAll() {
		List<GuideCommRepVO> list = new ArrayList<GuideCommRepVO>();
		GuideCommRepVO guideCommRepVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				guideCommRepVO = new GuideCommRepVO();
				guideCommRepVO.setG_comm_rep_id(rs.getString("g_comm_rep_id"));
				guideCommRepVO.setComm_id(rs.getString("comm_id"));
				guideCommRepVO.setMem_id(rs.getString("mem_id"));
				guideCommRepVO.setGuide_comm_rep_date(rs.getDate("guide_comm_rep_date"));
				guideCommRepVO.setGuide_comm_rep_content(rs.getString("guide_comm_rep_content"));
				guideCommRepVO.setGuide_comm_rep_status(rs.getString("guide_comm_rep_status"));
				list.add(guideCommRepVO);
			}

		} catch (SQLException se) {
			throw new RuntimeException("發生資料庫錯誤" + se.getMessage());

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
	public List<GuideCommRepVO> getAllStatus(String guide_comm_rep_status) {

		List<GuideCommRepVO> guideCommRepList = new ArrayList<GuideCommRepVO>();
		GuideCommRepVO guideCommRepVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STATUS);
			pstmt.setString(1, guide_comm_rep_status);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				guideCommRepVO = new GuideCommRepVO();
				guideCommRepVO.setG_comm_rep_id(rs.getString("g_comm_rep_id"));
				guideCommRepVO.setComm_id(rs.getString("comm_id"));
				guideCommRepVO.setMem_id(rs.getString("mem_id"));

				guideCommRepVO.setGuide_comm_rep_date(rs.getDate("guide_comm_rep_date"));
				guideCommRepVO.setGuide_comm_rep_content(rs.getString("guide_comm_rep_content"));
				guideCommRepVO.setGuide_comm_rep_status(rs.getString("guide_comm_rep_status"));
				guideCommRepList.add(guideCommRepVO);
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
		return guideCommRepList;
	}
}
