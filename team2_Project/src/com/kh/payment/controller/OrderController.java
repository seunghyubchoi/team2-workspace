package com.kh.payment.controller;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.vo.Member;
import com.kh.payment.model.service.PaymentService;
import com.kh.payment.model.vo.Order;

/**
 * Servlet implementation class OrderController
 */
@WebServlet("/order.pa")
public class OrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String[] pNo = request.getParameterValues("pno"); // 주문한 상품 번호
		String[] pSize = request.getParameterValues("psize"); // 상품 사이즈
		String[] pQnt = request.getParameterValues("pqnt"); // 상품 수량

		Order o = new Order();
		o.setOrderQnt(Integer.parseInt(request.getParameter("totalqnt")));
		o.setRcpName(request.getParameter("order-name"));
		o.setRcpPhone(request.getParameter("order-phone"));
		o.setRcpAddress(request.getParameter("Laddress"));
		o.setRcpAddressDtl(request.getParameter("Daddress"));
		o.setRcpPostCode(request.getParameter("Lcode"));
		o.setRcpMsg(request.getParameter("rqrmn"));
		o.setMemNo(((Member)(request.getSession().getAttribute("loginUser"))).getMemNo());
		o.setSaveMileage(Integer.parseInt(request.getParameter("saveMileage")));
		o.setUseMileage(Integer.parseInt(request.getParameter("useMileage")));
		int result1 = new PaymentService().insertOrder(o);
		if(result1>0) {
			for(int i =0;i<pNo.length;i++) {
				int result2 = new PaymentService().insertOrderDtl(Integer.parseInt(pNo[i]),pSize[i],Integer.parseInt(pQnt[i]));
				int result3 = new PaymentService().updateOptionQnt(Integer.parseInt(pNo[i]),pSize[i],Integer.parseInt(pQnt[i]));
					if(result3*result3>0) {
						System.out.println("성공!");
					}
				
			}
		}else {
			
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
