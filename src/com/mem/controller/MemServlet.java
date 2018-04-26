package com.mem.controller;

import java.io.IOException;
import java.util.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;
import com.mem.model.*;
import com.util.imgUpload;

@MultipartConfig

public class MemServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		// 取一個會員
		if ("getOne_For_Display".equals(action)) { // 來自select_page.jsp的請求
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				/***************************
				 * 1.接收請求參數 - 輸入格式的錯誤處理
				 **********************/
				String str = req.getParameter("mem_id");
				String mem_id = null;
				try {
					mem_id = new String(str);
				} catch (Exception e) {
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/select_page.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 2.開始查詢資料 *****************************************/
				MemDAO dao = new MemDAO();
				MemVO memVO = dao.findByPrimaryKey(mem_id);
				if (memVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/select_page.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/***************************
				 * 3.查詢完成,準備轉交(Send the Success view)
				 *************/
				req.setAttribute("memVO", memVO); // 資料庫取出的memVO物件,存入req
				String url = "/back_end/mem/listOneMem.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交
																				// listOneMem.jsp
				successView.forward(req, res);
				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				e.printStackTrace();
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/select_page.jsp");
				failureView.forward(req, res);
			}
		}
		// 從後端全部查詢會員修改
		if ("getOne_For_Update".equals(action)) { // 來自listAllMem.jsp
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			String requestURL = req.getParameter("requestURL"); // 送出修改的來源網頁路徑:
			try {
				/*************************** 1.接收請求參數 ****************************************/
				String mem_id = new String(req.getParameter("mem_id"));
				/*************************** 2.開始查詢資料 ****************************************/
				MemService memSvc = new MemService();
				MemVO memVO = memSvc.getOneMemID(mem_id);
				/***************************
				 * 3.查詢完成,準備轉交(Send the Success view)
				 ************/
				req.setAttribute("memVO", memVO); // 資料庫取出的memVO物件,存入req
				String url = "/back_end/mem/update_mem_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交update_mem_input.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 ************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料取出時失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher(requestURL);
				failureView.forward(req, res);
			}
		}

		if ("update".equals(action)) { // 來自update_mem_input.jsp的請求
			System.out.println("有近來update嗎??");
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			imgUpload img = new imgUpload();

			String requestURL = req.getParameter("requestURL"); // 送出修改的來源網頁路徑:
																// 可能為【/mem/listAllMem.jsp】

			try {
				/***************************
				 * 1.接收請求參數 - 輸入格式的錯誤處理
				 **********************/
				String mem_id = req.getParameter("mem_id").trim();
				String mem_acc = req.getParameter("mem_acc").trim();
				String mem_pw = req.getParameter("mem_pw").trim();
				java.sql.Date mem_rgdate = null;
				try {
					mem_rgdate = java.sql.Date.valueOf(req.getParameter("mem_rgdate").trim());
				} catch (IllegalArgumentException e) {
					mem_rgdate = new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				}
				String mem_name = req.getParameter("mem_name").trim();
				String mem_tel = req.getParameter("mem_tel").trim();
				String mem_email = req.getParameter("mem_email").trim();
				String mem_status = req.getParameter("mem_status").trim();
				String mem_addr = req.getParameter("mem_addr").trim();
				String mem_sex = req.getParameter("mem_sex").trim();
				byte[] mem_file = img.uploud(getServletContext(), req.getPart("mem_file"));
				String mem_introduction = req.getParameter("mem_introduction").trim();
				String mem_exp_owner = req.getParameter("mem_exp_owner").trim();
				MemVO memVO = new MemVO();
				memVO.setMem_id(mem_id);
				memVO.setMem_acc(mem_acc);
				memVO.setMem_pw(mem_pw);
				memVO.setMem_name(mem_name);
				memVO.setMem_email(mem_email);
				memVO.setMem_addr(mem_addr);
				memVO.setMem_tel(mem_tel);
				memVO.setMem_sex(mem_sex);
				memVO.setMem_file(mem_file);
				memVO.setMem_status(mem_status);
				memVO.setMem_introduction(mem_introduction);
				memVO.setMem_exp_owner(mem_exp_owner);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("memVO", memVO); // 含有輸入格式錯誤的memVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/mem/update_mem_input.jsp");
					failureView.forward(req, res);
					return; // 程式中斷
				}

				/*************************** 2.開始修改資料 *****************************************/
				MemService memSvc = new MemService();
				memVO = memSvc.updateMem(mem_id, mem_acc, mem_pw, mem_name, mem_email, mem_addr, mem_tel, mem_sex,
						mem_file, mem_status, mem_rgdate, mem_introduction, mem_exp_owner);
				/***************************
				 * 3.修改完成,準備轉交(Send the Success view)
				 *************/

				RequestDispatcher successView = req.getRequestDispatcher("/back_end/mem/listAllMem.jsp"); // 修改成功後,轉交回送出修改的來源網頁
				successView.forward(req, res);
				System.out.println("成功修改");

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/mem/update_mem_input.jsp");
				failureView.forward(req, res);
				System.out.println("失敗啦><");
			}
		}
		if ("insert".equals(action)) { // 來自addMem.jsp的請求
			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				System.out.println("insert?? here?");
				String mem_acc = req.getParameter("mem_acc");
				String mem_pw = req.getParameter("mem_pw");
				String mem_name = req.getParameter("mem_name");
				String mem_email = req.getParameter("mem_email");
				String mem_addr = req.getParameter("mem_addr");
				String mem_sex = req.getParameter("mem_sex");
				String mem_introduction = req.getParameter("mem_introduction");
				String mem_exp_owner = req.getParameter("mem_exp_owner");
				String mem_tel = req.getParameter("mem_tel");
				String mem_status = req.getParameter("mem_status");
				/*************************** 新增資料 ***************************************/
				MemService memSvc = new MemService();
				memSvc.addMem(mem_acc, mem_pw, mem_name, mem_email, mem_addr, mem_tel, mem_status, mem_sex,
						mem_introduction, mem_exp_owner);
				/***************************************
				 * 新增完成,準備轉交(Send the Success view)*
				 ***************************************/
				String url = "/front_end/index.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交index.jsp
				successView.forward(req, res);
				System.out.println("suc");
				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.put("Exception", e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front_end/index.jsp");
				failureView.forward(req, res);
				System.out.println("fail?");
				return;
			}
		}
		if ("user_update".equals(action)) { // 來自update_mem_input.jsp的請求
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			System.out.println("u沒u近來使用者修改畫面啦><");
			req.setAttribute("errorMsgs", errorMsgs);
			String requestURL = req.getParameter("requestURL"); // 送出修改的來源網頁路徑:
			try {
				/*************************** 1.接收請求參數 ****************************************/
				String mem_id = new String(req.getParameter("mem_id"));
				/*************************** 2.開始查詢資料 ****************************************/
				MemService memSvc = new MemService();
				MemVO memVO = memSvc.getOneMemID(mem_id);
				/***************************
				 * 3.查詢完成,準備轉交(Send the Success view)
				 ************/
				req.setAttribute("memVO", memVO); // 資料庫取出的memVO物件,存入req
				String url = "/front_end/mem/user_update.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交update_mem_input.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 ************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料取出時失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher(requestURL);
				failureView.forward(req, res);
			}
		}

		
		if ("usertoupdate".equals(action)) { // 來自update_mem_input.jsp的請求
			System.out.println("有近來usertoupdate嗎??");
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			imgUpload img = new imgUpload();
			String requestURL = req.getParameter("requestURL"); // 送出修改的來源網頁路徑:
																// 可能為【/mem/listAllMem.jsp】
																
			try {
				/***************************
				 * 1.接收請求參數 - 輸入格式的錯誤處理
				 **********************/
				String mem_id = req.getParameter("mem_id").trim();
				String mem_acc = req.getParameter("mem_acc").trim();
				String mem_pw = req.getParameter("mem_pw").trim();
				java.sql.Date mem_rgdate = null;
				try {
					mem_rgdate = java.sql.Date.valueOf(req.getParameter("mem_rgdate").trim());
				} catch (IllegalArgumentException e) {
					mem_rgdate = new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				}
				String mem_name = req.getParameter("mem_name").trim();
				String mem_tel = req.getParameter("mem_tel").trim();
				String mem_email = req.getParameter("mem_email").trim();
				String mem_status = req.getParameter("mem_status").trim();
				String mem_addr = req.getParameter("mem_addr").trim();
				String mem_sex = req.getParameter("mem_sex").trim();
				byte[] mem_file = img.uploud(getServletContext(), req.getPart("mem_file"));
				String mem_introduction = req.getParameter("mem_introduction").trim();
				String mem_exp_owner = req.getParameter("mem_exp_owner").trim();
				MemVO memVO = new MemVO();
				memVO.setMem_id(mem_id);
				memVO.setMem_acc(mem_acc);
				memVO.setMem_pw(mem_pw);
				memVO.setMem_name(mem_name);
				memVO.setMem_email(mem_email);
				memVO.setMem_addr(mem_addr);
				memVO.setMem_tel(mem_tel);
				memVO.setMem_sex(mem_sex);
				memVO.setMem_file(mem_file);
				memVO.setMem_status(mem_status);
				memVO.setMem_introduction(mem_introduction);
				memVO.setMem_exp_owner(mem_exp_owner);
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("memVO", memVO); // 含有輸入格式錯誤的memVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/front_end/mem/user_update.jsp");
					failureView.forward(req, res);
					
					System.out.println("有錯誤嗎");
					return; // 程式中斷
				}

				/*************************** 2.開始修改資料 *****************************************/
				MemService memSvc = new MemService();
				memVO = memSvc.updateMem(mem_id, mem_acc, mem_pw, mem_name, mem_email, mem_addr, mem_tel, mem_sex, mem_file, mem_status, mem_rgdate, mem_introduction, mem_exp_owner);
				/***************************
				 * 3.修改完成,準備轉交(Send the Success view)
				 *************/

				RequestDispatcher successView = req.getRequestDispatcher("/front_end/index.jsp"); // 修改成功後,轉交回送出修改的來源網頁
				successView.forward(req, res);
				System.out.println("成功修改");

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front_end/mem/user_update.jsp");
				failureView.forward(req, res);
				System.out.println("失敗啦><");
			}
		}
		//new add
		if ("updateMyPage".equals(action)) { // 來自MyIntrdPage.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				String introduction = req.getParameter("introduction").trim();
				if (introduction == null || introduction.trim().length() == 0) {
					errorMsgs.add("個人介紹請勿空白");
				}
				
				String mem_id = req.getParameter("mem_id").trim();
				
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front_end/mem/UpdateMyIntrd.jsp");
					failureView.forward(req, res);
					return; //程式中斷
				}
				/*************************** 新增資料 ***************************************/
				MemService memSvc = new MemService();
				memSvc.updatemypage(introduction, mem_id);
				/***************************************
				 * 新增完成,準備轉交(Send the Success view)*
				 ***************************************/
				RequestDispatcher successView = req.getRequestDispatcher("/front_end/mem/MyIntrdPage.jsp"); // 新增成功後轉交listAllMem.jsp
				successView.forward(req, res);
				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (RuntimeException e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front_end/mem/UpdateMyIntrd.jsp");
				failureView.forward(req, res);
				throw new RuntimeException(e.getMessage());
			}
		}
		//new add
		if ("goUpdateMyPage".equals(action)) { // 來自MyIntrdPage.jsp的請求

			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***************************************
				 * 新增完成,準備轉交(Send the Success view)*
				 ***************************************/
				RequestDispatcher successView = req.getRequestDispatcher("/front_end/mem/UpdateMyIntrd.jsp"); // 新增成功後轉交listAllMem.jsp
				successView.forward(req, res);
				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.put("Exception", e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front_end/mem/UpdateMyIntrd.jsp");
				failureView.forward(req, res);
				return;
			}
		}
	}
}
