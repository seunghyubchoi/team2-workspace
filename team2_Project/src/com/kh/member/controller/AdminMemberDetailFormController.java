package com.kh.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.service.AdminMemberService;
import com.kh.member.model.vo.Member;
import com.kh.payment.model.vo.Location;

/**
 * Servlet implementation class AdminMemberDetailFormController
 */
@WebServlet("/detailForm.me")
public class AdminMemberDetailFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminMemberDetailFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int memNo = Integer.parseInt(request.getParameter("mno"));
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("loginManager") == null) {
			session.setAttribute("alertMsg", "로그인 후 이용가능한 서비스 입니다.");
			request.getRequestDispatcher("views/admin/adminLogin.jsp").forward(request, response);
		} else {
			
			AdminMemberService mService = new AdminMemberService();
			Member m = mService.selectMember(memNo);
			ArrayList<Location> lList = mService.selectLocation(memNo);
			
			request.setAttribute("m", m);
			request.setAttribute("lList", lList);
			
			request.getRequestDispatcher("views/admin/adminMemberModify.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
