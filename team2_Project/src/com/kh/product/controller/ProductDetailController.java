package com.kh.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.vo.Member;
import com.kh.myPage.model.vo.Cart;
import com.kh.payment.model.service.PaymentService;
import com.kh.product.model.service.ProductService;
import com.kh.product.model.vo.Option;
import com.kh.product.model.vo.Product;
import com.kh.product.model.vo.ProductImage;
import com.kh.product.model.vo.Review;

/**
 * Servlet implementation class ProductDetailController
 */
@WebServlet("/product.pr")
public class ProductDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 int pNo = Integer.parseInt(request.getParameter("pno"));
		 ArrayList<ProductImage> imgList = new ArrayList();
		 ArrayList<Option> opList = new ArrayList();
		 ArrayList<Review> reviewList = new ArrayList();
		 Product p = new ProductService().productDetail(pNo);
		 
		 int viewUp = new ProductService().productViewUp(pNo);
		 
		 if(viewUp > 0) {
			 imgList = new ProductService().selectProductImage(pNo);
			 opList = new ProductService().selectProductOption(pNo);
			 reviewList = new ProductService().selectProductReview(pNo);
			 double reviewAvg = new ProductService().selectReviewAvg(pNo);
			 request.setAttribute("reviewAvg", reviewAvg);
			 request.setAttribute("product", p);
			 request.setAttribute("imgList", imgList);
			 request.setAttribute("opList", opList);
			 request.setAttribute("reviewList", reviewList);
			 request.getRequestDispatcher("views/product/product.jsp").forward(request, response);
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
