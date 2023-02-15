<%@page import="com.kh.member.model.vo.Member"%>
<%@page import="com.kh.common.JDBCTemplate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Member loginUser = (Member) session.getAttribute("loginUser");
	String contextPath = request.getContextPath();
	String alertMsg = (String)session.getAttribute("alertMsg");

%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8"> 
<title>Insert title here</title>
</head>

<body>

<% if(alertMsg != null){ %>
    <script>
    	alert("<%=alertMsg%>");
    </script>
    <% session.removeAttribute("alertMsg"); 
    // session.invalidate() 아님
    %> 
    <% } %>
	<%
		if (loginUser == null) {
	%>
	<form action="/team2_Project/login.me" method="post">
		<input type="text" name="userId" required placeholder="아이디 입력">
		<input type="password" name="userPwd" required placeholder="비밀번호 입력">
		<input type="submit">
	</form>
	<%
		} else {
	%>

	<div>
		<b><%=loginUser.getMemName()%> 님</b>의 방문을 환영합니다 <br>
		<br>
		<div>
			<a href="<%= contextPath%>/myPage.mp">마이페이지</a>
			<a href="#">로그아웃</a>
		</div>
	</div>
	<%
		}
	%>
</body>

</html>