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

import com.guideImg.model.GuideImgService;
import com.guideImg.model.GuideImgVO;

public class GuideDAO implements GuideDAO_interface {
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/BA107G1");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	private static final String INSERT_STMT = "INSERT INTO guide(guide_id,mem_id,guide_title,guide_content,guide_read_size,guide_comm_size,guide_vote_size,guide_area,guide_map,GUIDE_LAT_LNG)"
			+ "VALUES('G'||LPAD(to_char(GUIDE_PK_SEQ.NEXTVAL), 6, '0'),?,?,?,?,?,?,?,?,?)";
	private static final String DELETE = "DELETE FROM guide where guide_id = ?";
	private static final String UPDATE_FRONT = "UPDATE guide set guide_title=?, guide_content=? where guide_id = ?";
	private static final String UPDATE_BACK = "UPDATE guide set guide_status=? where guide_id = ?";
	private static final String UPDATE_VOTE = "UPDATE guide set GUIDE_VOTE_SIZE=? where guide_id = ?";
	private static final String UPDATE_READ = "UPDATE guide set GUIDE_READ_SIZE=? where guide_id = ?";
	private static final String GET_ONE_STMT = "SELECT GU.GUIDE_ID, GU.MEM_ID, GU.GUIDE_TITLE, GU.GUIDE_CONTENT, GU.GUIDE_AREA, GU.GUIDE_CREATE_TIME, GU.GUIDE_READ_SIZE, GU.GUIDE_COMM_SIZE, GU.GUIDE_VOTE_SIZE, GU.GUIDE_STATUS, GI.G_IMG_ID, GI.GUIDE_IMG_CONTENT,GU.GUIDE_MAP,GU.GUIDE_LAT_LNG FROM GUIDE GU LEFT JOIN GD_IMG GI ON GU.GUIDE_ID = GI.GUIDE_ID WHERE GU.GUIDE_ID = ?";
	private static final String GET_ALL_FROM_ONE_MEM = "SELECT GUIDE_ID,MEM_ID,GUIDE_TITLE,GUIDE_CONTENT,GUIDE_AREA,GUIDE_MAP,GUIDE_CREATE_TIME,GUIDE_READ_SIZE,GUIDE_COMM_SIZE,GUIDE_VOTE_SIZE,GUIDE_STATUS FROM GUIDE WHERE MEM_ID= ?";

	// 取得所有不重複的文章地區
	private static final String GET_ALL_AREA = "SELECT DISTINCT GUIDE_AREA FROM GUIDE";

	// 取得單一地區文章訪問量, 由高到低排序
	private static final String GET_MSOT_READ_SIZE_BY_AREA = "SELECT GI.G_IMG_ID, GU.GUIDE_READ_SIZE FROM GUIDE GU LEFT JOIN GD_IMG GI ON GU.GUIDE_ID = GI.GUIDE_ID WHERE GU.GUIDE_AREA = ? AND GI.G_IMG_ID IS NOT NULL ORDER BY GU.GUIDE_READ_SIZE ASC";

	// 取得單一地區所有文章列表
	private static final String GET_ALL_GUIDE_FROM_AREA = "SELECT GUIDE_AREA,GUIDE_ID,MEM_ID,GUIDE_TITLE,GUIDE_CONTENT,GUIDE_CREATE_TIME,GUIDE_READ_SIZE,GUIDE_COMM_SIZE,GUIDE_VOTE_SIZE,GUIDE_STATUS,GUIDE_LAT_LNG FROM GUIDE WHERE GUIDE_AREA=?";

	@Override
	public String insert(GuideVO guideVO, List<GuideImgVO> imgList) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String guideId = "";
		try {
			con = ds.getConnection();
			con.setAutoCommit(false); // 關閉自動commit, 因同一條連線要帶去給新增圖片
			pstmt = con.prepareStatement(INSERT_STMT);
			pstmt.setString(1, guideVO.getMemId());
			pstmt.setString(2, guideVO.getGuideTitle());
			pstmt.setString(3, guideVO.getGuideContent());
			pstmt.setInt(4, 0);
			pstmt.setInt(5, 0);
			pstmt.setInt(6, 0);
			pstmt.setString(7, guideVO.getGuideArea());
			pstmt.setString(8, guideVO.getGuideMap());
			pstmt.setString(9, guideVO.getGuideLatLng());
			pstmt.executeUpdate(); // 執行新增文章sql

			// 查詢拿到當前新增文章的自增主鍵
			PreparedStatement pstmt1 = con
					.prepareStatement("select 'G'||LPAD(to_char(GUIDE_PK_SEQ.currVal), 6, '0') as id from dual");
			ResultSet rs = pstmt1.executeQuery(); // rs = 查詢結果
			while (rs.next()) {               // 拿到自增主鍵值
				guideId = rs.getString("id"); // 放到guideId
			}
			System.out.println("guideId: " + guideId);

			// 呼叫img service把資料丟過去新增圖片
			GuideImgService imgSvc = new GuideImgService();
			imgSvc.addGuideImgList(guideId, imgList, con);
			System.out.println("guideDAO圖片新增成功");
			con.commit();
		} catch (SQLException se) {
			se.printStackTrace();
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
		return guideId;
	}

