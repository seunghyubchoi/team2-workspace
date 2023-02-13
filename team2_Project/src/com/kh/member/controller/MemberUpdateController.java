package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class MemberUpdateController
 */
@WebServlet("/update.me")
public class MemberUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String memId = request.getParameter("memId");
		// String memName = request.getParameter("memName");
		String gender = request.getParameter("gender");
		String birthday = request.getParameter("birthday");
		String phone = request.getParameter("phone");
		
		String email = request.getParameter("email");
		// String location = request.getParameter("location");
		String instaId = request.getParameter("instaId");
		String[] adCheckArr = request.getParameterValues("adCheck");
		
		String adCheck = "";
		if(adCheckArr != null) {
			adCheck = String.join(",", adCheckArr);
		}
		
		Member m = new Member(memId, gender, birthday, phone, email, instaId, adCheck);
		
		Member updateMem = new MemberService().updateMember(m);
		
		if(updateMem == null) { //실패
			// 에러문구 담아서 에러페이지 포워딩
			System.out.println("실패");
			request.setAttribute("alertMsg", "회원정보수정에 실패했습니다.");
			

			
		} else { //성공
			// 성공했다는 alert 띄우고 mypage url 재요청
			System.out.println("성공");
			// session에 담겨있는 loginUser 바꿔치기 작업
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", updateMem);
			session.setAttribute("alertMsg", "성공적으로 회원 정보를 수정했습니다.");

		
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
