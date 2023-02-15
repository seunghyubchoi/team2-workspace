package com.kh.myPage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;
import com.kh.payment.model.service.PaymentService;
import com.kh.payment.model.vo.Location;

/**
 * Servlet implementation class PasswordCheckController
 */
@WebServlet("/pwdCheck.mp")
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

		Member m = new MemberService().passwordCheck(memId, pwdCheck);

		if (m == null) {
			session.setAttribute("alertMsg", "비밀번호가 틀립니다.");
			response.sendRedirect(request.getContextPath() + "/myPage.mp");
		} else {
			session.setAttribute("loginUser", m);
			int memNo = m.getMemNo();
			Location defaultLocation =  new PaymentService().selectLocation(memNo);
			System.out.println(defaultLocation.getLocName());
			session.setAttribute("defaultLocation", defaultLocation); 
			
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
