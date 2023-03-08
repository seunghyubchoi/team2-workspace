package com.kh.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.product.model.service.AdminProductService;
import com.kh.product.model.vo.Attachment;
import com.kh.product.model.vo.Option;
import com.kh.product.model.vo.Product;
import com.kh.product.model.vo.ProductA;

/**
 * Servlet implementation class ProductListController
 */
@WebServlet("/detailForm.pd")
public class AdminProductDetailFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminProductDetailFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int productNo = Integer.parseInt(request.getParameter("pno"));
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("loginManager") == null) {
			session.setAttribute("alertMsg", "로그인 후 이용가능한 서비스 입니다.");
			request.getRequestDispatcher("views/admin/adminLogin.jsp").forward(request, response);
		} else {
			
			AdminProductService apService = new AdminProductService();
			
			ProductA p = apService.selectProduct(productNo);
			ArrayList<Attachment> atList = apService.selectAttachmentList(productNo);
			ArrayList<Option> opList = apService.selectOptionList(productNo);
			
			request.setAttribute("p", p);
			request.setAttribute("atList", atList);
			request.setAttribute("opList", opList);

			request.getRequestDispatcher("views/admin/adminProductModify.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
