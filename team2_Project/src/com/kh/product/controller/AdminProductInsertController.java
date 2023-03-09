package com.kh.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.common.MyFileRenamePolicy;
import com.kh.product.model.service.AdminProductService;
import com.kh.product.model.vo.Attachment;
import com.kh.product.model.vo.Option;
import com.kh.product.model.vo.ProductA;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class AdminProductInsertController
 */
@WebServlet("/insert.pd")
public class AdminProductInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminProductInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 10 * 1024 * 1024;
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/admin/product_upfiles/");
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
						
			ProductA p = new ProductA();
			String allOption = multiRequest.getParameter("allOption");
			String allStock = multiRequest.getParameter("allStock");
			p.setProductName(multiRequest.getParameter("productName"));
			p.setBrandNo(multiRequest.getParameter("brand"));
			p.setCategoryNo(multiRequest.getParameter("category"));
			p.setProductPrice(Integer.parseInt(multiRequest.getParameter("productPrice")));
			p.setProductDiscount(Integer.parseInt(multiRequest.getParameter("productDiscount")));
			p.setProductDesc(multiRequest.getParameter("productDescript"));
			
			ArrayList<Attachment> atList = new ArrayList<Attachment>();
			
			for(int i = 1; i <= 4; i++) {
				String key = "file" + i;
				
				if(multiRequest.getOriginalFileName(key) != null) {
					// 첨부파일 존재할 경우
					// Attachment 객체 생성 + 원본명, 수정명, 폴더경로, 파일레벨 => list에 쌓기
					Attachment at = new Attachment();
					at.setOriginName(multiRequest.getOriginalFileName(key));
					at.setChangeName(multiRequest.getFilesystemName(key));
					at.setFilePath("resources/admin/product_upfiles/");
					if(i == 1) { // 대표이미지일 경우
						at.setFileLevel(1);
					}else { // 상세이미지일 경우
						at.setFileLevel(2);
					}
					
					atList.add(at);
				}
			}
			String options[] = allOption.split(",");
			String stocks[] = allStock.split(",");
			
			ArrayList<Option> opList = new ArrayList<Option>();
			
			for(int i = 0; i < options.length; i ++) {
				opList.add(new Option(options[i], Integer.parseInt(stocks[i])));
			}
			
			int result = new AdminProductService().insertProduct(p, atList, opList);
			
			HttpSession session = request.getSession();
			
			if(result > 0) {
				session.setAttribute("alertMsg", "상품이 추가되었습니다.");
				
			} else {
				session.setAttribute("alertMsg", "상품 추가에 실패했습니다.");
			}
			
			response.sendRedirect(request.getContextPath() + "/productList.ma");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
