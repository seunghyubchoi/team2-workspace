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
 * Servlet implementation class AdminQnADetailViewController
 */
@WebServlet("/detailForm.qa")
public class AdminQnADetailFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminQnADetailFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int inquireNo = Integer.parseInt(request.getParameter("ino"));
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("loginManager") == null) {
			session.setAttribute("alertMsg", "로그인 후 이용가능한 서비스 입니다.");
			request.getRequestDispatcher("views/admin/adminLogin.jsp").forward(request, response);
		} else {
			Inquire i = new AdminInquireService().selectInquire(inquireNo);
			
			request.setAttribute("i", i);
			request.getRequestDispatcher("views/admin/adminQnAnswer.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
