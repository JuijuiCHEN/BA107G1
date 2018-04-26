package com.util;

import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ImgTransUtil {
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/BA107G1");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	public byte[] getBytesFromDB(String tableName, String colName, String queryId, String queryImg)
			throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer stmt = new StringBuffer();
		String queryStmt = stmt.append(
				"SELECT" + " " + queryImg + " " + "FROM" + " " + tableName + " " + "WHERE" + " " + colName + " " + "=?")
				.toString();
		byte[] buffer = null;
		try {
			conn = ds.getConnection();

			pstmt = conn.prepareStatement(queryStmt);
			pstmt.setString(1, queryId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				buffer = rs.getBytes(queryImg);
			}
		} catch (SQLException e) {
			System.out.println("Can't find pictures by query statement...try again by typing something else:)");
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return buffer;
	}

}
