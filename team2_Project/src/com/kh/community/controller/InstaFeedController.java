package com.kh.community.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.community.model.service.CommunityService;
import com.kh.community.model.vo.InstaImage;
import com.kh.community.model.vo.Instagram;

/**
 * Servlet implementation class InstaFeedController
 */
@WebServlet("/feed.co")
public class InstaFeedController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InstaFeedController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int comNo = Integer.parseInt(request.getParameter("cno"));
		
		Instagram insta = new CommunityService().selectInsta(comNo);
		InstaImage img = new CommunityService().selectInstaImg(comNo);
		
		request.setAttribute("insta", insta);
		request.setAttribute("img", img);
		
		String[] arrTag = insta.getComTag().split(",");
		
		request.setAttribute("arrTag", arrTag);
		System.out.println(arrTag + "태그태그");
		
		request.getRequestDispatcher("views/community/instaFeed.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
