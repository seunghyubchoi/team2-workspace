<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#footer {
	float: left;
	height: 13%;
	/*height: 260px;*/
}

#footer>div {
	height: 100%;
	text-align: center;
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



h4 {
    display: block;
    margin-block-start: 1.33em;
    margin-block-end: 1.33em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
    font-size: 20px !important;
}

#line1 {
float: left;
	border: #E0BFE6 solid 5px;
	margin-top: 10px;
	margin-bottom: 10px;
}
}
</style>
</head>
<body>
	<!-- content end -->
	</div>
	<!-- footer start-->

	<div id="line1"></div>
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
			<div class="ft1" style="height: 90%;">
				<img src="resources/img/로고1.png" alt=".." width="100%" height=100%
					style="padding: -10% 0%;" margin="5px">
			</div>
			<div class="ft2"
				style="height: 10%; margin-left: 180px; margin-bottom: 10px;">

				<a href="/team2_Project/logout.me" class="btn-3d-2">로그아웃</a>
			</div>

		</div>
		<!-- footer end-->
	</div>
	<!-- wrap end -->

</body>
</html>