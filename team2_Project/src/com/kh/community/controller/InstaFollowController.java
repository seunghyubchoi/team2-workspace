package com.kh.community.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.kh.community.model.vo.Instagram;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class InstaFollowController
 */
@WebServlet("/follow.co")
public class InstaFollowController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InstaFollowController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		String memInstaId = loginUser.getInstaId();
		
		String writerInstaId = (String)request.getAttribute(name)
				
		Instagram insta = new Instagram();
		insta.getInstaId();
		
		System.out.println("팔로팔로" + memInstaId + insta.getInstaId());
		/*
		 * response.setContentType("application/json; charset=utf-8"); new
		 * Gson().toJson(response.getWriter());
		 */
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
