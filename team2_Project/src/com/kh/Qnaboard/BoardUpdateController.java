package com.kh.Qnaboard;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.Qnaboard.model.service.BoardService;
import com.kh.Qnaboard.model.vo.Board;
import com.kh.Qnaboard.model.vo.QAttachment;
import com.kh.common.MyFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;

@WebServlet("/qupdate.bo")
public class BoardUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardUpdateController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 10 * 1024 * 1024; // 10메가바이트
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/board_upfiles/");
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "utf-8", new MyFileRenamePolicy());
			
			
			int boardNo = Integer.parseInt(multiRequest.getParameter("bno"));
			int category = Integer.parseInt(multiRequest.getParameter("qna1"));
			String boardTitle = multiRequest.getParameter("title");
			String boardContent = multiRequest.getParameter("content");
			
			
			
			Board b = new Board();
			b.setQnaNo(boardNo);
			b.setHeaderNo(category);
			b.setQnaTitle(boardTitle);
			b.setQnaContent(boardContent);
			
			QAttachment at = null; 
			
			if(multiRequest.getOriginalFileName("upfile") != null) {
				at = new QAttachment();
				at.setOriginName(multiRequest.getOriginalFileName("upfile"));
				at.setChangeName(multiRequest.getFilesystemName("upfile"));
				at.setFilePath("resources/board_upfiles/");
				
				if(multiRequest.getParameter("originFileNo") != null) {
					at.setFileNo(Integer.parseInt(multiRequest.getParameter("originFileNo")));
				} else {
					at.setRefBno(boardNo);
				}
			}
			
			
			int result = new BoardService().updateBoard(b, at);
			
			if(result > 0) {
				request.getSession().setAttribute("alertMsg", "수정되었습니다.");
				response.sendRedirect(request.getContextPath() + "/qdetail.no?bno=" + boardNo);
			} else {
				request.getSession().setAttribute("errorMsg", "일반게시글 수정 실패!!");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
