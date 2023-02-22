package com.kh.payment.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		int mno = Integer.parseInt(request.getParameter("mno"));
		int pno = Integer.parseInt(request.getParameter("pno"));
		int amount = Integer.parseInt(request.getParameter("amount"));
		
		HttpSession session = request.getSession();
		
		int result = new PaymentService().insertCart(mno,pno,amount);
		
		if(result>0) {
			session.setAttribute("alertMsg", "장바구니에 추가되었습니다!");
			response.sendRedirect(request.getContextPath()+ "/product.pr");
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
