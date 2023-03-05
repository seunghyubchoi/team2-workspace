package com.kh.myPage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

		
		ArrayList<Instagram> LikeList = new MyPageService().selectLikeList(memNo);

		request.setAttribute("memNo", memNo);
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
