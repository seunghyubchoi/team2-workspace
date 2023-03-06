package com.kh.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.service.AdminMemberService;
import com.kh.member.model.vo.MileageHistory;

/**
 * Servlet implementation class AdminInsertMileageController
 */
@WebServlet("/insert.mi")
public class AdminInsertMileageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminInsertMileageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int memNo = Integer.parseInt(request.getParameter("memNo"));
		int mileage = Integer.parseInt(request.getParameter("mileage"));
		
		MileageHistory mh = new MileageHistory();
		mh.setMemNo(memNo);
		mh.setMileage(mileage);
		
		int result = new AdminMemberService().insertMileage(mh);
		
		HttpSession session = request.getSession();
		if(result > 0) {
			session.setAttribute("alertMsg", "적립금이 적립 되었습니다.");
			response.sendRedirect(request.getContextPath() + "/detailForm.me?mno=" + memNo);
			
		} else {
			session.setAttribute("alertMsg", "적립금 적립에 실패했습니다.");
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
