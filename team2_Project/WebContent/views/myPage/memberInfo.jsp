<%@page import="com.kh.payment.model.vo.Location"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" />

<!-- jQuery library -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>

<!-- Popper JS -->
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>


<style>
#wrap {
	margin: auto;
	width: 1500px;
	padding-top: 20px;
	height: 100%;
}

#menu_list {
	width: 30%;
	float: left;
	height: 100%;
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

#menu_content {
	float: right;
	width: 70%;
	height: 100%;
	text-align: center;
}

#content_title p {
	text-align: left;
	font-size: 2rem;
	font-weight: bolder;
	padding-bottom: 3rem;
}

#member_info {
	width: 100%;
	color: rgb(51, 51, 51)
}

#member_table {
	text-align: left;
	width: 100%;
	height: 100%;
}

#member_table th {
	padding-bottom: 30px;
}

#member_table td {
	padding-left: 10px;
	padding-bottom: 30px;
}

.btn {
	border: #C7A9CC;
	background-color: #C7A9CC;
}

.btn:hover {
	background-color: #9a77a1;
}

#deleteUserBtn a {
	text-decoration: none;
}
</style>
</head>

<body>
	<%@include file="../common/menubar.jsp"%>
	<%
		String memId = loginUser.getMemId();
	String memName = loginUser.getMemName();
	String gender = loginUser.getGender();
	String birthday = (loginUser.getBirthday() == null ? "" : loginUser.getBirthday());
	String phone = loginUser.getPhone();
	String email = (loginUser.getEmail() == null ? "" : loginUser.getEmail());
	String instaId = (loginUser.getInstaId() == null ? "" : loginUser.getInstaId());
	String adCheck = (loginUser.getAdCheck() == null ? "" : loginUser.getAdCheck());

	Location defaultLocation = (Location) session.getAttribute("defaultLocation");
	String locName = defaultLocation.getLocName();
	String locAddress = defaultLocation.getLocAddress();
	String locAddressName = defaultLocation.getLocAddressName();
	String locAddressDtl = defaultLocation.getLocAddressDtl();
	String locPhone = defaultLocation.getLocPhone();
	String locPostCode = defaultLocation.getLocPostCode();
	%>


	<div id="wrap">
		<div id="menu_list">
			<div class="list_name">
				<a href="<%=contextPath%>/myPage.me">회원정보관리</a>
			</div>
			<div class="list_name">
				<a href="<%=contextPath%>/orderHistory.me">주문내역</a>
			</div>
			<div class="list_name">
				<a href="<%=contextPath%>/mileageHistory.me">적립금내역</a>
			</div>
			<div class="list_name">
				<a href="<%=contextPath%>/likes.me">좋아요</a>
			</div>
			<div class="list_name">
				<a href="<%=contextPath%>/follow.me">팔로잉/팔로워</a>
			</div>
		</div>
		<div id="menu_content">
			<div id="content_title">
				<p>회원정보 관리</p>
			</div>
			<div id="member_info">
				<form action="<%=contextPath%>/update.me" method="post">
					<table id="member_table">
						<tr>
							<th>ID</th>
							<td><input type="text" class="form-control mb-2 mr-sm-2"
								name="memId" value="<%=memId%>" readonly></td>
							<td>
								<button type="button" class="btn btn-primary mb-2"
									data-toggle="modal" data-target="#updatePwdModal">비밀번호
									변경</button>
							</td>
						</tr>
						<tr>
							<th>이름</th>
							<td><input type="text" class="form-control mb-2 mr-sm-2"
								value="<%=memName%>" readonly></td>
						</tr>
						<tr>
							<th>성별</th>
							<td><select name="gender" id="gender">

									<option value="">-</option>
									<option value="남">남자</option>
									<option value="여">여자</option>

							</select></td>
						</tr>
						<tr>
							<th>생년월일</th>
							<td><input type="text" class="form-control mb-2 mr-sm-2"
								value="<%=birthday%>" name="birthday"></td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td><input type="text" class="form-control mb-2 mr-sm-2"
								value="<%=phone%>" name="phone"></td>
							<td>
								<button type="submit" class="btn btn-primary mb-2">전화번호
									변경</button>
							</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td><input type="email" class="form-control mb-2 mr-sm-2"
								value="<%=email%>" name="email"></td>
						</tr>
						<tr>
							<th>배송지</th>

							<td><%=locAddressName%><br> <%=locName%><br> <%=locAddress%><br>
								<%=locAddressDtl%><br> <%=locPostCode%><br> <%=locPhone%></td>

							<td>
								<button type="button" class="btn btn-primary mb-2">새로운
									배송지</button>
								<button type="button" class="btn btn-primary mb-2">배송지
									목록</button>
							</td>


						</tr>
						<tr>
							<th>인스타그램 ID</th>
							<td><input type="text" class="form-control mb-2 mr-sm-2"
								value="<%=instaId%>" name="instaId"></td>
						</tr>
						<tr>
							<th>마케팅 선택 동의 사항</th>
							<td><input type="checkbox" name="adCheck" id="email"
								value="이메일"> <label for="email">이메일</label> <br> <input
								type="checkbox" name="adCheck" id="text" value="문자"> <label
								for="text">문자</label></td>

						</tr>



						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td id="deleteUserBtn"><a href="#">탈퇴하기</a></td>


						</tr>

						<tr>
							<td></td>

							<td><button type="reset" class="btn btn-primary mb-2">취소하기</button>
								<button type="submit" class="btn btn-primary mb-2">저장하기</button>
							</td>

						</tr>
					</table>
					<script>
							$(function () {
								
								$("sele").each(function(){

									    if($(this).val()==$("<%=gender%>")){
											console.log($(this).val());
									      $(this).attr("selected","selected"); // attr적용안될경우 prop으로 

									    }

									  });
								
								
								const adCheck = "<%=adCheck%>";

							$("input[type=checkbox]").each(function() {
								if (adCheck.search($(this).val()) != -1) {
									$(this).attr("checked", true); // input 태그에 checked=true라는 속성생기는 거라 봐도 됨
								}
							})
						})
					</script>


				</form>
			</div>

			<!-- 비밀번호 변경 -->
			<div class="modal" id="updatePwdModal">
				<div class="modal-dialog">
					<div class="modal-content">

						<!-- Modal Header -->
						<div class="modal-header">
							<h4 class="modal-title">비밀번호 변경</h4>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>

						<!-- Modal body -->
						<div class="modal-body" align="center">
							<form action="<%=contextPath%>/updatePwd.me" method="post">
								<input type="hidden" name="memId" value="<%=memId%>">
								<table>
									<tr>
										<td>현재 비밀번호</td>
										<td><input type="password" name="memPwd" required>
										</td>
									</tr>
									<tr>
										<td>변경할 비밀번호</td>
										<td><input type="password" name="updatePwd" required></td>
									</tr>
									<tr>
										<td>변경할 비밀번호 확인</td>
										<td><input type="password" name="checkPwd" required>
										</td>
									</tr>
								</table>
								<br>
								<button type="submit" class="btn btn-sm btn-secondary"
									onclick="return validatePwd();">비밀번호변경</button>
							</form>


						</div>
						<script>
							function validatePwd() {
								if ($("input[name=updatePwd]").val() != $(
										"input[name=checkPwd]").val()) {
									alert("변경할 비밀번호가 일치하지 않습니다");
									return false;
								}
							}
						</script>


					</div>
				</div>
			</div>


		</div>
	</div>


</body>

</html>