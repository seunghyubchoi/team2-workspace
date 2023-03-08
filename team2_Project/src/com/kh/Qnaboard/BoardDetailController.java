package com.kh.Qnaboard;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.Qnaboard.model.service.BoardService;
import com.kh.Qnaboard.model.vo.Board;


/**
 * Servlet implementation class BoardDetailController
 */
@WebServlet("/qdetail.no")
public class BoardDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardDetailController() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int boardNo= Integer.parseInt(request.getParameter("bno"));
		BoardService bService = new BoardService();
		int result = bService.increaseCount(boardNo);

		if(result>0) { 
			Board b = bService.selectBoard(boardNo);
			request.setAttribute("b", b);
			
			request.getRequestDispatcher("views/board/boardDetailView.jsp").forward(request, response);
		}else {
			request.setAttribute("errorMsg", "게시판 조회 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			
		}
	
	
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
