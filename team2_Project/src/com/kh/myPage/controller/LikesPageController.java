package com.kh.myPage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.PageInfo;
import com.kh.community.model.vo.Instagram;
import com.kh.community.model.vo.Like;
import com.kh.myPage.model.service.MyPageService;
import com.kh.myPage.model.vo.Follow;

/**
 * Servlet implementation class LikesPageController
 */
@WebServlet("/likes.mp")
public class LikesPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LikesPageController() {
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
		
		
		listCount = new MyPageService().selectLikeCount(memNo);
		
		currentPage = Integer.parseInt(request.getParameter("cpage"));
		pageLimit = 10;
		boardLimit = 9;
		
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		endPage = startPage + pageLimit - 1;
		if (endPage > maxPage) {
			endPage = maxPage;
		}
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		
		
		
		ArrayList<Instagram> LikeList = new MyPageService().selectLikeList(pi, memNo);

		request.setAttribute("memNo", memNo);
		request.setAttribute("pi", pi);
		request.setAttribute("LikeList", LikeList);
		
		
		RequestDispatcher view = request.getRequestDispatcher("views/myPage/likes.jsp");
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
