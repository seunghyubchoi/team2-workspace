package com.kh.notice.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.PageInfo;
import com.kh.notice.model.service.NoticeService;
import com.kh.notice.model.vo.Notice;

@WebServlet("/nlist.no")
public class NoticeListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public NoticeListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		//페이징처리합니다ㅠㅠ
		int listCount;			// 현재 총 게시글 개수
		int currentPage;		// 현재 페이지(즉, 사용자가 요청한 페이지)
		int pageLimit;			// 페이지 하단에 보여질 페이징바의 페이지 최대개수(몇개 단위씩 배치) 1 2 3 4 ...
		int boardLimit;			// 한 페이지 내에 보여질 게시글 최대 개수(몇개 단위씩)
		
		int maxPage;			// 가장 마지막 페이지(총 페이지 수)
		int startPage;			// 페이징 바의 시작수
		int endPage;			// 페이징 바의 끝수
		
		// * listCount : 총 게시글 개수
				listCount = new NoticeService().selectListCount();
				System.out.println(listCount);
				// * currentPage : 현재페이지(즉, 사용자가 요청한 페이지)
				currentPage = Integer.parseInt(request.getParameter("cpage"));
				// * pageLimit : 페이징바의 페이지 최대개수(단위)
				pageLimit = 10;
				
				// * boardLimit : 게시글 최대 개수(단위)
				boardLimit = 5;
				
				maxPage = (int)Math.ceil((double)listCount / boardLimit);
				
				startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
				endPage = startPage + pageLimit - 1;
				PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
				
				ArrayList<Notice> list = new NoticeService().selectNoticeList(pi);
				request.setAttribute("list", list);
				request.setAttribute("pi", pi);
				request.getRequestDispatcher("views/notice/noticelistView.jsp").forward(request, response);
	
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
