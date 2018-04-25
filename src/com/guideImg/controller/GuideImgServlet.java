package com.guideImg.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.guideImg.model.GuideImgService;
import com.guideImg.model.GuideImgVO;

@WebServlet("/guideImg.do")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 500 * 1024 * 1024, maxRequestSize = 5 * 500 * 1024
		* 1024)
// 當數據量大於fileSizeThreshold值時, 內容將被寫入磁碟
// 上傳過程中無論是單個文件超過maxFileSize值, 或者上傳總量大於maxRequestSize值,都會拋出IllegalStateException異常
public class GuideImgServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String saveDirectory = "/images_uploaded"; // 上傳檔案的目的目錄, 將底下的26~30行用java.io.file 於contextPath之下,
												 // 自動建立目錄

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8"); // 處理中文檔名
		// res.setContentType("text/html; charset=Big5");

		String action = req.getParameter("action");

		System.out.println("action =" + action);

		if ("insert".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
				String guideId = req.getParameter("guideId");
				System.out.println("guideId =" + guideId);
				GuideImgVO guideImgVO = null;
				PrintWriter out = res.getWriter();
				String realPath = getServletContext().getRealPath(saveDirectory);
				File fsaveDirectory = new File(realPath);
				if (!fsaveDirectory.exists())
					fsaveDirectory.mkdirs(); // 於ContextPath之下,自動建立目的目錄
				int count = 0;
				Collection<Part> parts = req.getParts();
				System.out.println(parts.size());
				for (Part part : parts) {
					String filename = getFileNameFromPart(part);
					System.out.println("filename:" + filename);
					if (getFileNameFromPart(part) != null && part.getContentType() != null) {
						System.out.println("這個檔案新增成功:" + filename);
						count++;
						// long size = part.getSize();
						File f = new File(fsaveDirectory, filename);
						// 利用File物件,寫入目的目錄,上傳成功
						part.write(f.toString());
						// 額外測試InputStream 與 byte[] (幫將來model的VO預做準備)
						InputStream in = part.getInputStream();
						byte[] guideImgContent = new byte[in.available()];
						in.read(guideImgContent);
						in.close();
						out.print("buffer length: " + guideImgContent.length);

						// 取得新增資料
						guideImgVO = new GuideImgVO();
						guideImgVO.setGuideId(guideId);
						guideImgVO.setGuideImgContent(guideImgContent);

						/****************************
						 * 2.開始新增資料
						 ***************************************/
						GuideImgService guideImgSvc = new GuideImgService();
						guideImgVO = guideImgSvc.addGuideImg(guideId, guideImgContent);
						System.out.println("圖片新增成功");
						// 額外測試秀圖
						out.println("<br><img src=\"" + req.getContextPath() + saveDirectory + "/" + filename + "\">");
						out.println();
					}
				}
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("guideImgVO", guideImgVO); // 含有輸入格式錯誤的guideImgVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("imgbbb.jsp");
					failureView.forward(req, res);
					return;

				}
				out.write("<h2> 總共上傳: " + count + "張圖 </h2>");
				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				String url = "ok.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);
				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				e.printStackTrace();
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("imgxx.jsp");
				failureView.forward(req, res);
			}

		} else if ("delete".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ***************************************/
				String guideImgId = req.getParameter("guideImgId");

				/*************************** 2.開始刪除資料 ***************************************/
				// GuideImgVO guideImgVO = new GuideImgVO();
				// guideImgVO.setGuideImgId(guideImgId);

				GuideImgService guideImgSvc = new GuideImgService();
				guideImgSvc.deleteGuideImg(guideImgId);
				System.out.println("圖片刪除成功");
				/*************************** 3.刪除完成,準備轉交(Send the Success view) ***********/
				String url = "xxx.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);
				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				e.printStackTrace();
				errorMsgs.add("刪除資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("eee.jsp");
				failureView.forward(req, res);
			}
		} else if ("getOne_For_Display".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			ServletOutputStream out = res.getOutputStream();
			GuideImgService guideImgSvc = new GuideImgService();
			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String guideImgId = req.getParameter("guideImgId");

				String guideId = req.getParameter("guideId");

				System.out.println("guideImgId = " + guideImgId);
				System.out.println("guideId = " + guideId);
				res.setContentType("image/gif");

				/*************************** 2.開始查詢資料 *****************************************/
				if (guideImgSvc != null) {
					GuideImgVO guideImgVO = guideImgSvc.getOneGuideImg(guideImgId);
					/*************************** 把圖片輸出(out.write)到頁面 ****************************/
					out.write(guideImgVO.getGuideImgContent());
				}

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				e.printStackTrace();
				GuideImgVO guideImgVO = guideImgSvc.getOneGuideImg("GI000020");
				/*************************** 把圖片輸出(out.write)到頁面 ****************************/
				out.write(guideImgVO.getGuideImgContent());
			}
		}
	}

	public String getFileNameFromPart(Part part) {
		String header = part.getHeader("content-disposition");
		String filename = new File(header.substring(header.lastIndexOf("=") + 2, header.length() - 1)).getName();
		if (filename.length() == 0) {
			return null;
		}
		return filename;
	}
}
