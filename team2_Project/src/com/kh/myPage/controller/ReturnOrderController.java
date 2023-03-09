package com.kh.myPage.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;
import com.kh.myPage.model.service.MyPageService;
import com.kh.myPage.model.vo.Return;

/**
 * Servlet implementation class ReturnOrderController
 */
@WebServlet("/returnOrder.mp")
public class ReturnOrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ReturnOrderController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		int memNo = ((Member) request.getSession().getAttribute("loginUser")).getMemNo();
		int dtlOrderNo = Integer.parseInt(request.getParameter("dtlOrderNo"));
		String returnStatus = request.getParameter("returnStatus");
		String returnReason = request.getParameter("returnReason");

		if (returnStatus.equals("반품")) {
			int result = new MyPageService().returnOrder(dtlOrderNo);
		} else {
			int result = new MyPageService().exchangeOrder(dtlOrderNo);
		}

		int result = new MyPageService().insertReturn(returnStatus, returnReason, memNo, dtlOrderNo);

		HttpSession session = request.getSession();

		session.setAttribute("alertMsg", "신청이 완료됐습니다.");

		response.sendRedirect(request.getContextPath());

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
