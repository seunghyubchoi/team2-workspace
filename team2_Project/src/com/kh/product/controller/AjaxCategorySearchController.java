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
 * Servlet implementation class AjaxCategorySearchController
 */
@WebServlet("/ajaxCategory.pr")
public class AjaxCategorySearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxCategorySearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Product> list = new ArrayList();
		String categoryName = request.getParameter("cname");
		int page = Integer.parseInt(request.getParameter("page"));
		if(request.getParameter("val") != null) {
			int value = Integer.parseInt(request.getParameter("val"));
			System.out.println(value);
			list = new ProductService().categorySort(categoryName,value,page);
		}else {
			
			list = new ProductService().categorySearch(categoryName,page);
		}
		System.out.println(categoryName);
		System.out.println(list);
		System.out.println(page);
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(list,response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
