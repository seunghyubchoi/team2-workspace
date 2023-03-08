package com.kh.Qnaboard;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.Qnaboard.model.service.BoardService;
import com.kh.Qnaboard.model.vo.Board;
import com.kh.Qnaboard.model.vo.QAttachment;
import com.kh.common.MyFileRenamePolicy;
import com.kh.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class BoardInsertController
 */
@WebServlet("/qinsert.bo")
public class BoardInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardInsertController() {
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
	
	String savePath = request.getSession().getServletContext().getRealPath("/resources/board_upfiles/");
	
	MultipartRequest multipartRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
	
	String category = multipartRequest.getParameter("qna1");
	String boardTitle = multipartRequest.getParameter("title");
	String boardContent = multipartRequest.getParameter("content");
	String boardWriter = multipartRequest.getParameter("userNo");
	
	Board b = new Board();
	b.setQcategory(category);
	b.setQnaTitle(boardTitle);
	b.setQnaContent(boardContent);
	b.setMemNo(boardWriter);
	
	QAttachment at = null; 
	
	if(multipartRequest.getOriginalFileName("upfile") != null) {
		at = new QAttachment();
		at.setOriginName(multipartRequest.getOriginalFileName("upfile"));
		at.setChangeName(multipartRequest.getFilesystemName("upfile"));
		at.setFilePath("resources/board_upfiles/");
	}
	int result = new BoardService().insertBoard(b, at);
	
	if(result > 0) {
		response.sendRedirect(request.getContextPath() + "/qlist.no?cpage=1");
	} else {
		// errorMsg
		request.setAttribute("errorMsg", "문의 등록 실패!");
		request.getRequestDispatcher("/views/common/errorPage.jsp");
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
