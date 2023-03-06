package com.kh.myPage.controller;

import java.io.IOException;
import java.util.ArrayList;

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
 * Servlet implementation class AjaxFollowingListController
 */
@WebServlet("/followingList.mp")
public class AjaxFollowingListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxFollowingListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int memNo = Integer.parseInt(request.getParameter("memNo"));
		System.out.println("AjaxFollowingListController 컨트롤러 탐");
		
		int listCount;			
		int currentPage;		
		int pageLimit;			
		int boardLimit;			
		
		int maxPage;			
		int startPage;			
		int endPage;		
		
		listCount = new MyPageService().selectFollowingCount(memNo);
		
		currentPage = Integer.parseInt(request.getParameter("cpage"));
		System.out.println(memNo+"cpage");
		pageLimit = 10;
		boardLimit = 10;
		
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		endPage = startPage + pageLimit - 1;
		if (endPage > maxPage) {
			endPage = maxPage;
		}
		PageInfo pi2 = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		System.out.println("listCount" + listCount);
		System.out.println("currentPage" + currentPage);
		System.out.println("pageLimit" + pageLimit);
		System.out.println("boardLimit" + boardLimit);
		System.out.println("maxPage" + maxPage);
		System.out.println("startPage" + startPage);
		System.out.println("endPage" + endPage);
		

		ArrayList<Follow> follwingList = new MyPageService().selectFollowingList(pi2, memNo);
		
		
		Gson gson = new Gson();
		response.setContentType("application/json; charset=utf-8");
		//response.getWriter().write(gson.toJson(pi2));
		gson.toJson(follwingList,response.getWriter());
		gson.toJson(follwingList,response.getWriter());
		//new Gson().toJson(pi2, response.getWriter());
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
