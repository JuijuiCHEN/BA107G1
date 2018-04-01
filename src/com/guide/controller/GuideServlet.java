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

		if ("insert".equals(action)) { // �Ӧ�addGuide.jsp���ШD
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*********************** 1.�����ШD�Ѽ� - ��J�榡�����~�B�z *************************/
				// req���o���
				String memId = req.getParameter("memId");
				String guideTitle = req.getParameter("guideTitle").trim();
				if (guideTitle == null || guideTitle.trim().length() == 0) {
					errorMsgs.add("�峹���D: �ФŪť�");
				}

				String guideContent = req.getParameter("guideContent").trim();
				if (guideContent == null || guideContent.trim().length() == 0) {
					errorMsgs.add("�峹���e: �ФŪť�");
				}

				String guideArea = req.getParameter("guideArea").trim();
				if (guideArea == null || guideArea.trim().length() == 0) {
					errorMsgs.add("�峹�a��: �ФŪť�");
				}

				String guideMap = req.getParameter("guideMap").trim();
				if (guideMap == null || guideMap.trim().length() == 0) {
					errorMsgs.add("�峹�a�}: �ФŪť�");
				}

				// ���o�s�W���
				GuideVO guideVO = new GuideVO();
				guideVO.setMemId(memId);
				guideVO.setGuideTitle(guideTitle);
				guideVO.setGuideContent(guideContent);
				guideVO.setGuideArea(guideArea);
				guideVO.setGuideMap(guideMap);

				if (!errorMsgs.isEmpty()) {
					req.setAttribute("guideVO", guideVO); // �t����J�榡���~��guideVO����,�]�s�Jreq
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/guide/addGuide.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 2.�}�l�s�W��� ***************************************/

				GuideService guideSvc = new GuideService();
				guideVO = guideSvc.addGuide(memId, guideTitle, guideContent, guideArea, guideMap);

				System.out.println("�s�W���\");

				/*************************** 3.�s�W����,�ǳ����(Send the Success view) ***********/
				String url = "/front-end/guide/listOneGuide.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // �s�W���\�����listAllEmp.jsp
				successView.forward(req, res);
				/*************************** ��L�i�઺���~�B�z **********************************/

			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/guide/addGuide.jsp");
				failureView.forward(req, res);
			}

		} else if ("delete".equals(action)) {
			System.out.println("�i��delete");

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				/*************************** 1.�����ШD�Ѽ� ***************************************/
				String guideId = req.getParameter("guideId");

				/*************************** 2.�}�l�R����� ***************************************/
				GuideService guideSvc = new GuideService();
				// ����ݭn�R�����峹�ԲӤ��e
				GuideVO guideVO = guideSvc.getOneGuide(guideId);// 1
				guideSvc.deleteGuide(guideId);
				System.out.println("servlet�R�����\");
				/*************************** 3.�R������,�ǳ����(Send the Success view) ***********/
				String url = "/guide.do?action=getAll_From_MemId&memId=" + guideVO.getMemId();
				RequestDispatcher successView = req.getRequestDispatcher(url); // �R�����\��,���^�e�X�R�����ӷ�����
				successView.forward(req, res);

				/*************************** ��L�i�઺���~�B�z **********************************/
			} catch (Exception e) {
				e.printStackTrace();
				errorMsgs.add("�R����ƥ���:" + e.getMessage());
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
				/*************************** 1.�����ШD�Ѽ� ***************************************/
				// req���o���
				String guideId = req.getParameter("guideId");

				String guideTitle = req.getParameter("guideTitle").trim();
				if (guideTitle == null || guideTitle.trim().length() == 0) {
					errorMsgs.add("�峹���D: �ФŪť�");

				}
				String guideContent = req.getParameter("guideContent").trim();
				if (guideContent == null || guideContent.trim().length() == 0) {
					errorMsgs.add("�峹���e: �ФŪť�");

				}
				GuideVO guideVO = new GuideVO();
				guideVO.setGuideId(guideId);
				guideVO.setGuideTitle(guideTitle);
				guideVO.setGuideContent(guideContent);

				if (!errorMsgs.isEmpty()) {
					req.setAttribute("guideVO", guideVO); // �t����J�榡���~��guideVO����,�]�s�Jreq
					RequestDispatcher failureView = req.getRequestDispatcher("xxx.jsp");
					failureView.forward(req, res);
					return;
				}
				/*************************** 2.�}�l�ק��� ***************************************/

				GuideService guideSvc = new GuideService();
				guideVO = guideSvc.updateGuideFront(guideTitle, guideContent, guideId);
				System.out.println("���n���e�ק令�\");

				guideVO = guideSvc.getOneGuide(guideId);

				/*************************** 3.�ק粒��,�ǳ����(Send the Success view) *************/
				req.setAttribute("guideVO", guideVO); // ��Ʈwupdata���\��,���T��guideVO����,�s�Jreq
				String url = "/front-end/guide/listOneGuide.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // �ק令�\�����aaa.jsp
				successView.forward(req, res);

				/*************************** ��L�i�઺���~�B�z *************************************/
			} catch (Exception e) {
				errorMsgs.add("��ƭק異��:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/select_page.jsp");
				failureView.forward(req, res);
				e.printStackTrace();
			}

		} else if ("updateBack".equals(action)) {
			try {
				// req���o���
				String guideId = req.getParameter("guideId");
				Integer guideStatus = Integer.parseInt(req.getParameter("guideStatus"));

				// �Ы�DAO����J�Ѽ�
				GuideVO guideVO = new GuideVO();
				guideVO.setGuideStatus(guideStatus);
				guideVO.setGuideId(guideId);

				GuideDAO dao = new GuideDAO();
				dao.updateBack(guideVO);

				System.out.println("���n���A�ק令�\");
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
				/*************************** 1.�����ШD�Ѽ� - ��J�榡�����~�B�z **********************/
				String str = req.getParameter("guideId");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("�п�J���n�s��");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/guide/updateFront.jsp");
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
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/select_page.jsp");
					failureView.forward(req, res);
					return;// �{�����_
				}

				/*************************** 2.�}�l�d�߸�� *****************************************/
				GuideService guideSvc = new GuideService();
				GuideVO guideVO = guideSvc.getOneGuide(guideId);
				if (guideVO == null) {
					errorMsgs.add("�d�L���");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/select_page.jsp");
					failureView.forward(req, res);
					return;// �{�����_
				}
				/*************************** 3.�d�ߧ���,�ǳ����(Send the Success view) *************/
				req.setAttribute("guideVO", guideVO); // ��Ʈw���X��guideVO����,�s�Jreq

				String url = null;
				if ("getOne".equals(action))
					url = "/front-end/guide/listOneGuide.jsp";
				else if ("fromListOne".equals(action))
					url = "/front-end/guide/updateFront.jsp";

				RequestDispatcher successView = req.getRequestDispatcher(url); // ���\���
				successView.forward(req, res);

				/*************************** ��L�i�઺���~�B�z *************************************/
			} catch (Exception e) {
				errorMsgs.add("�L�k���o���:" + e.getMessage());
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
				/*************************** 1.�����ШD�Ѽ� - ��J�榡�����~�B�z **********************/
				String str = req.getParameter("memId");

				System.out.println("memId = " + str);

				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("�п�J�|���s��");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("aaa.jsp");
					failureView.forward(req, res);
					return;// �{�����_
				}
				String memId = null;
				try {
					memId = new String(str);
				} catch (Exception e) {
					errorMsgs.add("�|���s���榡�����T");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("bbb.jsp");
					failureView.forward(req, res);
					return;// �{�����_
				}
				/*************************** 2.�}�l�d�߸�� *****************************************/
				GuideService guideSvc = new GuideService();
				List<GuideVO> list = guideSvc.getAllFromOneId(memId);

				if (list.size() < 1) {
					errorMsgs.add("�d�L���");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("ccc.jsp");
					failureView.forward(req, res);
					return;// �{�����_
				}
				/*************************** 3.�d�ߧ���,�ǳ����(Send the Success view) *************/
				req.setAttribute("list", list); // ��Ʈw���X��guideVO����,�s�Jreq
				String url = "/front-end/guide/getAllGuideFromOneId.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // ���\���
				successView.forward(req, res);
				/*************************** ��L�i�઺���~�B�z *************************************/
			} catch (Exception e) {
				System.out.println("�o�Ϳ��~");
				e.printStackTrace();
				errorMsgs.add("�L�k���o���:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("ddd.jsp");
				failureView.forward(req, res);
			}
		}

	}
}
