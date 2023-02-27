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
import com.kh.notice.model.service.ManageNoticeService;
import com.kh.notice.model.vo.Attachment;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class AdminNoticeImgController
 */
@WebServlet("/addImg.nt")
public class AdminNoticeImgController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminNoticeImgController() {
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
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/admin/notice_upfiles/");
			
			MultipartRequest multipartRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			Attachment at = null; // 처음에는 null로 초기화, 넘어온 첨부파일이 있다면 생성
			// multipartRequest.getOriginalFileName("키"); : 넘어온 첨부파일 있었을 경우 "원본명" | 없었을경우 null
			if(multipartRequest.getOriginalFileName("upload") != null) {
				at = new Attachment();
				at.setOriginName(multipartRequest.getOriginalFileName("upload"));
				at.setChangeName(multipartRequest.getFilesystemName("upload"));
				at.setFilePath("resources/admin/notice_upfiles/");
			}
			
			// 4. 서비스 요청 (요청처리)
			int result = new ManageNoticeService().insertImg(at);
			
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
