package com.kh.product.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.common.MyFileRenamePolicy;
import com.kh.notice.model.service.AdminNoticeService;
import com.kh.product.model.service.AdminProductService;
import com.kh.product.model.vo.Attachment;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class AdminProductImgController
 */
@WebServlet("/addImg.pd")
public class AdminProductImgController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminProductImgController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			String returnValue = "";
			
			int maxSize = 10 * 1024 * 1024;
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/admin/product_upfiles/");
			
			MultipartRequest multipartRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			Attachment at = null;
			
			if(multipartRequest.getOriginalFileName("upload") != null) {
				at = new Attachment();
				at.setOriginName(multipartRequest.getOriginalFileName("upload"));
				at.setChangeName(multipartRequest.getFilesystemName("upload"));
				at.setFilePath("resources/admin/product_upfiles/");
			}
			
			// 4. 서비스 요청 (요청처리)
			int result = new AdminProductService().insertImg(at);
			
			// 5. 응답뷰 지정
			returnValue = at.getFilePath() + at.getChangeName();
			
			returnValue = "{" + "\"uploaded\": 1," + "\"fileName\": \""+at.getChangeName()+"\"," + "\"url\":\""+returnValue+"\"" + "}";
			
			HttpSession session = request.getSession();
			
			if(result > 0) { 
				response.setContentType("application/json; charset=utf-8");
				response.getWriter().write(returnValue);
			}else {
				session.setAttribute("alertMsg", "이미지 등록 실패");
				
			}
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
