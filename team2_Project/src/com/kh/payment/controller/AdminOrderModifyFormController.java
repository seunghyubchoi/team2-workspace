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
import com.kh.payment.model.vo.OrderA;
import com.kh.payment.model.vo.OrderDtl;
import com.kh.payment.model.vo.ReturnA;

/**
 * Servlet implementation class AdminOrderModifyFormController
 */
@WebServlet("/modifyForm.od")
public class AdminOrderModifyFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminOrderModifyFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		if(session.getAttribute("loginManager") == null) {
			session.setAttribute("alertMsg", "로그인 후 이용가능한 서비스 입니다.");
			request.getRequestDispatcher("views/admin/adminLogin.jsp").forward(request, response);
		} else {
			int orderNo = Integer.parseInt(request.getParameter("ono"));
			
			OrderA o = new AdminPaymentService().selectOrder(orderNo);
			ArrayList<OrderDtl> odList= new AdminPaymentService().selectOrderDtl(orderNo);
			
			//ReturnA r = new AdminPaymentService().selectReturn();
			
			request.setAttribute("o", o);
			request.setAttribute("odList", odList);
			request.getRequestDispatcher("views/admin/adminOrderModify.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
