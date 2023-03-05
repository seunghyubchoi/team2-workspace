package com.kh.manager.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.manager.model.service.ManagerService;
import com.kh.manager.model.vo.Manager;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/login.ma")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		String userId = request.getParameter("managerId");
		String userPwd = request.getParameter("managerPwd");

		Manager loginManager = new ManagerService().loginManager(userId, userPwd);
	
		HttpSession session = request.getSession();
		
		if(loginManager == null) {
			session.setAttribute("alertMsg", "아이디 또는 비밀번호가 틀렸습니다.");
			response.sendRedirect(request.getContextPath() + "/admin.ma");
		} else {
			// 세션 처리 해줘야 함
			session.setAttribute("loginManager", loginManager);
		
			response.sendRedirect(request.getContextPath() + "/noticeList.nt");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
