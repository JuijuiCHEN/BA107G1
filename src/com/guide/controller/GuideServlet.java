package com.guide.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.guide.model.GuideDAO;
import com.guide.model.GuideService;
import com.guide.model.GuideVO;

@WebServlet("/guide.do")
public class GuideServlet extends HttpServlet {

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

				// 取得新增資料
				GuideVO guideVO = new GuideVO();
				guideVO.setMemId(memId);
				guideVO.setGuideTitle(guideTitle);
				guideVO.setGuideContent(guideContent);
				guideVO.setGuideArea(guideArea);
				guideVO.setGuideMap(guideMap);

				if (!errorMsgs.isEmpty()) {
					req.setAttribute("guideVO", guideVO); // 含有輸入格式錯誤的guideVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/guide/addGuide.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 2.開始新增資料 ***************************************/

				GuideService guideSvc = new GuideService();
				guideVO = guideSvc.addGuide(memId, guideTitle, guideContent, guideArea, guideMap);

				System.out.println("新增成功");

				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				String url = "/front-end/guide/listOneGuide.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);
				/*************************** 其他可能的錯誤處理 **********************************/

			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/guide/addGuide.jsp");
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
		}
		if ("getOne".equals(action) || "fromListOne".equals(action)) {

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
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/select_page.jsp");
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
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/select_page.jsp");
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
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/select_page.jsp");
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
		}

	}
}
