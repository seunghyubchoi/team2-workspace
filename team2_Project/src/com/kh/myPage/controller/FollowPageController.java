package com.kh.myPage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.common.PageInfo;
import com.kh.myPage.model.service.MyPageService;
import com.kh.myPage.model.vo.Follow;

/**
 * Servlet implementation class FollowPageController
 */
@WebServlet("/follow.mp")
public class FollowPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FollowPageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int memNo = Integer.parseInt(request.getParameter("memNo"));
		
		int listCount;			
		int currentPage;		
		int pageLimit;			
		int boardLimit;			
		
		int maxPage;			
		int startPage;			
		int endPage;			
		
		
		listCount = new MyPageService().selectFollowerCount(memNo);
		
		currentPage = Integer.parseInt(request.getParameter("cpage"));
		pageLimit = 10;
		boardLimit = 10;
		
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		endPage = startPage + pageLimit - 1;
		if (endPage > maxPage) {
			endPage = maxPage;
		}
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		ArrayList<Follow> followList = new MyPageService().selectFollowerList(pi, memNo);

		request.setAttribute("memNo", memNo);
		request.setAttribute("pi", pi);
		request.setAttribute("followList", followList);
		
		RequestDispatcher view = request.getRequestDispatcher("views/myPage/follow.jsp");
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
