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
				// req���o���
				String memId = req.getParameter("memId");
				String guideContent = req.getParameter("guideContent");
				String guideTitle = req.getParameter("guideTitle");
				String guideArea = req.getParameter("guideArea");
				// ���o�s�W���
				GuideVO guideVO = new GuideVO();
				guideVO.setMemId(memId);
				guideVO.setGuideContent(guideContent);
				guideVO.setGuideTitle(guideTitle);
				guideVO.setGuideArea(guideArea);

				GuideDAO dao = new GuideDAO();
				dao.insert(guideVO);

				System.out.println("�s�W���\");
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				res.sendRedirect("");
			}
		} else if ("delete".equals(action)) {
			try {
				// req���o���
				String guideId = req.getParameter("guideId");
				// ���o�R�����
				GuideVO guideVO = new GuideVO();
				guideVO.setGuideId(guideId);

				GuideDAO dao = new GuideDAO();
				dao.delete(guideId);
				System.out.println("�R�����\");

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				res.sendRedirect("");
			}

		} else if ("update".equals(action)) {
			try {
				// req���o���
				String guideId = req.getParameter("guideId");
				String guideTitle = req.getParameter("guideTitle");
				String guideContent = req.getParameter("guideContent");
				Integer guideStatus = Integer.parseInt(req.getParameter("guideStatus"));

				// �Ы�DAO����J�Ѽ�
				GuideVO guideVO = new GuideVO();
				guideVO.setGuideTitle(guideTitle);
				guideVO.setGuideContent(guideContent);
				guideVO.setGuideStatus(guideStatus);
				guideVO.setGuideId(guideId);

				GuideDAO dao = new GuideDAO();
				dao.update(guideVO);

				System.out.println("�ק令�\");
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
		// // �����ШD�Ѽ�,��J�榡���~�B�z
		// String str = req.getParameter("guideId");
		// if (str == null || (str.trim()).length() == 0) {
		// errorMsgs.add("�п�J���n�s��");
		// }
		//
		// if (!errorMsgs.isEmpty()) {
		// RequestDispatcher failureView = req.getRequestDispatcher("/test.jsp");
		// failureView.forward(req, res);
		// return;// �{�����_
		// }
		//
		// String guideId = null;
		// try {
		// guideId = new String(str);
		// } catch (Exception e) {
		// errorMsgs.add("���n�s���榡�����T");
		// }
		// // Send the use back to the form, if there were errors
		// if (!errorMsgs.isEmpty()) {
		// RequestDispatcher failureView = req.getRequestDispatcher("/test.jsp");
		// failureView.forward(req, res);
		// return;// �{�����_
		// }
		//
		// // �}�l�d���
		// GuideDAO dao = new GuideDAO();
		// GuideVO guideVO = dao.findByPrimaryKey(guideId);
		// if (guideId == null) {
		// errorMsgs.add("�d�L���");
		// }
		// // Send the use back to the form, if there were errors
		// if (!errorMsgs.isEmpty()) {
		// RequestDispatcher failureView = req.getRequestDispatcher("/test.jsp");
		// failureView.forward(req, res);
		// return;// �{�����_
		// }
		//
		// // �d�ߧ���,�ǳ����
		// req.setAttribute("guideVO", guideVO); // ��Ʈw���X��guideVO����,�s�Jreq
		// String url = "/testGuideSelect.jsp";
		//
		// RequestDispatcher successView = req.getRequestDispatcher(url); // ���\���
		// successView.forward(req, res);
		//
		// // res.sendRedirect(url);
		//
		// } catch (Exception e) {
		// errorMsgs.add("�L�k���o���:" + e.getMessage());
		// RequestDispatcher failureView = req.getRequestDispatcher("/test.jsp");
		// failureView.forward(req, res);
		// }
		//
		// }

		else if ("getOne_For_Display".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				// �����ШD�Ѽ�,��J�榡���~�B�z
				String str = req.getParameter("guideId");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("�п�J���n�s��");
				}

				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/test.jsp");
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
					RequestDispatcher failureView = req.getRequestDispatcher("/test.jsp");
					failureView.forward(req, res);
					return;// �{�����_
				}

				// �}�l�d���
				GuideDAO dao = new GuideDAO();
				GuideVO guideVO = dao.findByPrimaryKey(guideId);
				if (guideId == null) {
					errorMsgs.add("�d�L���");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/test.jsp");
					failureView.forward(req, res);
					return;// �{�����_
				}

				// �d�ߧ���,�ǳ����
				req.setAttribute("guideVO", guideVO); // ��Ʈw���X��guideVO����,�s�Jreq
				String url = "/testGuideSelect.jsp";

				RequestDispatcher successView = req.getRequestDispatcher(url); // ���\���
				successView.forward(req, res);

				// res.sendRedirect(url);

			} catch (Exception e) {
				errorMsgs.add("�L�k���o���:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/test.jsp");
				failureView.forward(req, res);
			}

		}

		else if ("getAll".equals(action)) {

			GuideDAO dao = new GuideDAO();
			List<GuideVO> list = dao.getAll();

			HttpSession session = req.getSession();
			session.setAttribute("list", list);    // ��Ʈw���X��list����,�s�Jsession
			// Send the Success view
			String url = "";
			RequestDispatcher successView = req.getRequestDispatcher(url);// ���\���listAllEmp2_getFromSession.jsp
			successView.forward(req, res);
			return;

		}
	}

}
