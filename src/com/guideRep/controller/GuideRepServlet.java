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
				/*************************** 1.���o�s�W��� ***************************************/
				String guideId = req.getParameter("guideId");
				String memId = req.getParameter("memId");
				String guideRepContent = new String(req.getParameter("radio").getBytes("ISO-8859-1"), "UTF-8");

				System.out.println("guideRepContent : " + guideRepContent);
				System.out.println("guideId : " + guideId);

				GuideRepVO guideRepVO = new GuideRepVO();
				guideRepVO.setGuideId(guideId);
				guideRepVO.setMemId(memId);
				guideRepVO.setGuideRepContent(guideRepContent);

				/*************************** 2.�}�l�s�W��� ***************************************/
				GuideRepService guideRepSvc = new GuideRepService();
				guideRepSvc.addGuideRep(guideId, memId, guideRepContent);
				System.out.println("���|�s�W���\");
				/*************************** 3.�s�W����,�ǳ����(Send the Success view) ***********/
				String url = "/guide.do?action=getOne&guideId=" + guideId;
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				/*************************** ��L�i�઺���~�B�z **********************************/
			} catch (Exception e) {
				e.printStackTrace();
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/guide/xxx.jsp");
				failureView.forward(req, res);
			}
		} else if ("update".equals(action)) {
			try {
				String guideRepId = req.getParameter("guideRepId");
				Integer guideRepStatus = Integer.parseInt(req.getParameter("guideRepStatus"));

				GuideRepVO guideRepVO = new GuideRepVO();
				guideRepVO.setGuideRepId(guideRepId);
				guideRepVO.setGuideRepStatus(guideRepStatus);

				GuideRepDAO guideRepDAO = new GuideRepDAO();
				guideRepDAO.update(guideRepVO);

				System.out.println("���|�ק令�\");

			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if ("delete".equals(action)) {

			try {
				String guideRepId = req.getParameter("guideRepId");

				GuideRepVO guideRepVO = new GuideRepVO();
				guideRepVO.setGuideRepId(guideRepId);

				GuideRepDAO guideRepDAO = new GuideRepDAO();
				guideRepDAO.delete(guideRepId);

				System.out.println("�R�����\");
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if ("findByPrimaryKey".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				// �����ШD�Ѽ�,��J�榡���~�B�z
				String str = req.getParameter("guideRepId");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("�п�J���n�s��");
				}
				if (!errorMsgs.isEmpty()) {
					System.out.println(errorMsgs);
					RequestDispatcher failureView = req.getRequestDispatcher("/test.jsp");
					failureView.forward(req, res);
					return;// �{�����_
				}
				String guideRepId = null;
				try {
					guideRepId = new String(str);
				} catch (Exception e) {
					errorMsgs.add("���n�s���榡�����T");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					System.out.println(errorMsgs);
					RequestDispatcher failureView = req.getRequestDispatcher("/test.jsp");
					failureView.forward(req, res);
					return;// �{�����_
				}
				// �}�l�d���
				GuideRepDAO dao = new GuideRepDAO();
				GuideRepVO guideRepVO = dao.findByPrimaryKey(guideRepId);
				if (guideRepId == null) {
					errorMsgs.add("�d�L���");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					System.out.println(errorMsgs);
					RequestDispatcher failureView = req.getRequestDispatcher("/test.jsp");
					failureView.forward(req, res);
					return;// �{�����_
				}

				// �d�ߧ���,�ǳ����
				req.setAttribute("guideRepVO", guideRepVO); // ��Ʈw���X��guideVO����,�s�Jreq
				String url = "/testGuideRepSelect.jsp";

				RequestDispatcher successView = req.getRequestDispatcher(url); // ���\���
				successView.forward(req, res);

			} catch (Exception e) {
				e.printStackTrace();
				System.out.println(errorMsgs);
				errorMsgs.add("�L�k���o���:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/test.jsp");
				failureView.forward(req, res);

			}
		}

	}

}
