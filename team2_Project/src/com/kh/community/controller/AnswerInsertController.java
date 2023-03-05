package com.kh.community.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.community.model.service.CommunityService;
import com.kh.community.model.vo.AnswerInstagram;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class AnswerInsertController
 */
@WebServlet("/answerInsert.co")
public class AnswerInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AnswerInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String answerContent = request.getParameter("content");
		int ComNo = Integer.parseInt(request.getParameter("cno"));
		
		int memNo = ((Member)request.getSession().getAttribute("loginUser")).getMemNo();
		
		AnswerInstagram answer = new AnswerInstagram();
		answer.setAnsContent(answerContent);
		answer.setComNo(ComNo);
		answer.setMemNo(String.valueOf(memNo));
		
		int result = new CommunityService().insertAnswer(answer);
		
		response.getWriter().print(result);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
