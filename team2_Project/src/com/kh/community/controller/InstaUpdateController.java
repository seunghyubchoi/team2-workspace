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
 * Servlet implementation class InstaUpdateController
 */
@WebServlet("/update.co")
public class InstaUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InstaUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		if (ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 10 * 1024 * 1024;
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/img/insta/");

			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			Instagram insta = new Instagram();
	        insta.setComNo(Integer.parseInt(multiRequest.getParameter("cno")));
	        insta.setMemNo(multiRequest.getParameter("memNo"));
	        insta.setComContent(multiRequest.getParameter("content"));
	        insta.setInstaId(multiRequest.getParameter("instaId"));
	        insta.setComTag(multiRequest.getParameter("tags"));
			
			System.out.println("UUUU" + insta);
			
			InstaImage img = new InstaImage();
			
	        if (multiRequest.getOriginalFileName("upfile") != null) {
	            img.setInstaImgOrigin(multiRequest.getOriginalFileName("upfile"));
	            img.setinstaImgChange(multiRequest.getFilesystemName("upfile"));
	            img.setInstaImgSrc("resources/img/insta/");
	        } else {
	            img.setInstaImgOrigin(multiRequest.getParameter("upfile"));
	            img.setinstaImgChange(multiRequest.getParameter("upfile"));
	            img.setInstaImgSrc(multiRequest.getParameter("upfile"));
	        }
			
			int result = new CommunityService().updateInsta(insta, img);
			
			if (result > 0) {
				request.getSession().setAttribute("alertMsg", "성공적으로 수정되었습니다!");
				response.sendRedirect(request.getContextPath() + "/feed.co?cno=" + insta.getComNo());
			} else {
				request.getSession().setAttribute("alertMsg", "게시글 수정 실패.");
				response.sendRedirect(request.getContextPath() + "/list.co");
			}
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
