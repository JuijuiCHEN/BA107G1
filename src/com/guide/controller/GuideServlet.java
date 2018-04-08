package com.guide.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.guide.model.GuideDAO;
import com.guide.model.GuideService;
import com.guide.model.GuideVO;
import com.guideImg.model.GuideImgVO;

@WebServlet("/guide.do")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 500 * 1024 * 1024, maxRequestSize = 5 * 500 * 1024
		* 1024)
public class GuideServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String saveDirectory = "/images_uploaded"; // 上傳檔案的目的目錄, 將底下的26~30行用java.io.file 於contextPath之下,
												 // 自動建立目錄

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		System.out.println("action = " + action);

		if ("insert".equals(action)) { // 來自addGuide.jsp的請求
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/

				// req取得資料
				String memId = req.getParameter("memId");
				String guideTitle = req.getParameter("guideTitle").trim();
				if (guideTitle == null || guideTitle.trim().length() == 0) {
					errorMsgs.add("文章標題: 請勿空白");
				}

				String guideContent = req.getParameter("guideContent").trim();
				if (guideContent == null || guideContent.trim().length() == 0) {
					errorMsgs.add("文章內容: 請勿空白");
				}

				String guideArea = req.getParameter("guideArea").trim();
				if (guideArea == null || guideArea.trim().length() == 0) {
					errorMsgs.add("文章地區: 請勿空白");
				}

				String guideMap = req.getParameter("guideMap").trim();
				if (guideMap == null || guideMap.trim().length() == 0) {
					errorMsgs.add("文章地址: 請勿空白");
				}
				System.out.println(guideArea);
				System.out.println(guideMap);

				String guideLatLng = URLDecoder.decode(req.getParameter("guideLatLng"));  // 在這裡解碼符號,從unicode解碼成big-5,
																						  // 才會跟當初使用者輸入的樣子一樣
				System.out.println("servlst的guideLatLng = " + guideLatLng);

				// 取得新增資料
				GuideVO guideVO = new GuideVO();
				guideVO.setMemId(memId);
				guideVO.setGuideTitle(guideTitle);
				guideVO.setGuideContent(guideContent);
				guideVO.setGuideArea(guideArea);
				guideVO.setGuideMap(guideMap);
				guideVO.setGuideLatLng(guideLatLng);

				System.out.println("guideVO: " + guideVO.toString());

				if (!errorMsgs.isEmpty()) {
					req.setAttribute("guideVO", guideVO); // 含有輸入格式錯誤的guideVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/guide/addGuide.jsp");
					failureView.forward(req, res);
					return;
				}

				// 取得圖片
				GuideImgVO guideImgVO = null;
				PrintWriter out = res.getWriter();
				String realPath = getServletContext().getRealPath(saveDirectory);
				File fsaveDirectory = new File(realPath);
				if (!fsaveDirectory.exists())
					fsaveDirectory.mkdirs(); // 於ContextPath之下,自動建立目的目錄
				Collection<Part> parts = req.getParts();
				System.out.println("partsSize: " + parts.size());

				// new一個List裝全部圖片,要送去service新增用的
				List<GuideImgVO> imgList = new ArrayList<GuideImgVO>();

				for (Part part : parts) {
					String filename = getFileNameFromPart(part);
					if (getFileNameFromPart(part) != null && part.getContentType() != null) {
						// 不是null和副檔名是圖檔才會進list裡
						System.out.println("這個檔案新增成功:" + filename);
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
						guideImgVO.setGuideImgContent(guideImgContent);
						imgList.add(guideImgVO);  // 把不知道塞了多少圖的VO都放到imgList裡
					}
				}
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("guideImgVO", guideImgVO); // 含有輸入格式錯誤的guideImgVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("aaa.jsp");
					failureView.forward(req, res);
					return;

				}

				/*************************** 2.開始新增資料 ***************************************/

				GuideService guideSvc = new GuideService();
				guideSvc.addGuide(memId, guideTitle, guideContent, guideArea, guideMap, guideLatLng, imgList);
				System.out.println("文章新增成功");

				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				String url = "/front-end/select_page.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				e.printStackTrace();
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/guide/錯誤.jsp");
				failureView.forward(req, res);
			}

		} else if ("delete".equals(action)) {
			System.out.println("進來delete");

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				/*************************** 1.接收請求參數 ***************************************/
				String guideId = req.getParameter("guideId");

				/*************************** 2.開始刪除資料 ***************************************/
				GuideService guideSvc = new GuideService();
				// 拿到需要刪除的文章詳細內容
				GuideVO guideVO = guideSvc.getOneGuide(guideId);// 1
				guideSvc.deleteGuide(guideId);
				System.out.println("servlet刪除成功");
				/*************************** 3.刪除完成,準備轉交(Send the Success view) ***********/
				String url = "/guide.do?action=getAll_From_MemId&memId=" + guideVO.getMemId();
				RequestDispatcher successView = req.getRequestDispatcher(url); // 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				e.printStackTrace();
				errorMsgs.add("刪除資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/guide/getAllGuideFromOneId.jsp");
				failureView.forward(req, res);
			}

		} else if ("updateFront".equals(action)) {
			System.out.println("====================================");
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ***************************************/
				// req取得資料
				String guideId = req.getParameter("guideId");

				String guideTitle = req.getParameter("guideTitle").trim();
				if (guideTitle == null || guideTitle.trim().length() == 0) {
					errorMsgs.add("文章標題: 請勿空白");

				}
				String guideContent = req.getParameter("guideContent").trim();
				if (guideContent == null || guideContent.trim().length() == 0) {
					errorMsgs.add("文章內容: 請勿空白");

				}
				GuideVO guideVO = new GuideVO();
				guideVO.setGuideId(guideId);
				guideVO.setGuideTitle(guideTitle);
				guideVO.setGuideContent(guideContent);

				if (!errorMsgs.isEmpty()) {
					req.setAttribute("guideVO", guideVO); // 含有輸入格式錯誤的guideVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("xxx.jsp");
					failureView.forward(req, res);
					return;
				}
				/*************************** 2.開始修改資料 ***************************************/

				GuideService guideSvc = new GuideService();
				guideVO = guideSvc.updateGuideFront(guideTitle, guideContent, guideId);
				System.out.println("指南內容修改成功");

				guideVO = guideSvc.getOneGuide(guideId);

				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				req.setAttribute("guideVO", guideVO); // 資料庫updata成功後,正確的guideVO物件,存入req
				String url = "/front-end/guide/listOneGuide.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後轉交aaa.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("資料修改失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/select_page.jsp");
				failureView.forward(req, res);
				e.printStackTrace();
			}

		} else if ("updateBack".equals(action)) {
			try {
				// req取得資料
				String guideId = req.getParameter("guideId");
				Integer guideStatus = Integer.parseInt(req.getParameter("guideStatus"));

				// 創建DAO的輸入參數
				GuideVO guideVO = new GuideVO();
				guideVO.setGuideStatus(guideStatus);
				guideVO.setGuideId(guideId);

				GuideDAO dao = new GuideDAO();
				dao.updateBack(guideVO);

				System.out.println("指南狀態修改成功");
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				res.sendRedirect("");
			}
		} else if ("getOne".equals(action) || "fromListOne".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String str = req.getParameter("guideId");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入指南編號");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/guide/updateFront.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}
				String guideId = null;
				try {
					guideId = new String(str);
				} catch (Exception e) {
					errorMsgs.add("指南編號格式不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("ccc.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 2.開始查詢資料 *****************************************/
				GuideService guideSvc = new GuideService();
				GuideVO guideVO = guideSvc.getOneGuide(guideId);
				if (guideVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("zzz.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}
				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("guideVO", guideVO); // 資料庫取出的guideVO物件,存入req

				String url = null;
				if ("getOne".equals(action))
					url = "/front-end/guide/listOneGuide.jsp";
				else if ("fromListOne".equals(action))
					url = "/front-end/guide/updateFront.jsp";

				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				e.printStackTrace();
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("xxx.jsp");
				failureView.forward(req, res);
			}

		} else if ("getAll_From_MemId".equals(action)) {
			System.out.println("getAll_From_MemId");
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String str = req.getParameter("memId");

				System.out.println("memId = " + str);

				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入會員編號");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("aaa.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}
				String memId = null;
				try {
					memId = new String(str);
				} catch (Exception e) {
					errorMsgs.add("會員編號格式不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("bbb.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}
				/*************************** 2.開始查詢資料 *****************************************/
				GuideService guideSvc = new GuideService();
				List<GuideVO> list = guideSvc.getAllFromOneId(memId);

				if (list.size() < 1) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("ccc.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}
				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("list", list); // 資料庫取出的guideVO物件,存入req
				String url = "/front-end/guide/getAllGuideFromOneId.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交
				successView.forward(req, res);
				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				System.out.println("發生錯誤");
				e.printStackTrace();
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("ddd.jsp");
				failureView.forward(req, res);
			}

		} else if ("getOne_Area".equals(action)) {
			System.out.println("getOne_Area");

			/*************************** 1.接收請求參數 **********************/
			String guideArea = new String(req.getParameter("guideArea").getBytes("ISO-8859-1"), "utf-8");
			System.out.println(guideArea);

			/*************************** 2.開始查詢資料 *****************************************/
			// 查詢所有guideArea 的文章
			GuideService guideSvc = new GuideService();
			List<GuideVO> areaGuideList = guideSvc.getAllGuideFromArea(guideArea);
			System.out.println(areaGuideList.toString());
			/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
			// 轉交至liseAreaGuide.jsp setAttribute......
			req.setAttribute("areaGuideList", areaGuideList); // 資料庫取出的guideVO物件,存入req
			req.setAttribute("area", guideArea);
			String url = "/front-end/guide/listAreaGuide.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交
			successView.forward(req, res);
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
