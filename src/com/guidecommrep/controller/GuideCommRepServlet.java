package com.guidecommrep.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.guidecommrep.model.GuideCommRepService;
import com.guidecommrep.model.GuideCommRepVO;

public class GuideCommRepServlet extends HttpServlet {

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");

		String action = req.getParameter("action");
		System.out.println("收到的action:" + action);

		if ("getOne_For_Handle".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			String requestURL = req.getParameter("requestURL");
			System.out.println("送出修改的來源網頁路徑:" + requestURL);

			try {
				System.out.println("我進來try了");
				// 接收請求參數
				String g_comm_rep_id = req.getParameter("g_comm_rep_id");
				System.out.println("接收到了請求參數" + g_comm_rep_id);

				GuideCommRepService gcrSvc = new GuideCommRepService();

				GuideCommRepVO guideCommRepVO = gcrSvc.getOneGuideCommRep(g_comm_rep_id);

				System.out.println("guideCommRepVO=" + guideCommRepVO);

				// 查詢完成轉交資料
				req.setAttribute("guideCommRepVO", guideCommRepVO);
				RequestDispatcher successView = req.getRequestDispatcher(requestURL);
				successView.forward(req, res);

				System.out.println("資料查詢完成");
				// 其他錯誤處理
			} catch (Exception e) {
				errorMsgs.add("查詢資料失敗" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher(requestURL);
				failureView.forward(req, res);
			}

		}

		if ("update".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			String requestURL = req.getParameter("requestURL");
			System.out.println("送出修改的來源網頁路徑:" + requestURL);

			GuideCommRepService gcrSvc = new GuideCommRepService();
			try {
				// 接收請求參數
				String g_comm_rep_id = req.getParameter("g_comm_rep_id");
				String guide_comm_rep_status = new String(req.getParameter("guide_comm_rep_status"));

				GuideCommRepVO guideCommRepVO = gcrSvc.getOneGuideCommRep(g_comm_rep_id);
				guideCommRepVO.setG_comm_rep_id(g_comm_rep_id);
				guideCommRepVO.setGuide_comm_rep_status(guide_comm_rep_status);
				System.out.println("guideCommRepVO=" + guideCommRepVO);

				if (!errorMsgs.isEmpty()) {
					req.setAttribute("guideCommRepVO", guideCommRepVO);
					RequestDispatcher failureView = req.getRequestDispatcher(requestURL);
					failureView.forward(req, res);
					return;
				}

				// 開始修改資料
				gcrSvc.updateGuideCommRep(g_comm_rep_id, guide_comm_rep_status);

				// 修改完成轉交資料

				RequestDispatcher successView = req.getRequestDispatcher(requestURL);
				successView.forward(req, res);

				System.out.println("資料處理完成");

				// 其他可能的錯誤處理
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher(requestURL);
				failureView.forward(req, res);
			}
		}

		if ("insert".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			String requestURL = req.getParameter("requestURL");
			System.out.println("送出修改的來源網頁路徑:" + requestURL);

			try {
				// 接收請求參數
				String comm_id = new String(req.getParameter("comm_id"));
				String mem_id = new String(req.getParameter("mem_id"));
				String guide_comm_rep_content = new String(req.getParameter("guide_comm_rep_content"));

				if (guide_comm_rep_content == null || guide_comm_rep_content.trim().length() == 0) {
					errorMsgs.add("請說明檢舉原因");
				}

				GuideCommRepVO guideCommRepVO = new GuideCommRepVO();
				System.out.println("guideCommRepVO=" + guideCommRepVO);

				guideCommRepVO.setG_comm_rep_id(comm_id);
				guideCommRepVO.setMem_id(mem_id);
				guideCommRepVO.setGuide_comm_rep_content(guide_comm_rep_content);

				// 其他錯誤處理
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("guideCommRepVO", guideCommRepVO);
					RequestDispatcher failureView = req.getRequestDispatcher("requestURL");
					failureView.forward(req, res);
					return;
				}

				// 開始新增資料
				GuideCommRepService gcrSvc = new GuideCommRepService();
				gcrSvc.addGuideCommRep(comm_id, mem_id, guide_comm_rep_content);

				// 新增完成,準備轉交
				RequestDispatcher successView = req.getRequestDispatcher(requestURL);
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add("新增資料失敗" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher(requestURL);
				failureView.forward(req, res);
			}
		}
	}
}
