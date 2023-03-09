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
 * Servlet implementation class CategorySearchController
 */
@WebServlet("/category.pr")
public class CategorySearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CategorySearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String categoryName = request.getParameter("cname");
		ArrayList<Product> list = new ArrayList();
		int page = 1;
		if(request.getParameter("val") != null) {
			int value = Integer.parseInt(request.getParameter("val"));
			
			list = new ProductService().categorySort(categoryName,value,page);
			request.setAttribute("value", value);
		}else {
			
			list = new ProductService().categorySearch(categoryName,page);
		}
		request.setAttribute("cname", categoryName);
		request.setAttribute("list", list);
		request.getRequestDispatcher("views/product/category.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
