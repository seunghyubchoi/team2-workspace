<%@page import="com.kh.Qnaboard.model.vo.Board"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.common.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
PageInfo pi =(PageInfo)request.getAttribute("pi");
int currentPage = pi.getCurrentPage();
int startPage = pi.getStartPage();
int endPage = pi.getEndPage();
int maxPage = pi.getMaxPage();
ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

html {
    font-size: 10px;
}

ul, li {
    list-style: none;
}

a {
    text-decoration: none;
    color: inherit;
}

.board_wrap {
    width: 1300px;
    margin: 100px auto;
}

.board_title {
    margin-bottom: 30px;
    color: #5b3c6f;
}

.board_title strong {
    font-size: 4.5rem;
}

.board_title p {
    margin-top: 5px;
    font-size: 1.7rem;
}

.bt_wrap {
    margin-top: 60px;
    text-align: center;
    font-size: 0;
}

.bt_wrap a {
    display: inline-block;
    min-width: 80px;
    margin-left: 10px;
    padding: 10px;
    border: 1px solid #dcc3ea;
    border-radius: 2px;
    font-size: 1.4rem;
}

.bt_wrap a:first-child {
    margin-left: 0;
}

.bt_wrap a.on {
    border-radius: 10px;
  background-color: #e0abe8;
	box-shadow: 0 0 0 1px #eed3f9 inset,
		  0 0 0 3px rgba(206, 121, 223, 0.534) inset,
		  0 8px 0 0 rgba(254, 253, 255, 0.863),
		  0 8px 0 2px rgba(0, 0, 0, 0.151),
		  0 8px 8px 1px rgba(242, 184, 253, 0.5);
}

.bt_wrap a.off {
    border-radius: 10px;
    background-color: #b4a3c8;
	box-shadow: 0 0 0 1px #a69ea9 inset,
		  0 0 0 3px rgba(136, 133, 137, 0.534) inset,
		  0 8px 0 0 rgba(253, 251, 254, 0.863),
		  0 8px 0 2px rgba(0, 0, 0, 0.151),
		  0 8px 8px 1px rgba(92, 89, 93, 0.5);
}

.board_list {
    width: 100%;
    border-top: 3px solid #d5aede;
}

.board_list > div {
    border-bottom: 3px solid #d5aede;
    font-size: 0;
}

.board_list > div.top {
    border-bottom: 3px solid #d5aede;
}

.board_list > div:last-child {
    border-bottom: 3px solid #d5aede;
}

.board_list > div > div {
    display: inline-block;
    padding: 15px 0;
    text-align: center;
    font-size: 1.4rem;
}

.board_list > div.top > div {
    font-weight: 600;
}

.board_list .num {
    width: 10%;
}

.board_list .title {
    width: 60%;
    text-align: left;
}

.board_list .top .title {
    text-align: center;
}

.board_list .writer {
    width: 10%;
}

.board_list .date {
    width: 10%;
}

.board_list .count {
    width: 10%;
}

.board_page {
    margin-top: 30px;
    text-align: center;
    font-size: 0;
}

.board_page a {
    display: inline-block;
    width: 32px;
    height: 32px;
    box-sizing: border-box;
    vertical-align: middle;
    border: 1px solid #ddd;
    border-left: 0;
    line-height: 100%;
}

.board_page a.bt {
    padding-top: 10px;
    font-size: 1.2rem;
    letter-spacing: -1px;
}

.board_page a.num {
    padding-top: 9px;
    font-size: 1.4rem;
}

.board_page a.num.on {
    border-color: #000000;
    background: #000;
    color: #fff;
}

.board_page a:first-child {
    border-left: 1px solid #ddd;
}

.board_view {
    width: 100%;
    border-top: 3px solid #d5aede;
}

.board_view .title {
    padding: 20px 15px;
    border-bottom: 1px dashed #d5aede;
    font-size: 2rem;
}

.board_view .info {
    padding: 15px;
    border-bottom: 3px solid #d5aede;
    font-size: 0;
}

.board_view .info dl {
    position: relative;
    display: inline-block;
    padding: 0 20px;
}

.board_view .info dl:first-child {
    padding-left: 0;
}

.board_view .info dl::before {
    content: "";
    position: absolute;
    top: 1px;
    left: 0;
    display: block;
    width: 1px;
    height: 13px;
    background: #d5aede;
}

.board_view .info dl:first-child::before {
    display: none;
}

.board_view .info dl dt,
.board_view .info dl dd {
    display: inline-block;
    font-size: 1.4rem;
}

.board_view .info dl dd {
    margin-left: 10px;
    color: #480773;
}

