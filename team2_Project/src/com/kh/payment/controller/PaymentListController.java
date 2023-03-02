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
import com.kh.payment.model.vo.Location;
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
		String pno = request.getParameter("pno");
		 int mno = ((Member)(request.getSession().getAttribute("loginUser"))).getMemNo();
		 ArrayList<Product> pList = new ArrayList();
		 if(pno == null) {
			 String cno =  request.getParameter("cno");
				String[] carts = cno.split(",");
			 for(String c : carts) {
				 Product p = new PaymentService().selectPayment(Integer.parseInt(c));
				 pList.add(p);
				 }
			
		 }else {
			 String size = request.getParameter("size");
			 String qnt = request.getParameter("qnt");
			 Product p = new PaymentService().selectPayment2(Integer.parseInt(pno),size,Integer.parseInt(qnt));
			pList.add(p);
			System.out.println(p);
		 }
		 ArrayList<Location> lList = new PaymentService().selectLocationList(mno);
		 request.setAttribute("pList", pList);
		 request.setAttribute("lList", lList);
		 request.getRequestDispatcher("views/payment/payment.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
