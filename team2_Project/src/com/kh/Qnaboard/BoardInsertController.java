package com.kh.Qnaboard;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.Qnaboard.model.service.BoardService;
import com.kh.Qnaboard.model.vo.Board;
import com.kh.member.model.vo.Member;

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
		
		String boardTitle = request.getParameter("title");
		String boardContent = request.getParameter("content");
		String boardcategory = request.getParameter("qna");
		System.out.println(boardContent);
	
		Board b = new Board();
		b.setQnaTitle(boardTitle);
		b.setQnaContent(boardContent);
		b.setQcategory(boardcategory);
		
		
		int result = new BoardService().insertBoard(b);
		
		if(result > 0) { 
			response.sendRedirect(request.getContextPath() + "/qlist.no");
		} else { 
			request.setAttribute("errorMsg", "문의 등록 실패");
			RequestDispatcher view = request.getRequestDispatcher("/views/common/errorPage.jsp");
			view.forward(request, response);
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
