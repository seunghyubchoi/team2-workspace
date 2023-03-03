package com.kh.community.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.common.MyFileRenamePolicy;
import com.kh.community.model.service.CommunityService;
import com.kh.community.model.vo.InstaImage;
import com.kh.community.model.vo.Instagram;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class InstaInsertController
 */
@WebServlet("/insert.co")
public class InstaInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InstaInsertController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");

		if (ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 10 * 1024 * 1024;

			String savePath = request.getSession().getServletContext().getRealPath("/resources/img/insta/");

			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			/*
			 * String content = multiRequest.getParameter("content"); String instaId =
			 * multiRequest.getParameter("instaId"); String tags =
			 * multiRequest.getParameter("tags"); String memNo =
			 * multiRequest.getParameter("memNo");
			 * 
			 * Instagram insta = new Instagram(); insta.setComContent(content);
			 * insta.setInstaId(instaId); insta.setComTag(tags); insta.setMemNo(memNo);
			 * 
			 * InstaImage img = null;
			 */
			
			Instagram insta = new Instagram();
			insta.setMemNo(multiRequest.getParameter("memNo"));
			insta.setInstaId(multiRequest.getParameter("instaId"));
			insta.setComTag(multiRequest.getParameter("tags"));
			
			InstaImage img = new InstaImage();
			if (multiRequest.getOriginalFileName("upfile") != null) {
				img = new InstaImage();
				img.setInstaImgOrigin(multiRequest.getOriginalFileName("upfile"));
				img.setinstaImgChange(multiRequest.getFilesystemName("upfile"));
				img.setInstaImgSrc("resources/img/insta/");
			}
			
			int result = new CommunityService().insertInsta(insta, img);
			
			if (result > 0) {
				request.getSession().setAttribute("alertMsg", "게시글이 등록되었습니다.");
				response.sendRedirect(request.getContextPath() + "/list.co");
			} else {
				request.getSession().setAttribute("alertMsg", "게시글 등록 실패.");
				response.sendRedirect(request.getContextPath() + "/list.co");
			}
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
