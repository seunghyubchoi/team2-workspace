package com.kh.myPage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.myPage.model.service.MyPageService;
import com.kh.payment.model.vo.OrderDtlA;

/**
 * Servlet implementation class OrderHistoryDetailController
 */
@WebServlet("/orderHistoryDetail.mp")
public class OrderHistoryDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderHistoryDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int memNo = Integer.parseInt(request.getParameter("memNo"));
		int orderNo = Integer.parseInt(request.getParameter("orderNo"));
		ArrayList<OrderDtlA> orderHistoryDetail = new MyPageService().selectOrderHistoryDetail(orderNo);
		
		
		request.setAttribute("memNo", memNo);
		request.setAttribute("orderNo", orderNo);
		request.setAttribute("orderHistoryDetail", orderHistoryDetail);
		RequestDispatcher view = request.getRequestDispatcher("views/myPage/orderHistoryDetail.jsp");
		view.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
