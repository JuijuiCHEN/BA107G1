package com.guideImg.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.guideImg.model.GuideImgDAO;
import com.guideImg.model.GuideImgVO;

@WebServlet("/guideImg.do")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 500 * 1024 * 1024, maxRequestSize = 5 * 500 * 1024
		* 1024)
public class GuideImgServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String saveDirectory = "/images_uploaded";

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("insert".equals(action)) {

			try {
				String guideId = req.getParameter("guideId");

				String realPath = getServletContext().getRealPath(saveDirectory);

				// res.setContentType("text/html; charset=UTF-8");
				// PrintWriter out = res.getWriter();
				System.out.println("ContentType=" + req.getContentType());

				File fsaveDirectory = new File(realPath);
				if (!fsaveDirectory.exists())
					fsaveDirectory.mkdirs();
				Part part = req.getPart("saveDirectory");
				InputStream in = part.getInputStream();
				byte[] guideImgContent = new byte[in.available()];
				in.read(guideImgContent);
				in.close();
				System.out.println(guideImgContent);
				GuideImgVO guideImgVO = new GuideImgVO();
				guideImgVO.setGuideId(guideId);
				guideImgVO.setGuideImgContent(guideImgContent);

				GuideImgDAO guideImgDAO = new GuideImgDAO();
				guideImgDAO.insert(guideImgVO);
				System.out.println("圖片新增成功");

			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if ("delete".equals(action)) {
			try {
				String guideImgId = req.getParameter("guideImgId");
				GuideImgVO guideImgVO = new GuideImgVO();
				guideImgVO.setGuideImgId(guideImgId);
				GuideImgDAO guideImgDAO = new GuideImgDAO();
				guideImgDAO.delete(guideImgId);
				System.out.println("圖片刪除成功");
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if ("findByPrimaryKey".equals(action)) {
			String guideImgId = req.getParameter("guideImgId");
			String guideId = req.getParameter("guideId");
			ServletOutputStream out = res.getOutputStream();
			byte[] guideImgContent = null;
			System.out.println(guideImgId);
			res.setContentType("image/gif");
			// BufferedReader in = req.getReader();
			// guideImgContent =

			GuideImgDAO guideImgDAO = new GuideImgDAO();
			guideImgContent = guideImgDAO.findByPrimaryKey(guideImgId).getGuideImgContent();

			out.write(guideImgContent);

		}

	}
}
