package com.kh.payment.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.vo.Member;
import com.kh.myPage.model.vo.Cart;
import com.kh.payment.model.service.PaymentService;
import com.kh.product.model.service.ProductService;

/**
 * Servlet implementation class InsertCartController
 */
@WebServlet("/insert.ca")
public class InsertCartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertCartController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int mNo = ((Member)(request.getSession().getAttribute("loginUser"))).getMemNo(); 
		int pno = Integer.parseInt(request.getParameter("pno"));
		int amount = Integer.parseInt(request.getParameter("amount"));
		String size = request.getParameter("size");
		int result1 = 0;
		result1 = new PaymentService().checkCart(mNo,pno,size);
		System.out.println(result1);
		if(result1 == 0) {
			int result2 = new PaymentService().insertCart(mNo,pno,amount,size);
			
			if(result2>0) {
				HttpSession session = request.getSession(); 
				session.setAttribute("alertMsg", "장바구니에 추가되었습니다!");
				response.sendRedirect(request.getContextPath()+ "/product.pr?pno=" + pno);
			}else {
				
			}
		}else {
			HttpSession session = request.getSession(); 
			session.setAttribute("alertMsg", "이미 중복된 상품이 존재합니다.");
			response.sendRedirect(request.getContextPath()+ "/product.pr?pno=" + pno);
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
