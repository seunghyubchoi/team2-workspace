package com.kh.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.product.model.service.ProductService;
import com.kh.product.model.vo.Product;

/**
 * Servlet implementation class AjaxProductSearchController
 */
@WebServlet("/ajaxProduct.pr")
public class AjaxProductSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxProductSearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String product = request.getParameter("product").toUpperCase(); // 입력받은 값 모두 대문자로 변환 
		ArrayList<Product> list = new ArrayList();
		int page = Integer.parseInt(request.getParameter("page"));
		int listCount = new ProductService().listCount2(product);
		int pageLimit = 8;
		System.out.println(page);
		System.out.println(listCount);
		System.out.println(product);
		if(page*pageLimit-listCount<pageLimit) {
		if(request.getParameter("val") != null && !(request.getParameter("val").equals("상품 정렬"))) {
			int value = Integer.parseInt(request.getParameter("val"));
			list = new ProductService().productSort(product, value,page);
		}else {
			
		list = new ProductService().productSearch(product,page);
		}
		System.out.println(list);
		
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(list,response.getWriter());
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
