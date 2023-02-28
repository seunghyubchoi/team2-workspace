package com.kh.notice.controller;

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
import com.kh.notice.model.vo.Attachment;
import com.kh.notice.model.vo.Notice;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class AdminNoticeInsertController
 */
@WebServlet("/add.nt")
public class AdminNoticeInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminNoticeInsertController() {
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
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/admin/notice_upfiles/");
			
			MultipartRequest multipartRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			String noticeTitle = multipartRequest.getParameter("noticeTitle");
			String noticeContent = multipartRequest.getParameter("noticeContent");
			String noticeWriter = multipartRequest.getParameter("managerNo");
			
			Notice n = new Notice();
			n.setNoticeTitle(noticeTitle);
			n.setNoticeContent(noticeContent);
			n.setManagerNo(noticeWriter);
			
			Attachment at= null;
			if(multipartRequest.getOriginalFileName("notice-file") != null) {
				at = new Attachment();
				at.setOriginName(multipartRequest.getOriginalFileName("notice-file"));
				at.setChangeName(multipartRequest.getFilesystemName("notice-file"));
				at.setFilePath("resources/admin/notice_upfiles/");
			}
			
			int result = new AdminNoticeService().insertNotice(n, at);
			
			HttpSession session = request.getSession();
			
			if(result > 0) {
				session.setAttribute("alertMsg", "공지사항을 추가하였습니다.");
			}else {
				session.setAttribute("alertMsg", "공지사항 추가에 실패했습니다.");
			}
			response.sendRedirect(request.getContextPath() + "/noticeList.ma");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
