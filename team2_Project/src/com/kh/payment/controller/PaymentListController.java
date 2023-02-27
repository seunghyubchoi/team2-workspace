package com.kh.payment.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;

import com.kh.member.model.vo.Member;
import com.kh.payment.model.service.PaymentService;
import com.kh.product.model.vo.Product;

/**
 * Servlet implementation class PaymentListController
 */
@WebServlet("/list.pa")
public class PaymentListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cno =  request.getParameter("cno");
		int mno = ((Member)(request.getSession().getAttribute("loginUser"))).getMemNo();
		String[] carts = cno.split(",");
		 System.out.println(Arrays.toString(carts));
		 ArrayList<Product> pList = new ArrayList();
		 for(String c : carts) {
		 Product p = new PaymentService().selectPayment(Integer.parseInt(c));
		 pList.add(p);
		 }
		 ArrayList<Location> lList = new PaymentService().selectLocation(mno);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
