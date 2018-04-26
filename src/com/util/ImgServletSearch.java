package com.util;

import java.io.BufferedInputStream;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ImgServletSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		ServletOutputStream out = res.getOutputStream();
		ImgTransUtil imgTransUtil = new ImgTransUtil();
		InputStream in = null;
		BufferedInputStream bi = null;
		String tableName = req.getParameter("tableName");
		String colName = req.getParameter("colName");
		String queryId = req.getParameter("queryId");
		String queryImg = req.getParameter("queryImg");
		res.setContentType("image/gif");
		try {
			if("GD_IMG".equals(tableName)){
				queryId="(SELECT G_IMG_ID FROM (SELECT * FROM GD_IMG WHERE GUIDE_ID='"+queryId+"') WHERE ROWNUM=1)";
			byte[] picBuffer = null;
			picBuffer = imgTransUtil.getBytesFromDB(tableName, colName, queryId, queryImg);
				out.write(picBuffer, 0, picBuffer.length);
			}
			System.out.println("Successfully find " + colName + " : " + queryId + " from DB!");
		} catch (SQLException e) {
			System.out.println("Can't find pictures by query statement...try again by typing something else:)");
		} catch (NullPointerException e) {
			in = getServletContext().getResourceAsStream("/images/nullImg.gif");
			bi = new BufferedInputStream(in);
			byte[] picBuffer = new byte[in.available()];
			int len;
			while ((len = bi.read(picBuffer)) != -1) {
				out.write(picBuffer, 0, len);
			}
		} finally {
			if (bi != null)
				bi.close();
			if (in != null)
				in.close();
		}
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

}
