package com.kh.payment.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.payment.model.service.PaymentService;
import com.kh.payment.model.vo.Location;

/**
 * Servlet implementation class DeleteLocationController
 */
@WebServlet("/delete.lo")
public class DeleteLocationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteLocationController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int memNo = Integer.parseInt(request.getParameter("memNo")); 

		int locNo = Integer.parseInt(request.getParameter("locNo"));
		int result = new PaymentService().deleteLocation(locNo);
		HttpSession session = request.getSession();
		if(result > 0) {
			ArrayList<Location> list = new PaymentService().selectLocationList(locNo);
			session.setAttribute("list", list);
			session.setAttribute("alertMsg", "성공적으로 배송지가 삭제 되었습니다.");
			response.sendRedirect(request.getContextPath() + "/memberInfo.mp");
		} else {
			session.setAttribute("alertMsg", "배송지 삭제에 실패했습니다.");
			response.sendRedirect(request.getContextPath() + "/memberInfo.mp");
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
