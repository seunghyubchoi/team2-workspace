package com.kh.Qnaboard;

import java.io.IOException;
import java.util.ArrayList;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.Qnaboard.model.service.BoardService;
import com.kh.Qnaboard.model.vo.Board;
import com.kh.Qnaboard.model.vo.QAttachment;
import com.kh.product.model.vo.Category;


@WebServlet("/updateForm.bo")
public class BoardUpdateFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardUpdateFormController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int boardNo = Integer.parseInt(request.getParameter("bno"));
		System.out.println(boardNo+"test!!!!");
		
		// 카테고리, 게시글, 첨부파일
		BoardService bserService = new BoardService();
		ArrayList<Category> list = bserService.selectCategoryList();
		Board b = bserService.selectBoard(boardNo);
		QAttachment at = bserService.selectAttachment(boardNo);
		
		request.setAttribute("list", list);
		request.setAttribute("b", b);
		request.setAttribute("at", at);
		
		request.getRequestDispatcher("views/board/boardUpdateForm.jsp").forward(request, response);
		
	
	
	
	
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
