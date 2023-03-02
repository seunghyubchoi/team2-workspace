package com.kh.inquire.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.inquire.model.service.AdminInquireService;
import com.kh.inquire.model.vo.Inquire;

/**
 * Servlet implementation class AdminQnAnswerController
 */
@WebServlet("/answer.qa")
public class AdminQnAnswerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminQnAnswerController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));
		String managerNo = request.getParameter("managerNo");
		String ansYn = request.getParameter("ansYn");
		String ansContent = request.getParameter("ansContent");
		
		Inquire i = new Inquire();
		i.setQnaNo(qnaNo);
		i.setManagerNo(managerNo);
		i.setAnsYn(ansYn);
		i.setAnsContent(ansContent);
		
		int result = new AdminInquireService().updateInquire(i);

		HttpSession session = request.getSession();
		
		if(result > 0) {
			session.setAttribute("alertMsg", "답변을 등록하였습니다.");
		}else {
			session.setAttribute("alertMsg", "답변 등록에 실패했습니다.");
		}
		response.sendRedirect(request.getContextPath() + "/qnaList.qa");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
