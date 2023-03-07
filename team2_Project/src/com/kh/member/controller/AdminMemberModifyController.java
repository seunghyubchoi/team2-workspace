package com.kh.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.service.AdminMemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class AdminMemberModifyController
 */
@WebServlet("/adminModify.me")
public class AdminMemberModifyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminMemberModifyController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int memNo = Integer.parseInt(request.getParameter("memNo"));
		String memId = request.getParameter("memId");
		String gender = request.getParameter("gender");
		String birthday = request.getParameter("birthday");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String instaId = request.getParameter("instaId");
		String[] adCheckArr = request.getParameterValues("adCheck");
		
		String adCheck = "";
		
		if(adCheckArr != null) {
			adCheck = String.join(",", adCheckArr);
		}
		
		Member m = new Member(memId, gender, birthday, phone, email, instaId, adCheck);
		
		int result = new AdminMemberService().updateMember(m);
		
		HttpSession session = request.getSession();
		if(result > 0) {
			session.setAttribute("alertMsg", "회원이 수정 되었습니다.");
			response.sendRedirect(request.getContextPath() + "/detailForm.me?mno=" + memNo);
			
		} else {
			session.setAttribute("alertMsg", "회원 수정에 실패했습니다.");
			response.sendRedirect(request.getContextPath() + "/detailForm.me?mno=" + memNo);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
