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
 * Servlet implementation class InsertLocationController
 */
@WebServlet("/insert.lo")
public class InsertLocationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertLocationController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int memNo = Integer.parseInt(request.getParameter("memNo"));
		String locAddressName = request.getParameter("locAddressName");
		String locName = request.getParameter("locName");
		String locPhone = request.getParameter("locPhone");
		String locPostCode = request.getParameter("locPostCode");
		String locAddress = request.getParameter("locAddress");
		String locAddressDtl = request.getParameter("locAddressDtl");
		
		Location l = new Location(memNo, locAddressName, locName, locPhone, locAddress, locAddressDtl, locPostCode);
		
				
		int result = new PaymentService().insertLocation(l);
		HttpSession session = request.getSession();
		if(result > 0) {
			ArrayList<Location> list = new PaymentService().selectLocationList(memNo);
			session.setAttribute("list", list);
			session.setAttribute("alertMsg", "성공적으로 배송지가 추가 되었습니다.");
			response.sendRedirect(request.getContextPath() + "/memberInfo.mp");
			
		} else {
			session.setAttribute("alertMsg", "배송지를 추가하지 못 했습니다.");
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
