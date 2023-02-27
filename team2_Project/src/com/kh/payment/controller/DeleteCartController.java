package com.kh.payment.controller;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.payment.model.service.PaymentService;

/**
 * Servlet implementation class DeleteCartController
 */
@WebServlet("/delete.ca")
public class DeleteCartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteCartController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] carts = request.getParameterValues("chk"); 
		int memNo = Integer.parseInt(request.getParameter("mno"));
		
		System.out.println(Arrays.toString(carts));
		int result = 0;
		int count = 1;
		for(String s : carts) {
			result = new PaymentService().deleteCart(Integer.parseInt(s));
			count = count * result;
		}
		if(count > 0 ) {
			HttpSession session = request.getSession(); 
			session.setAttribute("alertMsg", "성공적으로 삭제되었습니다!");
			response.sendRedirect(request.getContextPath()+ "/list.ca?mno="+memNo);
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
