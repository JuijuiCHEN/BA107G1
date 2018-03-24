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
import javax.servlet.http.HttpSession;

import com.guide.model.GuideDAO;
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

		if ("insert".equals(action)) {
			try {
				// req取得資料
				String memId = req.getParameter("memId");
				String guideContent = req.getParameter("guideContent");
				String guideTitle = req.getParameter("guideTitle");
				String guideArea = req.getParameter("guideArea");
				// 取得新增資料
				GuideVO guideVO = new GuideVO();
				guideVO.setMemId(memId);
				guideVO.setGuideContent(guideContent);
				guideVO.setGuideTitle(guideTitle);
				guideVO.setGuideArea(guideArea);

				GuideDAO dao = new GuideDAO();
				dao.insert(guideVO);

				System.out.println("新增成功");
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				res.sendRedirect("");
			}
		} else if ("delete".equals(action)) {
			try {
				// req取得資料
				String guideId = req.getParameter("guideId");
				// 取得刪除資料
				GuideVO guideVO = new GuideVO();
				guideVO.setGuideId(guideId);

				GuideDAO dao = new GuideDAO();
				dao.delete(guideId);
				System.out.println("刪除成功");

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				res.sendRedirect("");
			}

		} else if ("update".equals(action)) {
			try {
				// req取得資料
				String guideId = req.getParameter("guideId");
				String guideTitle = req.getParameter("guideTitle");
				String guideContent = req.getParameter("guideContent");
				Integer guideStatus = Integer.parseInt(req.getParameter("guideStatus"));

				// 創建DAO的輸入參數
				GuideVO guideVO = new GuideVO();
				guideVO.setGuideTitle(guideTitle);
				guideVO.setGuideContent(guideContent);
				guideVO.setGuideStatus(guideStatus);
				guideVO.setGuideId(guideId);

				GuideDAO dao = new GuideDAO();
				dao.update(guideVO);

				System.out.println("修改成功");
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				res.sendRedirect("");
			}
		}

		// else if ("getOne_For_Display".equals(action)) {
		// List<String> errorMsgs = new LinkedList<String>();
		// req.setAttribute("errorMsgs", errorMsgs);
		//
		// try {
		// // 接收請求參數,輸入格式錯誤處理
		// String str = req.getParameter("guideId");
		// if (str == null || (str.trim()).length() == 0) {
		// errorMsgs.add("請輸入指南編號");
		// }
		//
		// if (!errorMsgs.isEmpty()) {
		// RequestDispatcher failureView = req.getRequestDispatcher("/test.jsp");
		// failureView.forward(req, res);
		// return;// 程式中斷
		// }
		//
		// String guideId = null;
		// try {
		// guideId = new String(str);
		// } catch (Exception e) {
		// errorMsgs.add("指南編號格式不正確");
		// }
		// // Send the use back to the form, if there were errors
		// if (!errorMsgs.isEmpty()) {
		// RequestDispatcher failureView = req.getRequestDispatcher("/test.jsp");
		// failureView.forward(req, res);
		// return;// 程式中斷
		// }
		//
		// // 開始查資料
		// GuideDAO dao = new GuideDAO();
		// GuideVO guideVO = dao.findByPrimaryKey(guideId);
		// if (guideId == null) {
		// errorMsgs.add("查無資料");
		// }
		// // Send the use back to the form, if there were errors
		// if (!errorMsgs.isEmpty()) {
		// RequestDispatcher failureView = req.getRequestDispatcher("/test.jsp");
		// failureView.forward(req, res);
		// return;// 程式中斷
		// }
		//
		// // 查詢完成,準備轉交
		// req.setAttribute("guideVO", guideVO); // 資料庫取出的guideVO物件,存入req
		// String url = "/testGuideSelect.jsp";
		//
		// RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交
		// successView.forward(req, res);
		//
		// // res.sendRedirect(url);
		//
		// } catch (Exception e) {
		// errorMsgs.add("無法取得資料:" + e.getMessage());
		// RequestDispatcher failureView = req.getRequestDispatcher("/test.jsp");
		// failureView.forward(req, res);
		// }
		//
		// }

		else if ("getOne_For_Display".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				// 接收請求參數,輸入格式錯誤處理
				String str = req.getParameter("guideId");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入指南編號");
				}

				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/test.jsp");
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
					RequestDispatcher failureView = req.getRequestDispatcher("/test.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				// 開始查資料
				GuideDAO dao = new GuideDAO();
				GuideVO guideVO = dao.findByPrimaryKey(guideId);
				if (guideId == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/test.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				// 查詢完成,準備轉交
				req.setAttribute("guideVO", guideVO); // 資料庫取出的guideVO物件,存入req
				String url = "/testGuideSelect.jsp";

				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交
				successView.forward(req, res);

				// res.sendRedirect(url);

			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/test.jsp");
				failureView.forward(req, res);
			}

		}

		else if ("getAll".equals(action)) {

			GuideDAO dao = new GuideDAO();
			List<GuideVO> list = dao.getAll();

			HttpSession session = req.getSession();
			session.setAttribute("list", list);    // 資料庫取出的list物件,存入session
			// Send the Success view
			String url = "";
			RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交listAllEmp2_getFromSession.jsp
			successView.forward(req, res);
			return;

		}
	}

}
