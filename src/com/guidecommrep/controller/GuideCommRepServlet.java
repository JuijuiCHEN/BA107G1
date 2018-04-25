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
		System.out.println("���쪺action:" + action);

		if ("getOne_For_Handle".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			String requestURL = req.getParameter("requestURL");
			System.out.println("�e�X�ק諸�ӷ��������|:" + requestURL);

			try {
				System.out.println("�ڶi��try�F");
				// �����ШD�Ѽ�
				String g_comm_rep_id = req.getParameter("g_comm_rep_id");
				System.out.println("������F�ШD�Ѽ�" + g_comm_rep_id);

				GuideCommRepService gcrSvc = new GuideCommRepService();

				GuideCommRepVO guideCommRepVO = gcrSvc.getOneGuideCommRep(g_comm_rep_id);

				System.out.println("guideCommRepVO=" + guideCommRepVO);

				// �d�ߧ��������
				req.setAttribute("guideCommRepVO", guideCommRepVO);
				RequestDispatcher successView = req.getRequestDispatcher(requestURL);
				successView.forward(req, res);

				System.out.println("��Ƭd�ߧ���");
				// ��L���~�B�z
			} catch (Exception e) {
				errorMsgs.add("�d�߸�ƥ���" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher(requestURL);
				failureView.forward(req, res);
			}

		}

		if ("update".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			String requestURL = req.getParameter("requestURL");
			System.out.println("�e�X�ק諸�ӷ��������|:" + requestURL);

			GuideCommRepService gcrSvc = new GuideCommRepService();
			try {
				// �����ШD�Ѽ�
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

				// �}�l�ק���
				gcrSvc.updateGuideCommRep(g_comm_rep_id, guide_comm_rep_status);

				// �ק粒�������

				RequestDispatcher successView = req.getRequestDispatcher(requestURL);
				successView.forward(req, res);

				System.out.println("��ƳB�z����");

				// ��L�i�઺���~�B�z
			} catch (Exception e) {
				errorMsgs.add("�ק��ƥ���" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher(requestURL);
				failureView.forward(req, res);
			}
		}

		if ("insert".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			String requestURL = req.getParameter("requestURL");
			System.out.println("�e�X�ק諸�ӷ��������|:" + requestURL);

			try {
				// �����ШD�Ѽ�
				String comm_id = new String(req.getParameter("comm_id"));
				String mem_id = new String(req.getParameter("mem_id"));
				String guide_comm_rep_content = new String(req.getParameter("guide_comm_rep_content"));

				if (guide_comm_rep_content == null || guide_comm_rep_content.trim().length() == 0) {
					errorMsgs.add("�л������|��]");
				}

				GuideCommRepVO guideCommRepVO = new GuideCommRepVO();
				System.out.println("guideCommRepVO=" + guideCommRepVO);

				guideCommRepVO.setG_comm_rep_id(comm_id);
				guideCommRepVO.setMem_id(mem_id);
				guideCommRepVO.setGuide_comm_rep_content(guide_comm_rep_content);

				// ��L���~�B�z
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("guideCommRepVO", guideCommRepVO);
					RequestDispatcher failureView = req.getRequestDispatcher("requestURL");
					failureView.forward(req, res);
					return;
				}

				// �}�l�s�W���
				GuideCommRepService gcrSvc = new GuideCommRepService();
				gcrSvc.addGuideCommRep(comm_id, mem_id, guide_comm_rep_content);

				// �s�W����,�ǳ����
				RequestDispatcher successView = req.getRequestDispatcher(requestURL);
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add("�s�W��ƥ���" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher(requestURL);
				failureView.forward(req, res);
			}
		}
	}
}
