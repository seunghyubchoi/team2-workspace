<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Document</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<script src="../../resources/js/jquery-3.6.3.min.js"></script>
<script src="https://kit.fontawesome.com/65b9d5555c.js"
	crossorigin="anonymous"></script>
<style>
div {
	/* border: 1px solid black; */
}

.input-box {
	display: flex;
	margin: 15px;
	width: 400px;
	padding: 6px;
	border-radius: 15px;
	border: 1px solid #e2e2e2;
}

.input-box i {
	flex: 1;
}

.input-box input {
	flex: 7;
	border: none;
	outline: none;
}

.product_container {
	font-size: 18px;
	font-weight: 700;
	line-height: 1.5;
	padding-top: 30px;
	padding-bottom: 30px;
}

#searchBar {
	padding-top: 50px;
}

#category_link {
	text-align: left;
	padding-left: 40px;
	padding-top: 30px;
	color: gray;
	font-size: 20px;
	font-weight: 570;
}

#category_link div {
	padding-top: 15px;
}

#category_link a {
	text-decoration: none;
	color: gray
}

.product_link {
	text-decoration: none;
	color: black;
}

.product_link:hover {
	text-decoration: underline
}

.fa {
	font-size: 25px;
	float: left;
	padding: 5px;
}

.btn {
	width: 90px;
	height: 35px;
	float: left;
	margin-right: 10px;
}
</style>
</head>

<body>
	<%@include file="../common/menubar.jsp" %>
	
	<div class="container text-center">
		<div class="row">
			<div id="input_logo" class="col">
				<img src="../resources/image/로고1.png" width="80%" height="200px"
					alt="">
			</div>
			<div id="searchBar" class="col">
				<div class="input-box">
					<i class="fa-solid i1 fa-magnifying-glass"></i> <input type="text">
					<i class="fa-solid fa-keyboard"></i> <i
						class="fa-solid fa-microphone"></i>
					<button type="button" class="btn btn-outline-info"
						style="border-color: plum; color: plum">검색</button>
				</div>
			</div>
			<div class="col"></div>
		</div>
	</div>
	<ul class="nav justify-content-center">
		<li class="nav-item"><a class="nav-link active"
			aria-current="page" href="#" style="color: plum">뭐입지그램</a></li>
		<li class="nav-item"><a class="nav-link" href="#"
			style="color: plum">쇼핑</a></li>
		<li class="nav-item"><a class="nav-link" href="#"
			style="color: plum">고객센터</a></li>
	</ul>
	<div>
		<hr>
	</div>
	<div class="container text-center">
		<div class="row row-cols-2" style="padding-top: 55px;">
			<div class="col">
				<img
					src="https://image.msscdn.net/mfile_s01/_shopstaff/view.staff_63eb3cebe45ea.jpg?20230214165104"
					alt="..." class="img-fluid" style="width: 500px; height: 600px;">
			</div>
			<div class="col">
				<div class="row" style="height: 60%;"></div>
				<div class="row" style="height: 40%;">
					<table border="0">
						<tr>
							<td style="width: 10%;"><b style="font-size: 25px;">yuuuunh</b>
							</td>
							<td>
								<ul class="icon" style="list-style: none;">
									<li><i class="fa fa-solid fa-user-plus"></i></li>
									<li><i class="fa fa-solid fa-share-nodes"></i></li>
									<li><i class="fa fa-brands fa-instagram"></i></li>
									<li><i class="fa fa-regular fa-heart"></i></li>
								</ul>
							</td>
						</tr>
						<tr>
							<td colspan="2" style="text-align: left;"><span><b>
										가을 언제 오냐고~ 나도 까죽자켓 입구 싶다고! 그나저나 슈펜에서 보라끌레르 제품제공 해줬는데 부츠가 매~끈
										하게 잘빠지고 스판이 쫀쫀해서 착용감도 편하고 날씬해 보이기까지~ </b></span></td>
						</tr>
						<tr>
							<td colspan="2">
								<button type="button" class="btn btn-secondary">스트리트</button>
								<button type="button" class="btn btn-secondary">힙합</button>
								<button type="button" class="btn btn-secondary">유니크</button>
								<button type="button" class="btn btn-secondary">겨울</button>
								<button type="button" class="btn btn-secondary">따뜻한</button>
							</td>
						</tr>
					</table>

				</div>
			</div>
			<div class="col-8"
				style="height: 500px; padding: 40px; margin-left: 35px; text-align: left">
				<i class="fa-regular fa-circle-user"
					style="font-size: 30px; padding: 5px;"></i> <input type="text"
					style="width: 450px; height: 35px;" placeholder="로그인 후 댓글을 작성해주세요.">
				<button type="button"
					style="width: 75px; height: 35px; border: 1px solid lightslategrey;">작성</button>
			</div>
			<div class="col-4"></div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>

</html>