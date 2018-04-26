package com.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.Clob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ClobTrans {
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/BA107G1");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	public String transClob(String tableName, String colName, String queryId, String queryClob) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer stmt = new StringBuffer();
		String queryStmt = stmt.append("SELECT" + " " + queryClob + " " + "FROM" + " " + tableName + " " + "WHERE" + " "
				+ colName + " " + "=?").toString();
		String out = null;
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(queryStmt);
			pstmt.setString(1, queryId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Clob texts = rs.getClob(queryClob);
				BufferedReader br = new BufferedReader(texts.getCharacterStream());
				String i = null;
				StringBuffer sb = new StringBuffer();
				try {
					while ((i = br.readLine()) != null) {
						sb.append(i);
					}
				} catch (IOException e) {
					e.printStackTrace();
				}
				out = sb.toString();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return out;

	}
}
