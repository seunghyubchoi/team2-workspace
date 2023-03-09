package com.kh.myPage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.PageInfo;
import com.kh.myPage.model.service.MyPageService;
import com.kh.payment.model.vo.OrderDtlA;

/**
 * Servlet implementation class OrderHistoryCancelPageController
 */
@WebServlet("/orderHistoryCancel.mp")
public class OrderHistoryCancelPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderHistoryCancelPageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int memNo = Integer.parseInt(request.getParameter("memNo"));

		int listCount;
		int currentPage;
		int pageLimit;
		int boardLimit;

		int maxPage;
		int startPage;
		int endPage;

		listCount = new MyPageService().selectOrderHistoryCancelCount(memNo);
		currentPage = Integer.parseInt(request.getParameter("cpage"));
		pageLimit = 10;
		boardLimit = 3;
		
		maxPage = (int) Math.ceil((double) listCount / boardLimit);

		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		endPage = startPage + pageLimit - 1;
		if (endPage > maxPage) {
			endPage = maxPage;
		}
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);

		ArrayList<OrderDtlA> orderHistoryCancelList = new MyPageService().selectOrderHistoryCancelList(pi, memNo);
		System.out.println(orderHistoryCancelList);
		request.setAttribute("orderHistoryCancelList", orderHistoryCancelList);
		request.setAttribute("memNo", memNo);
		request.setAttribute("pi", pi);
		
		
		
		
		RequestDispatcher view = request.getRequestDispatcher("views/myPage/orderHistoryCancel.jsp");
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
