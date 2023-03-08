package com.kh.payment.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.payment.model.service.AdminPaymentService;
import com.kh.payment.model.service.PaymentService;
import com.kh.payment.model.vo.Location;

/**
 * Servlet implementation class AdminDeleteLocationController
 */
@WebServlet("/adminDelete.lo")
public class AdminDeleteLocationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminDeleteLocationController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int memNo = Integer.parseInt(request.getParameter("memNo")); 

		int locNo = Integer.parseInt(request.getParameter("deleteNo"));
		int result = new AdminPaymentService().deleteLocation(locNo);
		
		HttpSession session = request.getSession();
		
		if(result > 0) {
			session.setAttribute("alertMsg", "배송지가 삭제 되었습니다.");
			response.sendRedirect(request.getContextPath() + "/detailForm.me?mno=" + memNo);
			
		} else {
			session.setAttribute("alertMsg", "배송지 삭제에 실패했습니다.");
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
