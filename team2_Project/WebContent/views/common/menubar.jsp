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
<style>
div{
	box-sizing: border-box;
}

.wrap2 {
	width: 1500px;
	/* height: 1800px; */
	margin: auto;
}

.wrap2>div {
	width: 100%;
}

#header {
	/* height: 15% */
	height: 270px;
	margin-bottom: 10px
}

#header>div {
	height: 100%;
}

#header {
	width: 1500px;
}

#head1 {
	width: 30%;
	height: 100%;
	float: left;
}

#head2 {
	width: 70%;
	float: left;
	height: 100%;
}

#head2>#head2_1 {
	height: 60%;
}

#head2>#head2_2 {
	height: 40%;
}

#memmem{height:60%}
#search{height:40%}

#search {
	width: 100%;
	height: 100%;
}

#searchbar {
	width: 700px;
        height: 55px;
        margin-top: 15px;
        margin-left: 60px;
        border-radius: 20px;
        border-color: #a68bac;
        border-style: solid;
}

#btnsh {
	font-size: 18px;
	color: #ffffff;
	margin: 10px;
	width: 100px;
	height: 50px;
	border-radius: 15px;
	background-color: #d6b9e7;
	box-shadow: 0 0 0 1px #cb98df inset,
		  0 0 0 3px rgba(206, 121, 223, 0.534) inset,
		  0 8px 0 0 rgba(254, 253, 255, 0.863),
		  0 8px 0 2px rgba(0, 0, 0, 0.151),
		  0 8px 8px 1px rgba(242, 184, 253, 0.5);
		  border: #a68bac;
}



li {
	list-style: none;
	font-size:14px;
}

a {
	text-decoration: none; 
	font-size: 14px
}

.menu {
	width: 1500px;
	margin: 10px;
	padding: 10px;
}

.menu>li {
	width: 20%; /*20*5=100%*/
  float: left;
  text-align: center;
  line-height: 40px;
  margin: 15px 20px 0px 0px;
  border-radius: 10px;
  background-color: #e2bbe7;
	box-shadow: 0 0 0 1px #cb98df inset,
		  0 0 0 3px rgba(206, 121, 223, 0.534) inset,
		  0 8px 0 0 rgba(254, 253, 255, 0.863),
		  0 8px 0 2px rgba(0, 0, 0, 0.151),
		  0 8px 8px 1px rgba(242, 184, 253, 0.5);
}

.menu a {
	color: #fff;
	text-align: center;
	font-size: 20px;
	font-family: sans-serif;
	display: block;
}

.submenu>li {
	line-height: 70px;
	text-align: center;
	background-color: #fd98ba;
}

.submenu {
	height: 0;
	overflow: hidden;
}

.menu>li:hover {
	background-color: #fd98ba;
	text-align: center;
	transition-duration: 0.5s;
}

.menu>li:hover .submenu {
	height: 350px;
	transition-duration: 1.5s;
	text-align: center;
}
</style>
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
	<div class="wrap2">
		<!--header-->
		<div id="header">
			<div id="head1">
				<img src="<%= contextPath%>/resources/img/logo1.png" width=100% height=100%
					style="padding: 30px 30px 10px 0px;">
			</div>
			<div id="head2">
				<div id="head2_1">
					<div id=memmem></div>
					<div id="search">
						<input type="text" id="searchbar"
							placeholder="검색을 원하는 상품을 입력해주세요.">
						<button id="btnsh">검색</button>
					</div>

				</div>
				<div id="head2_2">
					<ul class="menu">
						<li><a href="#">뭐입지그램</a></li>
						<li><a href="#">상품</a>
							<ul class="submenu">
								<li><a href="#">아우터</a></li>
								<li><a href="#">상의</a></li>
								<li><a href="#">하의</a></li>
								<li><a href="#">신발</a></li>
								<li><a href="#">악세사리</a></li>
							</ul></li>
						<li><a href="#">고객센터</a>
							<ul class="submenu">
								<li><a href="#">공지사항</a></li>
								<li><a href="#">문의사항</a></li>
								<li><a href="#">submenu03</a></li>
								<li><a href="#">submenu04</a></li>
								<li><a href="#">submenu05</a></li>
							</ul>
							</li>
					</ul>
				</div>
			</div>
		</div>

	</div>
</body>

</html>