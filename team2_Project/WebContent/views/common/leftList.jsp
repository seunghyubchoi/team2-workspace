<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>
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
	padding-top: 1.5rem;
	padding-bottom: 3rem;
	
}	

#content_title label {
	text-align: left;
	font-size: 2rem;
	font-weight: bolder;
	padding-top: 1.5rem;
	padding-bottom: 3rem;
	
}	

</style>
<body>
	<div id="menu_list">
		<div class="list_name">
			<a href="<%=contextPath%>/myPage.mp">회원정보관리</a>
		</div>
		<div class="list_name">
			<a href="<%=contextPath%>/orderHistory.mp?memNo=<%=loginUser.getMemNo() %>&cpage=1">주문내역</a>
		</div>
		<div class="list_name">
			<a href="<%=contextPath%>/mileageHistory.mp?memNo=<%=loginUser.getMemNo() %>&cpage=1">적립금내역</a>
		</div>
		<div class="list_name">
			<a href="<%=contextPath%>/likes.mp?memNo=<%=loginUser.getMemNo() %>&cpage=1">좋아요</a>
		</div>
		<div class="list_name">
			<a href="<%=contextPath%>/follow.mp?memNo=<%=loginUser.getMemNo() %>&cpage=1">팔로잉/팔로워</a>
		</div>
	</div>
	<!-- left list end-->
	<!-- content start-->
	<div id="menu_content">
</body>
</html>