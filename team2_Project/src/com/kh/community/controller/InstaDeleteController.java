package com.kh.community.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.common.MyFileRenamePolicy;
import com.kh.community.model.service.CommunityService;
import com.kh.community.model.vo.InstaImage;
import com.kh.community.model.vo.Instagram;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class InstaDeleteController
 */
@WebServlet("/delete.co")
public class InstaDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InstaDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/* request.setCharacterEncoding("UTF-8"); */
		
		int comNo = Integer.parseInt(request.getParameter("cno"));	        
			
		int result = new CommunityService().deleteInsta(comNo);
		System.out.println("컨트롤러 " + comNo);
		
		if (result > 0) {
			request.getSession().setAttribute("alertMsg", "게시글이 삭제되었습니다!");
			response.sendRedirect(request.getContextPath() + "/list.co");
		} else {
			request.getSession().setAttribute("alertMsg", "게시글 삭제에 실패했습니다.");
			response.sendRedirect(request.getContextPath() + "/list.co");
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
