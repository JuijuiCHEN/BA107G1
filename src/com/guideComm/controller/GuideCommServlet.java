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
import com.guideComm.model.GuideCommService;
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

		System.out.println("action = " + action);

		if ("insert".equals(action)) {

			try {
				String guideId = req.getParameter("guideId");
				String memId = req.getParameter("memId");
				String commContent = req.getParameter("commContent");
				GuideCommVO guideCommVO = new GuideCommVO();
				guideCommVO.setGuideId(guideId);
				guideCommVO.setMemId(memId);
				guideCommVO.setCommContent(commContent);

				/*************************** 2.�}�l�s�W��� ***************************************/
				GuideCommService commSvc = new GuideCommService();
				commSvc.addComm(guideCommVO);
				System.out.println("commContent(servlet)= " + commContent);
				System.out.println("�d���s�W���\");

				/*************************** 3.�s�W����,�ǳ����(Send the Success view) ***********/
				String url = "/guide.do?action=getOne&guideId=" + guideCommVO.getGuideId();
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				/*************************** ��L�i�઺���~�B�z **********************************/
			} catch (Exception e) {
				e.printStackTrace();
				// ������~����
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

				System.out.println("�ק令�\");

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
				System.out.println("�R�����\");

			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if ("getOne_For_Display".equals(action)) {
			System.out.println("getOne_For_Display");
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				// �����ШD�Ѽ�,��J�榡���~�B�z
				String str = req.getParameter("commId");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("�п�J���n�s��");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front_end/select_page.jsp");
					failureView.forward(req, res);
					return;// �{�����_
				}
				String commId = null;
				try {
					commId = new String(str);
				} catch (Exception e) {
					errorMsgs.add("���n�s���榡�����T");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front_end/select_page.jsp");
					failureView.forward(req, res);
					return;// �{�����_
				}

				// �}�l�d���

				GuideCommService commSvc = new GuideCommService();
				GuideCommVO guideCommVO = commSvc.getOne(commId);

				if (commId == null) {
					errorMsgs.add("�d�L���");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front_end/select_page.jsp");
					failureView.forward(req, res);
					return;// �{�����_
				}

				// �d�ߧ���,�ǳ����
				req.setAttribute("guideCommVO", guideCommVO); // ��Ʈw���X��guideVO����,�s�Jreq
				String url = "/testCommSelect.jsp";

				RequestDispatcher successView = req.getRequestDispatcher(url); // ���\���
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add("�L�k���o���:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front_end/select_page.jsp");
				failureView.forward(req, res);

			}
		} else if ("getAllFromGuideId".equals(action)) {
			System.out.println("getAllFromGuideId");
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.�����ШD�Ѽ� - ��J�榡�����~�B�z **********************/
				String str = req.getParameter("guideId");

				System.out.println("guideId = " + str);

				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("�п�J���n�s��");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front_end/select_page.jsp");
					failureView.forward(req, res);
					return;// �{�����_
				}
				String guideId = null;
				try {
					guideId = new String(str);
				} catch (Exception e) {
					errorMsgs.add("���n�s���榡�����T");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front_end/select_page.jsp");
					failureView.forward(req, res);
					return;// �{�����_
				}
				/*************************** 2.�}�l�d�߸�� *****************************************/
				GuideCommService guideCommSvc = new GuideCommService();
				List<GuideCommVO> guideCommlist = guideCommSvc.getAllFromGuideId(guideId);

				if (guideCommlist.size() < 1) {
					errorMsgs.add("�S������H�d��");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front_end/guide/listGuideComm.jsp");
					failureView.forward(req, res);
					return;// �{�����_
				}
				/*************************** 3.�d�ߧ���,�ǳ����(Send the Success view) *************/
				req.setAttribute("guideCommlist", guideCommlist); // ��Ʈw���X��guideVO����,�s�Jreq
				String url = "/front_end/guide/liseAreaGuide.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // ���\���
				successView.forward(req, res);
				/*************************** ��L�i�઺���~�B�z *************************************/
			} catch (Exception e) {
				System.out.println("�o�Ϳ��~");
				e.printStackTrace();
				errorMsgs.add("�L�k���o���:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front_end/select_page.jsp");
				failureView.forward(req, res);
			}

		}

	}
}