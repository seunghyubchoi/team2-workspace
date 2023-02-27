<%@page import="com.kh.member.model.vo.Member"%>
<%@page import="com.kh.common.JDBCTemplate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Member loginUser = (Member) session.getAttribute("loginUser");
String contextPath = request.getContextPath();
String alertMsg = (String) session.getAttribute("alertMsg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
div {
	box-sizing: border-box;
}

.wrap {
	width: 1500px;
	height: 1800px;
	margin: auto;
}

.wrap>div {
	width: 100%;
}

#header {
	height: 15%;
	/*height: 270px;*/
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

#search {
	width: 100%;
	height: 100%;
}

#searchbar {
	width: 700px;
	height: 45px;
	margin-top: 115px;
	margin-left: 50px;
	border-radius: 15px;
	border-color: #cb7cdd;
}

#btnsh {
	font-size: 18px;
	color: #ffffff;
	margin: 10px;
	width: 100px;
	height: 50px;
	border-radius: 15px;
	background-color: #cb7cdd;
	border: none;
}

li {
	list-style: none
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
	width: 20%;
	/*20*5=100%*/
	float: left;
	text-align: center;
	line-height: 40px;
	background-color: rgb(161, 99, 212);
	margin: 10px;
	border-radius: 10px;
}

.menu a {
	color: #fff;
	text-align: center;
	font-size: 20px;
	font-family: sans-serif;
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

/* left list*/
#menu_list {
	width: 30%;
	float: left;
	height: 70%;
	padding-top: 45px;
}

.list_name {
	width: 100%;
	padding-bottom: 2.5rem;
	padding-left: 4rem;
}

.list_name a {
	color: rgb(51, 51, 51);
	font-size: 1.5rem;
	text-decoration: none;
	font-weight: bold;
}

/* right content*/
#menu_content {
	float: right;
	width: 70%;
	height: 70%;
	text-align: center;
}

#content_title p {
	text-align: left;
	font-size: 2rem;
	font-weight: bolder;
	padding-bottom: 3rem;
}

/*footer*/
.footer {
	float: left;
	height: 15%;
	/*height: 260px;*/
}


#footer>div {
	height: 100%;
	text-align: center;
	font-size: 20px;
}

.ft {
	border: 1px solid rgb(182, 169, 169);
	width: 25%;
	float: left;
	padding: 5px;
	border-bottom: white;
	border-top: white;
}

#f1 {
	width: 1500px;
	border: 7px solid #E0BFE6;
	border-bottom: white;
	border-left: white;
	border-right: white;
	padding-bottom: 10px;
}
</style>
</head>
<body>
	<%
		if (alertMsg != null) {
	%>
	<script>
    	alert("<%=alertMsg%>
		");
	</script>
	<%
		session.removeAttribute("alertMsg");
	// session.invalidate() 아님
	%>
	<%
		}
	%>
	<!-- wrap start -->
	<div class="wrap">
		<!-- header start -->
		<div id="header">
			<div id="head1">
				<img src="<%=contextPath%>/resources/img/logo1.png" width=100%
					height=100% style="padding: 30px 30px 10px 0px;">
			</div>
			<div id="head2">
				<div id="head2_1">
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
							</ul></li>
					</ul>
				</div>
			</div>
		</div>
		<!-- header end -->

		<!-- body start -->
		<!-- left list start-->
		<div id="menu_list">
			<div class="list_name">
				<a href="<%=contextPath%>/myPage.mp">회원정보관리</a>
			</div>
			<div class="list_name">
				<a href="<%=contextPath%>/orderHistory.mp">주문내역</a>
			</div>
			<div class="list_name">
				<a href="<%=contextPath%>/mileageHistory.mp">적립금내역</a>
			</div>
			<div class="list_name">
				<a href="<%=contextPath%>/likes.mp">좋아요</a>
			</div>
			<div class="list_name">
				<a href="<%=contextPath%>/follow.mp">팔로잉/팔로워</a>
			</div>
		</div>
		<!-- left list end-->
		<!-- content start-->
		<div id="menu_content">
			<div id="content_title">
				<p>회원정보 관리</p>
			</div>
			<div>sdfjslfsljdlsfjldsjlfdjslkjlksjvljdslkvjsdlkvklj</div>
			<!-- content end -->
		</div>
		<!-- footer start-->
		<div class="footer">
			<div id="f1"></div>
			<div id="footer">
				<div class="ft" style="border-left: white;">
					<h4>전화 문의(9시~16시)</h4>
					<h4 style="font-weight: lighter;">1588-1588</h4>
				</div>
				<div class="ft">
					<h4>고객센터 미운영시간 안내</h4>
					<h4 style="font-weight: lighter;">
						점심시간(12시~13시) <br> (토/일, 공휴일은 휴무)
					</h4>
				</div>
				<div class="ft">
					<h4>약관 및 정책 안내</h4>
					<h4 style="font-weight: lighter;">
						개인정보처리방침 <br> 이용약관 <br> 사업자 정보 확인
					</h4>
				</div>
				<div class="ft" style="border-right: white;">
					<img src="resources/img/로고1.png" alt=".." width="100%" height=100%
						style="padding: 5% 0%;" margin="5px">
				</div>
			</div>
		</div>
		<!-- footer end-->
	</div>
	<!-- wrap end -->

</body>
</html>