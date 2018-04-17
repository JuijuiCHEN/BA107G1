package com.guideRep.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.guideRep.model.GuideRepDAO;
import com.guideRep.model.GuideRepService;
import com.guideRep.model.GuideRepVO;

/**
 * Servlet implementation class GuideRepServlet
 */
@WebServlet("/guideRep.do")
public class GuideRepServlet extends HttpServlet {

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		System.out.println("action : " + action);
		if ("insert".equals(action)) {

			try {
				/*************************** 1.取得新增資料 ***************************************/
				String guideId = req.getParameter("guideId");
				String memId = req.getParameter("memId");
				String guideRepContent = new String(req.getParameter("radio").getBytes("ISO-8859-1"), "UTF-8");

				System.out.println("guideRepContent : " + guideRepContent);
				System.out.println("guideId : " + guideId);

				GuideRepVO guideRepVO = new GuideRepVO();
				guideRepVO.setGuideId(guideId);
				guideRepVO.setMemId(memId);
				guideRepVO.setGuideRepContent(guideRepContent);

				/*************************** 2.開始新增資料 ***************************************/
				GuideRepService guideRepSvc = new GuideRepService();
				guideRepSvc.addGuideRep(guideId, memId, guideRepContent);
				System.out.println("檢舉新增成功");
				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				String url = "/guide.do?action=getOne&guideId=" + guideId;
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				e.printStackTrace();
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/guide/xxx.jsp");
				failureView.forward(req, res);
			}
		} else if ("update".equals(action)) { // V
			String requestURL = req.getParameter("requestURL");
			System.out.println("requestURL = " + requestURL);
			try {
				/*************************** 1.接收請求參數 ***************************************/
				String guideRepId = req.getParameter("guideRepId");
				Integer guideRepStatus = Integer.parseInt(req.getParameter("guideRepStatus"));

				System.out.println("guideRepId: " + guideRepId);
				System.out.println("guideRepStatus: " + guideRepStatus);

				GuideRepVO guideRepVO = new GuideRepVO();
				guideRepVO.setGuideRepId(guideRepId);
				guideRepVO.setGuideRepStatus(guideRepStatus);
				/*************************** 2.開始修改資料 ***************************************/
				GuideRepService guideRepSvc = new GuideRepService();
				guideRepSvc.update(guideRepId, guideRepStatus);
				System.out.println("後台檢舉修改成功");
				/*************************** 3.修改完成,準備轉交(Send the Success view) ***********/
				String url = "/back-end/guideRep/listAllGuideRep.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				e.printStackTrace();
				RequestDispatcher failureView = req.getRequestDispatcher(requestURL);
				failureView.forward(req, res);
			}

		} else if ("delete".equals(action)) {

			try {
				String guideRepId = req.getParameter("guideRepId");

				GuideRepVO guideRepVO = new GuideRepVO();
				guideRepVO.setGuideRepId(guideRepId);

				GuideRepDAO guideRepDAO = new GuideRepDAO();
				guideRepDAO.delete(guideRepId);

				System.out.println("刪除成功");
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if ("findByPrimaryKey".equals(action)) { // V
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			String requestURL = req.getParameter("requestURL");		// 送出修改的來源網頁路徑
			try {
				// 接收請求參數
				String guideRepId = req.getParameter("guideRepId");

				// 開始查資料
				GuideRepService guideRepSvc = new GuideRepService();
				GuideRepVO guideRepVO = guideRepSvc.getOneGuideRep(guideRepId);

				// 查詢完成,準備轉交
				req.setAttribute("guideRepVO", guideRepVO); // 資料庫取出的guideRepVO物件,存入req
				// String url = "/back-end/guideRep/listOneGuideRep.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(requestURL); // 成功轉交
				successView.forward(req, res);

			} catch (Exception e) {
				e.printStackTrace();
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher(requestURL);
				failureView.forward(req, res);

			}
		}
	}

}
