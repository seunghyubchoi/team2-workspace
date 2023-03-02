<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<style>


</style>
</head>

<body>
	<%@include file="../common/menu.jsp"%>
	<%@include file="../common/leftList.jsp"%>
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
					<a href=""><img src="" alt=""></a>
					
				</p>
			</div>
			
		</div>
	</div>
	<%@include file="../common/footer.jsp"%>


</body>

</html>