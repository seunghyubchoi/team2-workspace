package com.kh.notice.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.manager.model.service.ManagerService;
import com.kh.notice.model.service.AdminNoticeService;

/**
 * Servlet implementation class AdminNoticeDeleteController
 */
@WebServlet("/delete.nt")
public class AdminNoticeDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminNoticeDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String deleteList = request.getParameter("deleteList");
		
		int result = new AdminNoticeService().deleteNotice(deleteList);
		
		HttpSession session = request.getSession();
		
		if(result > 0) {
			session.setAttribute("alertMsg", "공지사항을 삭제하였습니다.");
		}else {
			session.setAttribute("alertMsg", "공지사항 삭제에 실패했습니다.");
		}
		response.sendRedirect(request.getContextPath() + "/noticeList.nt");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
