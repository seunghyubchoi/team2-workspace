<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
			integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
		<script src="../../resources/js/jquery-3.6.3.min.js"></script>

		<style>
			div {
				box-sizing: border-box;
				/* border: 1px solid rgb(168, 168, 168); */
			}

			.wrap {
				width: 1500px;
				height: 1500px;
				margin: auto;
			}

			.wrap>div {
				width: 100%;
			}

			#header {
				height: 20%
			}

			/* #navigator {
            height: 20%;
        } */
			#content {
				height: 78%
			}

			#footer {
				height: 7%;
			}

			/* header */
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

			/*검색창*/
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

			/* 메뉴바 */
			li {
				list-style: none;
				/* padding: 0;
            margin: 0 */
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

			#navigator>div {
				height: 100%;
			}

			#navigator {
				width: 1500px;
			}

			#navi1 {
				width: 80%;
				height: 100%;
				float: left;
			}

			#navi2 {
				width: 20%;
				height: 100%;
				float: left;
			}

			/* footer */
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

			#content {
				padding-left: 300px;
				padding-top: 50px;
			}

			button {
				width: 80px;
				height: 30px;
			}

			#brandBtn>button {
				height: 50px;
				width: 50px;
				border: 0px;
				border-radius: 50%;
			}

			img {
				width: 35px;
				height: 35px;
			}

			td {
				width: 160px;
				height: 50px;
				padding: 10px;
			}

			.container {
				width: 800px;
				height: 600px;
				/* border: 1px solid black; */
			}

			button {
				border: 1px solid black;
			}
		</style>
	</head>

	<body>
		<div class="wrap">
			<!--header-->
			<div id="header">
				<div id="head1">
					<img src="resources/logo.png" width=100% height=100% style="padding: 30px 30px 10px 0px;">
				</div>
				<div id="head2">
					<div id="head2_1">
						<div id="search">
							<input type="text" id="searchbar" placeholder="검색을 원하는 상품을 입력해주세요.">
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
								</ul>
							</li>
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

			<!--navigator-->
			<!-- <div id="navigator">
            <div id="navi1">네비1</div>
            <div id="navi2">네비2</div>
        </div> -->

			<!--content-->
			<div id="content">
				<h1>스타일 업로드</h1>
				<br>
				<form action="" method="post" enctype="multipart/form-data">

					<h3>사진</h3>
					<img id="preview" style="width: 200px; height: 200px;" data-bs-toggle="modal"
						data-bs-target="#exampleModal">
					<input type="file" onchange="readURL(this);">
					<br> <br>

					<script>
						function readURL(input) {
							if (input.files && input.files[0]) {
								var reader = new FileReader();
								reader.onload = function (e) {
									document.getElementById('preview').src = e.target.result;
								};
								reader.readAsDataURL(input.files[0]);
							} else {
								document.getElementById('preview').src = "";
							}
						}
					</script>

					<!-- Modal -->
					<div class="modal fade modal-dialog modal-xl" id="exampleModal" tabindex="-1"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h1 class="modal-title fs-5" id="exampleModalLabel">내일뭐입지</h1>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<div class="container">
										<div class="row">
											<div class="col">
												<table border="1">
													<tr>
														<td colspan="2">
															<h5>브랜드 선택</h5>
														</td>
													</tr>
													<tr>
														<td colspan="2" id="brandBtn">
															<button>
																<img src="resources/나이키 (2).png" alt="">
															</button>
															<button>
																<img src="resources/무아무아 (2).png" alt="">
															</button>
															<button>
																<img src="resources/아디다스 (2).png" alt="">
															</button>
															<button>
																<img src="resources/oioi.png" alt="">
															</button>
															<button>
																<img src="resources/키르시 (2).png" alt="">
															</button>
														</td>
													</tr>
													<tr>
														<td colspan="2">
															<h5>상품명</h5>
														</td>
													</tr>
													<tr>
														<td colspan="2"><input type="text" placeholder="상품명"
																style="width: 250px; height: 35px;"></td>
													</tr>
													<tr>
														<td>
															<h5>사이즈</h5>
														</td>
														<td>
															<h5>카테고리</h5>
														</td>
													</tr>
													<tr>
														<td><select name="" id="" style="width: 100px; height: 35px;">
																<option value="">Free</option>
																<option value="">S</option>
																<option value="">M</option>
																<option value="">L</option>
																<option value="">XL</option>
															</select></td>
														<td><select name="" id="" style="width: 100px; height: 35px;">
																<option value="">아우터</option>
																<option value="">상의</option>
																<option value="">하의</option>
																<option value="">슈즈</option>
															</select></td>
													</tr>
													<tr>
														<td colspan="2">
															<h5>가격 입력</h5>
														</td>
													</tr>
													<tr>
														<td colspan="2"><input type="text"
																style="width: 250px; height: 35px;"></td>
													</tr>
													<tr>
														<td colspan="2">
															<h5>링크입력</h5>
														</td>
													</tr>
													<tr>
														<td colspan="2"><input type="url"
																style="width: 250px; height: 35px;"></td>
													</tr>
													<tr>
														<td colspan="2" style="text-align: center;">
															<button>취소</button>
															<button>확인</button>
														</td>
													</tr>
												</table>
											</div>
											<div class="col">
												<div class="row" style="height: 85%;">
													<img src="resources/6.jpg" alt=""
														style="height: 600px; width: 350px;">
												</div>
												<div class="row"></div>
											</div>
										</div>

									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
									<button type="button" class="btn btn-primary">확인</button>
								</div>
							</div>
						</div>
					</div>

					<h3>설명</h3>
					<h5>스타일을 소개해주세요.</h5>
					<textarea name="" id="" cols="100" rows="10"></textarea>
					<br> <br>
					<h3>인스타 아이디</h3>
					<h5>입력하신 인스타 아이디는 회원 정보에 자동 저장됩니다.</h5>
					<input type="text"> <br> <br>
					<h3>태그 추가</h3>
					<input type="text">
					<button>등록</button>
					<br> <br> <br> <br> <input type="checkbox" required>
					콘텐츠 활동 동의 (필수)
					<h5>
						- 게시물은 1일 1회만 업로드할 수 있습니다. <br> - 비방성이나 광고성 글, 또는 본 게시판의 성격과
						맞지 않은 글은 본인의 동의 없이 관리자가 임의대로 삭제할 수 있습니다.
					</h5>
					<br> <br>
					<button>취소</button>
					<button>업로드</button>


				</form>
			</div>

			<!--footer-->
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
					<img src="img/로고1.png" alt=".." width="100%" height=100% style="padding: 5% 0%;" margin="5px">
				</div>
			</div>

		</div>

		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
			crossorigin="anonymous"></script>
	</body>

	</html>