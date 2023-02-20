package com.kh.payment.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.payment.model.service.PaymentService;
import com.kh.payment.model.vo.Location;

/**
 * Servlet implementation class UpdateLocaionController
 */
@WebServlet("/update.lo")
public class UpdateLocaionController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateLocaionController() {
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
		int locNo = Integer.parseInt(request.getParameter("locNo"));
		String locAddressName = request.getParameter("locAddressName");
		String locName = request.getParameter("locName");
		String locPhone = request.getParameter("locPhone");
		String locAddress = request.getParameter("locAddress");
		String locAddressDtl = request.getParameter("locAddressDtl");
		String locPostCode = request.getParameter("locPostCode");
		String locYn = request.getParameter("locYn");
		System.out.println(locYn+"!!!!!");
		Location l = new Location(locNo, locAddressName, locName, locPhone, locAddress, locAddressDtl, locPostCode,
				locYn);
		System.out.println(l.toString());
		Location location = new PaymentService().updateLocation(l);
		HttpSession session = request.getSession();
		if (location == null) {
			session.setAttribute("alertMsg", "배송지 정보 수정에 실패했습니다.");
			response.sendRedirect(request.getContextPath() + "/memberInfo.mp");
		} else {
			
			request.setAttribute("location", location);
			session.setAttribute("alertMsg", "성공적으로 배송지 정보를 수정했습니다.");
			response.sendRedirect(request.getContextPath() + "/memberInfo.mp");

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
