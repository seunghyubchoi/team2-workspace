<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>


		<style>
			.list-area {
				width: 760px;
				margin: auto;
			}

			.thumbnail {
				border: 1px solid white;
				width: 220px;
				margin: 14px;
				display: inline-block;
			}

			.thumbnail:hover {
				cursor: pointer;
				opacity: 0.7
			}
		</style>
	</head>

	<body>
		<%@include file="../common/menu.jsp" %>
			<%@include file="../common/leftList.jsp" %>
				<div id="content_title">
					<p>좋아요</p>
				</div>
				<div id="content">
					<!-- <p>좋아요한 스타일이 없습니다.</p> -->
					<div class="list-area">
						<!-- 썸네일 한 개-->
						<div class="thumbnail" align="center">
							<input type="hidden" value="">
							<img src="" alt="" width="200" height="150">
							<p>
								<img src="../../resources/img/heartRed.png" alt="" id="heart">
								<span>hhhy2</span>
								<a href=""><img src="../../resources/img/instagram.png" alt="" id="instaLogo"></a>
							</p>
						</div>
						<!-- 썸네일 한 개-->
						<div class="thumbnail" align="center">
							<input type="hidden" value="">
							<img src="" alt="" width="200" height="150">
							<p>
								<img src="../../resources/img/heartRed.png" alt="" id="heart">
								<span>hhhy2</span>
								<a href=""><img src="../../resources/img/instagram.png" alt="" id="instaLogo"></a>
							</p>
						</div>
						<!-- 썸네일 한 개-->
						<div class="thumbnail" align="center">
							<input type="hidden" value="">
							<img src="" alt="" width="200" height="150">
							<p>
								<img src="../../resources/img/heartRed.png" alt="" id="heart">
								<span>hhhy2</span>
								<a href=""><img src="../../resources/img/instagram.png" alt="" id="instaLogo"></a>
							</p>
						</div>

					</div>
				</div>
				<%@include file="../common/footer.jsp" %>


	</body>

	</html>