package com.kh.Qnaboard;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.Qnaboard.model.service.BoardService;
import com.kh.product.model.vo.Category;



@WebServlet("/qenrollForm.bo")
public class BoardEnrollFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardEnrollFormController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Category> list = new BoardService().selectCategoryList();
		
		request.setAttribute("list", list);
		request.getRequestDispatcher("views/board/boardEnrollForm.jsp").forward(request, response);
	
	
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
