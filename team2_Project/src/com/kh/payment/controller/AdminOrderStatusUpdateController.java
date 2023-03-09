package com.kh.payment.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.payment.model.service.AdminPaymentService;

/**
 * Servlet implementation class AdminOrderDeleteController
 */
@WebServlet("/updateStatus.od")
public class AdminOrderStatusUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminOrderStatusUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String deleteList = request.getParameter("deleteList");
		String orderStatus = request.getParameter("orderStatus");
		
		int result = new AdminPaymentService().updateStatus(deleteList, orderStatus);
		
		HttpSession session = request.getSession();
		
		if(result > 0) {
			session.setAttribute("alertMsg", "주문상태를 변경하였습니다.");
		}else {
			session.setAttribute("alertMsg", "주문상태 변경에 실패했습니다.");
		}
		response.sendRedirect(request.getContextPath() + "/orderList.ma");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