	@Override
	public void updateFront(GuideVO guideVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_FRONT);

			pstmt.setString(1, guideVO.getGuideTitle());
			pstmt.setString(2, guideVO.getGuideContent());
			pstmt.setString(3, guideVO.getGuideId());

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
	public void updateVote(GuideVO guideVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_VOTE);

			pstmt.setInt(1, guideVO.getGuideVoteSize());
			pstmt.setString(2, guideVO.getGuideId());

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

	@Override
	public void updateRead(GuideVO guideVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_READ);

			pstmt.setInt(1, guideVO.getGuideReadSize());
			pstmt.setString(2, guideVO.getGuideId());

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

	@Override
	public void updateBack(GuideVO guideVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_BACK);

			pstmt.setInt(1, guideVO.getGuideStatus());
			pstmt.setString(2, guideVO.getGuideId());

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

	@Override
	public GuideVO findByPrimaryKey(String guideId) {

		GuideVO guideVO = new GuideVO();
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
				GuideImgVO guideImgVO = new GuideImgVO();
				guideImgVO.setGuideImgId(rs.getString("g_img_id"));
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
				guideVO.setGuideMap(rs.getString("guide_map"));
				guideVO.setGuideLatLng(rs.getString("GUIDE_LAT_LNG"));

				guideImgList.add(guideImgVO);
			}
			guideVO.setGuideImgList(guideImgList);

		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("資料庫錯誤" + e.getMessage());
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
	// 取得指南不重複地區, 須回傳一個地區的list
	public List<String> getAllArea() {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<String> guideAreaList = new ArrayList<String>();
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_AREA);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// add所有指南地區至list裡
				guideAreaList.add(rs.getString("GUIDE_AREA"));
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

		return guideAreaList;

	}

	@Override
	// 使用傳入地區, 取得指南首頁地區需放入的資訊
	public GuideIndexVO getGuideIndexVO(String guideArea) {
		System.out.println(guideArea);
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		GuideIndexVO guideIndexVO = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_MSOT_READ_SIZE_BY_AREA);
			pstmt.setString(1, guideArea);
			rs = pstmt.executeQuery(); // 拿到一個地區
			guideIndexVO = new GuideIndexVO();
			while (rs.next()) { // 拿到訪問量最高的單一地區文章圖片id
				guideIndexVO.setGuideArea(guideArea);
				guideIndexVO.setGuideImgId(rs.getString("G_IMG_ID"));
				guideIndexVO.setGuideReadSize(rs.getInt("GUIDE_READ_SIZE"));
			}
			// while (rs.next()) { // 拿到訪問量最高的單一地區文章圖片id
			// guideIndexVO.setGuideArea(guideArea);
			// guideIndexVO.setGuideImgId(rs.getString("G_IMG_ID"));
			// guideIndexVO.setGuideReadSize(rs.getInt("GUIDE_READ_SIZE"));
			// }
		} catch (SQLException se) {
			throw new RuntimeException("資料庫錯誤 : " + se.getMessage());
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

		return guideIndexVO;
	}

	// 查詢一個會員所有文章
	@Override
	public List<GuideVO> getAllFromOneId(String memId) {
		List<GuideVO> list = new ArrayList<GuideVO>();
		GuideVO guideVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_FROM_ONE_MEM);
			pstmt.setString(1, memId);
			rs = pstmt.executeQuery();

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
				guideVO.setGuideMap(rs.getString("guide_map"));
				list.add(guideVO);
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

	// 拿到地區所有文章
	@Override
	public List<GuideVO> getAllGuideFromArea(String guideArea) {

		System.out.println("進DAO囉(getAllGuideFromArea), guideArea = " + guideArea);

		List<GuideVO> areaGuideList = new ArrayList<GuideVO>();
		GuideVO guideVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_GUIDE_FROM_AREA);
			pstmt.setString(1, guideArea);
			rs = pstmt.executeQuery();

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
				guideVO.setGuideLatLng(rs.getString("GUIDE_LAT_LNG"));
				areaGuideList.add(guideVO);
			}

			System.out.println("areaGuideList = " + areaGuideList.toString());
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

		return areaGuideList;
	}

}
