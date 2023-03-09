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
 * Servlet implementation class AdminProductUpdateController
 */
@WebServlet("/update.pd")
public class AdminProductUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminProductUpdateController() {
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
			String allNo = multiRequest.getParameter("allNo");
			p.setProductNo(Integer.parseInt(multiRequest.getParameter("productNo")));
			p.setProductName(multiRequest.getParameter("productName"));
			p.setBrandNo(multiRequest.getParameter("brand"));
			p.setCategoryNo(multiRequest.getParameter("category"));
			p.setProductPrice(Integer.parseInt(multiRequest.getParameter("productPrice")));
			p.setProductDiscount(Integer.parseInt(multiRequest.getParameter("productDiscount")));
			p.setProductDesc(multiRequest.getParameter("productDescript"));
			
			ArrayList<Attachment> newAtList = new ArrayList<Attachment>();
			ArrayList<Attachment> updateAtList = new ArrayList<Attachment>();
			
			for(int i = 1; i <= 4; i++) {
				String key = "file" + i;
				
				if(multiRequest.getOriginalFileName(key) != null) {
					Attachment at = new Attachment();
					at.setOriginName(multiRequest.getOriginalFileName(key));
					at.setChangeName(multiRequest.getFilesystemName(key));
					at.setFilePath("resources/admin/product_upfiles/");
					if(i == 1) { // 대표이미지일 경우
						at.setFileLevel(1);
					}else { // 상세이미지일 경우
						at.setFileLevel(2);
					}
					
					if(multiRequest.getParameter("originFileNo" + i) != null) {
						at.setFileNo(Integer.parseInt(multiRequest.getParameter("originFileNo" + i)));
						updateAtList.add(at);
					}else {
						at.setRefBno(p.getProductNo());
						newAtList.add(at);
					}
				}
			}
			
			String options[] = allOption.split(",");
			String stocks[] = allStock.split(",");
			String nos[] = null;
			if(!allNo.equals("")) {
				nos = allNo.split(",");
			}
			
			ArrayList<Option> newOpList = new ArrayList<Option>();
			ArrayList<Option> updateOpList = new ArrayList<Option>();
			
			
			for(int i = 0; i < options.length; i ++) {
				if(!(nos == null) && i < nos.length) {
						updateOpList.add(new Option(Integer.parseInt(nos[i]), options[i], Integer.parseInt(stocks[i]), p.getProductNo()));
				}else {
					newOpList.add(new Option(options[i], Integer.parseInt(stocks[i]), p.getProductNo()));
				}
				
			}
			
			//int result = new AdminProductService().insertProduct(p, atList, opList);
			int result = new AdminProductService().updateProduct(p, updateAtList, newAtList, newOpList, updateOpList);
			
			
			HttpSession session = request.getSession();
			
			if(result > 0) {
				session.setAttribute("alertMsg", "상품이 수정되었습니다.");
				
			} else {
				session.setAttribute("alertMsg", "상품 수정에 실패했습니다.");
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
