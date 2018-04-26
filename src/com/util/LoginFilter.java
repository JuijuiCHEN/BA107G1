package com.util;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import com.mem.model.MemVO;

public class LoginFilter implements Filter {

	private FilterConfig config;

	public void init(FilterConfig config) {
		this.config = config;
	}

	public void destroy() {
		config = null;
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws ServletException, IOException {

		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		// 【取得 session】
		HttpSession session = req.getSession();
		// 【從 session 判斷此user是否登入過】
		MemVO memVO = (MemVO) session.getAttribute("memVO");
		if (memVO == null) {
			System.out.println(req.getRequestURI());
			Boolean loginModal = true;
			
			req.setAttribute("loginModal", loginModal);
			
			String url = "/front_end/index.jsp";
			RequestDispatcher forward = req.getRequestDispatcher(url);
			forward.forward(req, res);
			return;
		} else {
			chain.doFilter(req, res);
//			res.sendRedirect(req.getRequestURI());
		}
	}
}