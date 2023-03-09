package com.kh.payment.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.vo.MileageHistory;
import com.kh.payment.model.service.AdminPaymentService;
import com.kh.payment.model.vo.OrderA;

/**
 * Servlet implementation class AdminOrderUpdateController
 */
@WebServlet("/update.od")
public class AdminOrderUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminOrderUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int orderNo = Integer.parseInt(request.getParameter("orderNo"));
		int memNo = Integer.parseInt(request.getParameter("memNo"));
		String orderStatus = request.getParameter("orderStatus");
		String rcpAddressName = request.getParameter("locationAddressName");
		String rcpName = request.getParameter("locationName");
		String rcpPhone = request.getParameter("locationPhone");
		String rcpAddress = request.getParameter("rcpAddress");
		String rcpAddressDtl = request.getParameter("rcpAddressDtl");
		String rcpPostCode = request.getParameter("rcpPostCode");
		String rcpMsg = request.getParameter("locationMsg");
		int orderQnt = Integer.parseInt(request.getParameter("orderQnt"));
		int saveMileage = Integer.parseInt(request.getParameter("saveMileage"));
		
		OrderA o = new OrderA(orderNo, orderQnt, orderStatus, rcpAddressName, rcpName, rcpPhone, rcpAddress, rcpAddressDtl, rcpPostCode, rcpMsg, saveMileage);
		MileageHistory mh = new MileageHistory(saveMileage, orderNo + "", memNo);
		
		int result = new AdminPaymentService().updateOrder(o, mh);
		
		HttpSession session = request.getSession();
		if(result > 0) {
			session.setAttribute("alertMsg", "주문이 수정 되었습니다.");
			response.sendRedirect(request.getContextPath() + "/modifyForm.od?ono=" + orderNo);
			
		} else {
			session.setAttribute("alertMsg", "주문 수정에 실패했습니다.");
			response.sendRedirect(request.getContextPath() + "/modifyForm.od?ono=" + orderNo);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
