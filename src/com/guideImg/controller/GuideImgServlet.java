package com.guideImg.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.guideImg.model.GuideImgService;
import com.guideImg.model.GuideImgVO;

@WebServlet("/guideImg.do")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 500 * 1024 * 1024, maxRequestSize = 5 * 500 * 1024
		* 1024)
// ��ƾڶq�j��fileSizeThreshold�Ȯ�, ���e�N�Q�g�J�Ϻ�
// �W�ǹL�{���L�׬O��Ӥ��W�LmaxFileSize��, �Ϊ̤W���`�q�j��maxRequestSize��,���|�ߥXIllegalStateException���`
public class GuideImgServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String saveDirectory = "/images_uploaded"; // �W���ɮת��ت��ؿ�, �N���U��26~30���java.io.file ��contextPath���U,
												 // �۰ʫإߥؿ�

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8"); // �B�z�����ɦW
		// res.setContentType("text/html; charset=Big5");

		String action = req.getParameter("action");

		System.out.println("action =" + action);

		if ("insert".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				/*********************** 1.�����ШD�Ѽ� - ��J�榡�����~�B�z *************************/
				String guideId = req.getParameter("guideId");
				System.out.println("guideId =" + guideId);
				GuideImgVO guideImgVO = null;
				PrintWriter out = res.getWriter();
				String realPath = getServletContext().getRealPath(saveDirectory);
				File fsaveDirectory = new File(realPath);
				if (!fsaveDirectory.exists())
					fsaveDirectory.mkdirs(); // ��ContextPath���U,�۰ʫإߥت��ؿ�
				int count = 0;
				Collection<Part> parts = req.getParts();
				System.out.println(parts.size());
				for (Part part : parts) {
					String filename = getFileNameFromPart(part);
					System.out.println("filename:" + filename);
					if (getFileNameFromPart(part) != null && part.getContentType() != null) {
						System.out.println("�o���ɮ׷s�W���\:" + filename);
						count++;
						// long size = part.getSize();
						File f = new File(fsaveDirectory, filename);
						// �Q��File����,�g�J�ت��ؿ�,�W�Ǧ��\
						part.write(f.toString());
						// �B�~����InputStream �P byte[] (���N��model��VO�w���ǳ�)
						InputStream in = part.getInputStream();
						byte[] guideImgContent = new byte[in.available()];
						in.read(guideImgContent);
						in.close();
						out.print("buffer length: " + guideImgContent.length);

						// ���o�s�W���
						guideImgVO = new GuideImgVO();
						guideImgVO.setGuideId(guideId);
						guideImgVO.setGuideImgContent(guideImgContent);

						/****************************
						 * 2.�}�l�s�W���
						 ***************************************/
						GuideImgService guideImgSvc = new GuideImgService();
						guideImgVO = guideImgSvc.addGuideImg(guideId, guideImgContent);
						System.out.println("�Ϥ��s�W���\");
						// �B�~���ըq��
						out.println("<br><img src=\"" + req.getContextPath() + saveDirectory + "/" + filename + "\">");
						out.println();
					}
				}
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("guideImgVO", guideImgVO); // �t����J�榡���~��guideImgVO����,�]�s�Jreq
					RequestDispatcher failureView = req.getRequestDispatcher("imgbbb.jsp");
					failureView.forward(req, res);
					return;

				}
				out.write("<h2> �`�@�W��: " + count + "�i�� </h2>");
				/*************************** 3.�s�W����,�ǳ����(Send the Success view) ***********/
				String url = "ok.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // �s�W���\�����listAllEmp.jsp
				successView.forward(req, res);
				/*************************** ��L�i�઺���~�B�z **********************************/
			} catch (Exception e) {
				e.printStackTrace();
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("imgxx.jsp");
				failureView.forward(req, res);
			}

		} else if ("delete".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.�����ШD�Ѽ� ***************************************/
				String guideImgId = req.getParameter("guideImgId");

				/*************************** 2.�}�l�R����� ***************************************/
				// GuideImgVO guideImgVO = new GuideImgVO();
				// guideImgVO.setGuideImgId(guideImgId);

				GuideImgService guideImgSvc = new GuideImgService();
				guideImgSvc.deleteGuideImg(guideImgId);
				System.out.println("�Ϥ��R�����\");
				/*************************** 3.�R������,�ǳ����(Send the Success view) ***********/
				String url = "xxx.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// �R�����\��,���^�e�X�R�����ӷ�����
				successView.forward(req, res);
				/*************************** ��L�i�઺���~�B�z **********************************/
			} catch (Exception e) {
				e.printStackTrace();
				errorMsgs.add("�R����ƥ���:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("eee.jsp");
				failureView.forward(req, res);
			}
		} else if ("getOne_For_Display".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			ServletOutputStream out = res.getOutputStream();
			GuideImgService guideImgSvc = new GuideImgService();
			try {
				/*************************** 1.�����ШD�Ѽ� - ��J�榡�����~�B�z **********************/
				String guideImgId = req.getParameter("guideImgId");

				String guideId = req.getParameter("guideId");

				System.out.println("guideImgId = " + guideImgId);
				System.out.println("guideId = " + guideId);
				res.setContentType("image/gif");

				/*************************** 2.�}�l�d�߸�� *****************************************/
				if (guideImgSvc != null) {
					GuideImgVO guideImgVO = guideImgSvc.getOneGuideImg(guideImgId);
					/*************************** ��Ϥ���X(out.write)�쭶�� ****************************/
					out.write(guideImgVO.getGuideImgContent());
				}

				/*************************** ��L�i�઺���~�B�z *************************************/
			} catch (Exception e) {
				e.printStackTrace();
				GuideImgVO guideImgVO = guideImgSvc.getOneGuideImg("GI000020");
				/*************************** ��Ϥ���X(out.write)�쭶�� ****************************/
				out.write(guideImgVO.getGuideImgContent());
			}
		}
	}

	public String getFileNameFromPart(Part part) {
		String header = part.getHeader("content-disposition");
		String filename = new File(header.substring(header.lastIndexOf("=") + 2, header.length() - 1)).getName();
		if (filename.length() == 0) {
			return null;
		}
		return filename;
	}
}
