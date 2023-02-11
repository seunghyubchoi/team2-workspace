package com.kh.myPage.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class PasswordCheckController
 */
@WebServlet("/pwdCheck.me")
public class PasswordCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PasswordCheckController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String memId = request.getParameter("memId");
		String pwdCheck = request.getParameter("pwdCheck");
		HttpSession session = request.getSession();

		Member loginUser = new MemberService().passwordCheck(memId, pwdCheck);

		if (loginUser == null) {
			session.setAttribute("alertMsg", "비밀번호가 틀립니다.");
			response.sendRedirect(request.getContextPath() + "/myPage.me");
		} else {
			session.setAttribute("loginUser", loginUser);

			RequestDispatcher view = request.getRequestDispatcher("views/myPage/memberInfo.jsp");
			view.forward(request, response);
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