.board_view .cont {
    padding: 15px;
    border-bottom: 3px solid #d5aede;
    line-height: 160%;
    font-size: 1.4rem;
}

.board_write {
    border-top: 3px solid #d5aede;
    margin: 100px;
}

.board_write .title,
.board_write .info {
    padding: 15px;
}

.board_write .info {
    border-top: 1px dashed #d5aede;
    border-bottom: 3px solid #d5aede;
    font-size: 0;
}

.board_write .title dl {
    font-size: 0;
}

.board_write .info dl {
    display: inline-block;
    width: 50%;
    vertical-align: middle;
}

.board_write .title dt,
.board_write .title dd,
.board_write .info dt,
.board_write .info dd {
    display: inline-block;
    vertical-align: middle;
    font-size: 1.4rem;
}

.board_write .title dt,
.board_write .info dt {
    width: 100px;
}

.board_write .title dd {
    width: calc(100% - 100px);
}


.board_write .title input[type="text"],
.board_write .info input[type="text"],
.board_write .info input[type="password"] {
    padding: 10px;
    box-sizing: border-box;
}

.board_write .title input[type="text"] {
    width: 80%;
}

.board_write .cont {
    border-bottom: 3px solid #d5aede;
}

.board_write .cont textarea {
    display: block;
    width: 100%;
    height: 300px;
    padding: 15px;
    box-sizing: border-box;
    border: 0;
    resize: vertical;
}
#line1{
	border: #E0BFE6 solid 5px;
	margin-top: 10px;
	margin-bottom: 10px;
	margin-left:20px;
	margin-right:20px;
  }
</style>
</head>
<body>
<%@include file="../common/menubar.jsp"%>
<div id="content">
             <div id="line1"></div>
             <div class="board_wrap" method="post">
                <div class="board_title">
                    <strong>문의하기</strong>
                    <p>상품/주문/환불/교환/기타 문의해주세요.</p>
                </div>
                <div class="board_list_wrap">
                    <div class="board_list">
                        <div class="top">
                            <div class="num">번호</div>
                            <div class="title">문의제목</div>
                            <div class="writer">글쓴이</div>
                            <div class="date">작성일</div>
                            <div class="count">조회</div>
                        </div>
                        <% if(list.isEmpty()){ %>
                        <p>문의내역이 없습니다.</p>
                        <%}else{ %>
                        <%for(Board b:list){ %>
                        <div class="qlist">
                            <div class="num"><%=b.getQnaNo() %></div>
                            <div class="title"><%=b.getQnaTitle() %></div>
                            <div class="writer"><%=b.getMemNo() %></div>
                            <div class="date"><%=b.getQnaDate() %></div>
                            <div class="count"><%=b.getCount() %></div>
                        </div>
                     <%} %>
                    <%} %>
                    </div>

                   
                   
                  <div class="paging-area" align="center" style="width=700px; text-align:center; margin-top:10px; font-size:18px; font-weight: 600px;">
        	<% if(currentPage != 1) { %>
            	<button style="background-color: transparent; color: rgb(82, 82, 82); border: 2.5px solid #d5aede ;" onclick = "location.href = '<%= contextPath %>/qlist.no?cpage=<%= currentPage - 1 %>'">&lt;</button>
            <% } %>
            
            
            <% for(int p = startPage; p <= endPage; p++) { %>
            	<% if(p == currentPage) { %>
            		<button style="background-color: transparent; color: rgb(82, 82, 82); border: 3px solid #d5aede;" disabled><%= p %></button>
            	<% } else { %>
            		<button style="background-color: transparent; color: rgb(82, 82, 82); border: 2px solid #696969 ;" onclick = "location.href = '<%= contextPath %>/qlist.no?cpage=<%= p %>'"><%= p %></button>
            	<% } %>
            <% } %>
            
            <% if(currentPage != maxPage) { %>
            	<button style="background-color: transparent; color: rgb(82, 82, 82); border: 2.5px solid #d5aede ; " onclick = "location.href = '<%= contextPath %>/qlist.no?cpage=<%= currentPage + 1 %>'">&gt;</button>
            <% } %>
            
        </div>
        <br>
        			<div class="bt_wrap">
        			<%if(loginUser ==null) { %>
                   
                    <a href="<%= contextPath %>/login.me" class="on">문의하기</a>
                    <%} else{ %>
                        <a href="<%= contextPath %>/qenrollForm.bo" class="on">문의하기</a>
                    </div>
                    <br><br>
                </div>
            </div>  
            </div>
            <%} %>
            <script>
        	$(function(){
        		$(".qlist").click(function(){
        			location.href='<%= contextPath %>/qdetail.no?bno=' + $(this).children().eq(0).text();
        		})
        	})
        </script>


</body>
</html>