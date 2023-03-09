<%@page import="com.kh.community.model.vo.Instagram"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ArrayList<Instagram> list = (ArrayList<Instagram>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<script src="../../resources/js/jquery-3.6.3.min.js"></script>
<style>
 .btn-3d-1:hover,.btn-3d-3:active,.btn-3d-4:active {background-color: #fd98ba; color: rgb(70, 69, 69);}
  .btn-3d-1:active,.btn-3d-2:active,.btn-3d-3:active,.btn-3d-4:active {
	top: 3px;
  }
.btn-3d-3 {
	position: relative;
	display: inline-block;
	font-size: 20px;
	padding: 6px 30px;
	color: white;
	align-self: left;
	border-radius: 6px;
	text-align: center;
	transition: top .01s linear;
	text-shadow: 0 1px 0 rgba(0,0,0,0.15);
	background-color: #d49de2;
	box-shadow: 0 0 0 1px #cb98df inset,
		  0 0 0 2px rgba(255,255,255,0.15) inset,
		  0 8px 0 0 rgba(219, 155, 245, 0.7),
		  0 8px 0 1px rgba(0,0,0,.4),
		  0 8px 8px 1px rgba(0,0,0,0.5);
	/* margin-left: 1320px; 
	margin-top: 10px;*/
	margin-bottom: 10px;
  }
</style>
</head>
<body>
	<%@include file="../common/menubar.jsp"%>

	<div class="container text-center">
		<div class="row">
			<div class="col">
				<div style="padding-top: 35px; width: 200px;">
					<select id="instaSelect" class="form-select form-select-lg mb-3"
						aria-label=".form-select-lg example">
						<option value="1">최신순</option>
						<option value="2">좋아요순</option>
					</select>
				</div>
			</div>

			<script>
			const instaSelect = document.getElementById('instaSelect');
			
			function instaSelectChange() {
				
				var sortValue = instaSelect.value;
				
				if (sortValue === '1') {
					  location.href = '<%= contextPath %>/list.co?sort=latest';
				  } else if (sortValue === '2') {
					  location.href = '<%= contextPath %>/list.co?sort=likes';
				  }
			}
			
			instaSelect.addEventListener('change', instaSelectChanged);
			
			
			
			
			
			</script>
			<div class="col"></div>
			<div class="col">
				<% if (loginUser != null) { %>
				<!-- 로그인한 회원만 보이게 -->
				<div style="padding-top: 35px; float: right;">
					<%-- <a class="btn btn-secondary btn-lg"
						href="<%= contextPath %>/upload.co" role="button">스타일올리기</a> --%>
					<a href="<%= contextPath %>/upload.co" class=" btn-3d-3">STYLE UP</a>
				</div>
				<% } %>
			</div>
		</div>
		<div class="container text-center">
			<div class="row row-cols-4" style="padding-top: 35px;">
				<% if (list.isEmpty()) { %>
				<p>조회된 게시글이 없습니다.</p>
				<% } else { %>
				<% for (Instagram insta : list) { %>
				<div class="col thumbnail" style="padding-bottom: 35px">
					<input type="hidden" value="<%= insta.getComNo() %>">
					<img src="<%= insta.getInstaImgSrc() + insta.getInstaImgChange() %>"
						class="img-fluid" alt="인스타 사진" style="width: 100%; height: 100%;">
				</div>
				<% } %>
				<% } %>
			</div>
		</div>

		<nav aria-label="Page navigation example" style="padding-top: 150px;">
			<ul class="pagination justify-content-center">
				<li class="page-item"><a class="page-link" href="#"
					aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
				</a></li>
				<li class="page-item"><a class="page-link" href="#">1</a></li>
				<li class="page-item"><a class="page-link" href="#">2</a></li>
				<li class="page-item"><a class="page-link" href="#">3</a></li>
				<li class="page-item"><a class="page-link" href="#"
					aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</ul>
		</nav>
	</div>

	<script>
		$(".thumbnail").click(function() {
			location.href = "<%= contextPath %>/feed.co?cno=" + $(this).children("input").val();
		})
	</script>

</body>
</html>