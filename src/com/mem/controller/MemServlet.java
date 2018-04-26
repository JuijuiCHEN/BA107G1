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
		// ���@�ӷ|��
		if ("getOne_For_Display".equals(action)) { // �Ӧ�select_page.jsp���ШD
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				/***************************
				 * 1.�����ШD�Ѽ� - ��J�榡�����~�B�z
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
					return;// �{�����_
				}

				/*************************** 2.�}�l�d�߸�� *****************************************/
				MemDAO dao = new MemDAO();
				MemVO memVO = dao.findByPrimaryKey(mem_id);
				if (memVO == null) {
					errorMsgs.add("�d�L���");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/select_page.jsp");
					failureView.forward(req, res);
					return;// �{�����_
				}

				/***************************
				 * 3.�d�ߧ���,�ǳ����(Send the Success view)
				 *************/
				req.setAttribute("memVO", memVO); // ��Ʈw���X��memVO����,�s�Jreq
				String url = "/back_end/mem/listOneMem.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // ���\���
																				// listOneMem.jsp
				successView.forward(req, res);
				/*************************** ��L�i�઺���~�B�z *************************************/
			} catch (Exception e) {
				e.printStackTrace();
				errorMsgs.add("�L�k���o���:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/select_page.jsp");
				failureView.forward(req, res);
			}
		}
		// �q��ݥ����d�߷|���ק�
		if ("getOne_For_Update".equals(action)) { // �Ӧ�listAllMem.jsp
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			String requestURL = req.getParameter("requestURL"); // �e�X�ק諸�ӷ��������|:
			try {
				/*************************** 1.�����ШD�Ѽ� ****************************************/
				String mem_id = new String(req.getParameter("mem_id"));
				/*************************** 2.�}�l�d�߸�� ****************************************/
				MemService memSvc = new MemService();
				MemVO memVO = memSvc.getOneMemID(mem_id);
				/***************************
				 * 3.�d�ߧ���,�ǳ����(Send the Success view)
				 ************/
				req.setAttribute("memVO", memVO); // ��Ʈw���X��memVO����,�s�Jreq
				String url = "/back_end/mem/update_mem_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // ���\���update_mem_input.jsp
				successView.forward(req, res);

				/*************************** ��L�i�઺���~�B�z ************************************/
			} catch (Exception e) {
				errorMsgs.add("�ק��ƨ��X�ɥ���:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher(requestURL);
				failureView.forward(req, res);
			}
		}

		if ("update".equals(action)) { // �Ӧ�update_mem_input.jsp���ШD
			System.out.println("�����update��??");
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			imgUpload img = new imgUpload();

			String requestURL = req.getParameter("requestURL"); // �e�X�ק諸�ӷ��������|:
																// �i�ର�i/mem/listAllMem.jsp�j

			try {
				/***************************
				 * 1.�����ШD�Ѽ� - ��J�榡�����~�B�z
				 **********************/
				String mem_id = req.getParameter("mem_id").trim();
				String mem_acc = req.getParameter("mem_acc").trim();
				String mem_pw = req.getParameter("mem_pw").trim();
				java.sql.Date mem_rgdate = null;
				try {
					mem_rgdate = java.sql.Date.valueOf(req.getParameter("mem_rgdate").trim());
				} catch (IllegalArgumentException e) {
					mem_rgdate = new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("�п�J���!");
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
					req.setAttribute("memVO", memVO); // �t����J�榡���~��memVO����,�]�s�Jreq
					RequestDispatcher failureView = req.getRequestDispatcher("/mem/update_mem_input.jsp");
					failureView.forward(req, res);
					return; // �{�����_
				}

				/*************************** 2.�}�l�ק��� *****************************************/
				MemService memSvc = new MemService();
				memVO = memSvc.updateMem(mem_id, mem_acc, mem_pw, mem_name, mem_email, mem_addr, mem_tel, mem_sex,
						mem_file, mem_status, mem_rgdate, mem_introduction, mem_exp_owner);
				/***************************
				 * 3.�ק粒��,�ǳ����(Send the Success view)
				 *************/

				RequestDispatcher successView = req.getRequestDispatcher("/back_end/mem/listAllMem.jsp"); // �ק令�\��,���^�e�X�ק諸�ӷ�����
				successView.forward(req, res);
				System.out.println("���\�ק�");

				/*************************** ��L�i�઺���~�B�z *************************************/
			} catch (Exception e) {
				errorMsgs.add("�ק��ƥ���:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/mem/update_mem_input.jsp");
				failureView.forward(req, res);
				System.out.println("���Ѱ�><");
			}
		}
		if ("insert".equals(action)) { // �Ӧ�addMem.jsp���ШD
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
				/*************************** �s�W��� ***************************************/
				MemService memSvc = new MemService();
				memSvc.addMem(mem_acc, mem_pw, mem_name, mem_email, mem_addr, mem_tel, mem_status, mem_sex,
						mem_introduction, mem_exp_owner);
				/***************************************
				 * �s�W����,�ǳ����(Send the Success view)*
				 ***************************************/
				String url = "/front_end/index.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // �s�W���\�����index.jsp
				successView.forward(req, res);
				System.out.println("suc");
				/*************************** ��L�i�઺���~�B�z **********************************/
			} catch (Exception e) {
				errorMsgs.put("Exception", e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front_end/index.jsp");
				failureView.forward(req, res);
				System.out.println("fail?");
				return;
			}
		}
		if ("user_update".equals(action)) { // �Ӧ�update_mem_input.jsp���ШD
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			System.out.println("u�Su��ӨϥΪ̭ק�e����><");
			req.setAttribute("errorMsgs", errorMsgs);
			String requestURL = req.getParameter("requestURL"); // �e�X�ק諸�ӷ��������|:
			try {
				/*************************** 1.�����ШD�Ѽ� ****************************************/
				String mem_id = new String(req.getParameter("mem_id"));
				/*************************** 2.�}�l�d�߸�� ****************************************/
				MemService memSvc = new MemService();
				MemVO memVO = memSvc.getOneMemID(mem_id);
				/***************************
				 * 3.�d�ߧ���,�ǳ����(Send the Success view)
				 ************/
				req.setAttribute("memVO", memVO); // ��Ʈw���X��memVO����,�s�Jreq
				String url = "/front_end/mem/user_update.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // ���\���update_mem_input.jsp
				successView.forward(req, res);

				/*************************** ��L�i�઺���~�B�z ************************************/
			} catch (Exception e) {
				errorMsgs.add("�ק��ƨ��X�ɥ���:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher(requestURL);
				failureView.forward(req, res);
			}
		}

		
		if ("usertoupdate".equals(action)) { // �Ӧ�update_mem_input.jsp���ШD
			System.out.println("�����usertoupdate��??");
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			imgUpload img = new imgUpload();
			String requestURL = req.getParameter("requestURL"); // �e�X�ק諸�ӷ��������|:
																// �i�ର�i/mem/listAllMem.jsp�j
																
			try {
				/***************************
				 * 1.�����ШD�Ѽ� - ��J�榡�����~�B�z
				 **********************/
				String mem_id = req.getParameter("mem_id").trim();
				String mem_acc = req.getParameter("mem_acc").trim();
				String mem_pw = req.getParameter("mem_pw").trim();
				java.sql.Date mem_rgdate = null;
				try {
					mem_rgdate = java.sql.Date.valueOf(req.getParameter("mem_rgdate").trim());
				} catch (IllegalArgumentException e) {
					mem_rgdate = new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("�п�J���!");
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
					req.setAttribute("memVO", memVO); // �t����J�榡���~��memVO����,�]�s�Jreq
					RequestDispatcher failureView = req.getRequestDispatcher("/front_end/mem/user_update.jsp");
					failureView.forward(req, res);
					
					System.out.println("�����~��");
					return; // �{�����_
				}

				/*************************** 2.�}�l�ק��� *****************************************/
				MemService memSvc = new MemService();
				memVO = memSvc.updateMem(mem_id, mem_acc, mem_pw, mem_name, mem_email, mem_addr, mem_tel, mem_sex, mem_file, mem_status, mem_rgdate, mem_introduction, mem_exp_owner);
				/***************************
				 * 3.�ק粒��,�ǳ����(Send the Success view)
				 *************/

				RequestDispatcher successView = req.getRequestDispatcher("/front_end/index.jsp"); // �ק令�\��,���^�e�X�ק諸�ӷ�����
				successView.forward(req, res);
				System.out.println("���\�ק�");

				/*************************** ��L�i�઺���~�B�z *************************************/
			} catch (Exception e) {
				errorMsgs.add("�ק��ƥ���:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front_end/mem/user_update.jsp");
				failureView.forward(req, res);
				System.out.println("���Ѱ�><");
			}
		}
		//new add
		if ("updateMyPage".equals(action)) { // �Ӧ�MyIntrdPage.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				String introduction = req.getParameter("introduction").trim();
				if (introduction == null || introduction.trim().length() == 0) {
					errorMsgs.add("�ӤH���нФŪť�");
				}
				
				String mem_id = req.getParameter("mem_id").trim();
				
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front_end/mem/UpdateMyIntrd.jsp");
					failureView.forward(req, res);
					return; //�{�����_
				}
				/*************************** �s�W��� ***************************************/
				MemService memSvc = new MemService();
				memSvc.updatemypage(introduction, mem_id);
				/***************************************
				 * �s�W����,�ǳ����(Send the Success view)*
				 ***************************************/
				RequestDispatcher successView = req.getRequestDispatcher("/front_end/mem/MyIntrdPage.jsp"); // �s�W���\�����listAllMem.jsp
				successView.forward(req, res);
				/*************************** ��L�i�઺���~�B�z **********************************/
			} catch (RuntimeException e) {
				errorMsgs.add("�ק��ƥ���:"+e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front_end/mem/UpdateMyIntrd.jsp");
				failureView.forward(req, res);
				throw new RuntimeException(e.getMessage());
			}
		}
		//new add
		if ("goUpdateMyPage".equals(action)) { // �Ӧ�MyIntrdPage.jsp���ШD

			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***************************************
				 * �s�W����,�ǳ����(Send the Success view)*
				 ***************************************/
				RequestDispatcher successView = req.getRequestDispatcher("/front_end/mem/UpdateMyIntrd.jsp"); // �s�W���\�����listAllMem.jsp
				successView.forward(req, res);
				/*************************** ��L�i�઺���~�B�z **********************************/
			} catch (Exception e) {
				errorMsgs.put("Exception", e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front_end/mem/UpdateMyIntrd.jsp");
				failureView.forward(req, res);
				return;
			}
		}
	}
}
