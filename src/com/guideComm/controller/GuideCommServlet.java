package com.guideComm.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.guideComm.model.GuideCommDAO;
import com.guideComm.model.GuideCommVO;

@WebServlet("/guideComm.do")
public class GuideCommServlet extends HttpServlet {

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
				String memId = req.getParameter("memId");
				String commContent = req.getParameter("commContent");

				GuideCommVO guideCommVO = new GuideCommVO();
				guideCommVO.setGuideId(guideId);
				guideCommVO.setMemId(memId);
				guideCommVO.setCommContent(commContent);

				GuideCommDAO guideCommDAO = new GuideCommDAO();
				guideCommDAO.insert(guideCommVO);
				System.out.println("留言新增成功");
				// 跳到成功頁面

			} catch (Exception e) {
				e.printStackTrace();
				// 跳到錯誤頁面
			}

		} else if ("update".equals(action)) {

			try {
				String commId = req.getParameter("commId");
				String commContent = req.getParameter("commContent");
				Integer commStatus = Integer.parseInt(req.getParameter("commStatus"));

				GuideCommVO guideCommVO = new GuideCommVO();
				guideCommVO.setCommId(commId);
				guideCommVO.setCommContent(commContent);
				guideCommVO.setCommStatus(commStatus);

				GuideCommDAO guideCommDAO = new GuideCommDAO();
				guideCommDAO.update(guideCommVO);

				System.out.println("修改成功");

			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if ("delete".equals(action)) {

			try {
				String commId = req.getParameter("commId");

				GuideCommVO guideCommVO = new GuideCommVO();
				guideCommVO.setCommId(commId);
				GuideCommDAO guideCommDAO = new GuideCommDAO();
				guideCommDAO.delete(commId);
				System.out.println("刪除成功");

			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if ("getOne_For_Display".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				// 接收請求參數,輸入格式錯誤處理
				String str = req.getParameter("commId");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入指南編號");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/test.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}
				String commId = null;
				try {
					commId = new String(str);
				} catch (Exception e) {
					errorMsgs.add("指南編號格式不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/test.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				// 開始查資料
				GuideCommDAO dao = new GuideCommDAO();
				GuideCommVO guideCommVO = dao.findByPrimaryKey(commId);
				if (commId == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/test.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				// 查詢完成,準備轉交
				req.setAttribute("guideCommVO", guideCommVO); // 資料庫取出的guideVO物件,存入req
				String url = "/testCommSelect.jsp";

				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/test.jsp");
				failureView.forward(req, res);

			}
		}

	}
}