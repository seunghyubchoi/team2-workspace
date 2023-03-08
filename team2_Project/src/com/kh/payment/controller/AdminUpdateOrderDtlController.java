package com.kh.payment.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.payment.model.service.AdminPaymentService;
import com.kh.payment.model.vo.OrderDtl;

/**
 * Servlet implementation class AdminUpdateOrderDtlController
 */
@WebServlet("/updateOrderDtl.od")
public class AdminUpdateOrderDtlController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminUpdateOrderDtlController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int dtlQnt = Integer.parseInt(request.getParameter("dtlQnt"));
		String dtlSize = request.getParameter("dtlSize");
		int orderDtlNo = Integer.parseInt(request.getParameter("orderDtlNo"));
		
		OrderDtl od = new OrderDtl(orderDtlNo, dtlSize, dtlQnt);
		
		int result = new AdminPaymentService().updateOrderDtl(od);
		
		response.setContentType("application/json; charset-utf-8");
		new Gson().toJson(result, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
