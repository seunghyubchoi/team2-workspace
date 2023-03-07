package com.kh.payment.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.payment.model.service.AdminPaymentService;
import com.kh.payment.model.vo.Location;

/**
 * Servlet implementation class AdminUpdateLocationController
 */
@WebServlet("/adminUpdate.lo")
public class AdminUpdateLocationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminUpdateLocationController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int memNo = Integer.parseInt(request.getParameter("memNo"));
		int locNo = Integer.parseInt(request.getParameter("locNo"));
		String locAddressName = request.getParameter("locAddressName");
		String locName = request.getParameter("locName");
		String locPhone = request.getParameter("locPhone");
		String locPostCode = request.getParameter("locPostCode");
		String locAddress = request.getParameter("locAddress");
		String locAddressDtl = request.getParameter("locAddressDtl");
		String locYn = request.getParameter("locYn");
		
		int result1 = 1;
		
		if(locYn.equals("Y")) {
			result1 = new AdminPaymentService().updateLocYn(memNo);
		}
		
		Location l = new Location(locNo, locAddressName, locName, locPhone, locAddress, locAddressDtl, locPostCode, locYn);
		
		int result2 = new AdminPaymentService().updateLocation(l);
		
		HttpSession session = request.getSession();
		if(result1 * result2 >0) {
			session.setAttribute("alertMsg", "배송지가 수정 되었습니다.");
			response.sendRedirect(request.getContextPath() + "/detailForm.me?mno=" + memNo);
			
		} else {
			session.setAttribute("alertMsg", "배송지 수정에 실패했습니다.");
			response.sendRedirect(request.getContextPath() + "/detailForm.me?mno=" + memNo);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
