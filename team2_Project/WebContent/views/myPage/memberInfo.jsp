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

<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
					function sample6_execDaumPostcode() {
						new daum.Postcode({
							oncomplete: function(data) {
								// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				
								// 각 주소의 노출 규칙에 따라 주소를 조합한다.
								// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
								var addr = ''; // 주소 변수
								var extraAddr = ''; // 참고항목 변수
				
								//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
								if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
									addr = data.roadAddress;
								} else { // 사용자가 지번 주소를 선택했을 경우(J)
									addr = data.jibunAddress;
								}
				
								// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
								if(data.userSelectedType === 'R'){
									// 법정동명이 있을 경우 추가한다. (법정리는 제외)
									// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
									if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
										extraAddr += data.bname;
									}
									// 건물명이 있고, 공동주택일 경우 추가한다.
									if(data.buildingName !== '' && data.apartment === 'Y'){
										extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
									}
									// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
									if(extraAddr !== ''){
										extraAddr = ' (' + extraAddr + ')';
									}
									// 조합된 참고항목을 해당 필드에 넣는다.
									document.getElementById("sample6_extraAddress").value = extraAddr;
								
								} else {
									document.getElementById("sample6_extraAddress").value = '';
								}
				
								// 우편번호와 주소 정보를 해당 필드에 넣는다.
								document.getElementById('sample6_postcode').value = data.zonecode;
								document.getElementById("sample6_address").value = addr;
								// 커서를 상세주소 필드로 이동한다.
								document.getElementById("sample6_detailAddress").focus();
							}
						}).open();
					}
				</script>

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

#locationLists td {
	padding: 5px;
}

#locationLists tr>td:nth-child(2) {
	text-align: right;
}

#locationLists div {
	border: 1px solid black;
	width: 100%;
}
</style>

</head>

<body>
	<%@include file="../common/menubar.jsp"%>
	<%
		int memNo = loginUser.getMemNo();
	String memId = loginUser.getMemId();
	String memName = loginUser.getMemName();
	String gender = loginUser.getGender();
	String birthday = (loginUser.getBirthday() == null ? "" : loginUser.getBirthday());
	String phone = loginUser.getPhone();
	String email = (loginUser.getEmail() == null ? "" : loginUser.getEmail());
	String instaId = (loginUser.getInstaId() == null ? "" : loginUser.getInstaId());
	String adCheck = (loginUser.getAdCheck() == null ? "" : loginUser.getAdCheck());
	Location defaultLocation = (Location) session.getAttribute("defaultLocation");
	ArrayList<Location> list = (ArrayList<Location>) session.getAttribute("list");
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

							<td>
								<div class="form-group">
									<select class="form-control" id="gender" name="gender">
										<option value="">입력안함</option>
										<option value="남">남자</option>
										<option value="여">여자</option>
									</select>
								</div>
							</td>
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
								<!-- <button type="submit" class="btn btn-primary mb-2">전화번호
														변경</button>  -->
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
								<%=locAddressDtl%><br> <%=locPostCode%><br> <%=locPhone%>
							</td>

							<td>
								<button type="button" class="btn btn-primary mb-2"
									data-toggle="modal" data-target="#newLocation">새로운 배송지</button>
								<button type="button" class="btn btn-primary mb-2"
									data-toggle="modal" data-target="#locationList">배송지 목록</button>
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
							<td id="deleteUserBtn"><button type="button"
									class="btn btn-sm btn-danger" data-toggle="modal"
									data-target="#deleteModal">회원탈퇴</button></td>


						</tr>

						<tr>
							<td></td>

							<td><button type="button" class="btn btn-primary mb-2"
									onclick="history.back();">뒤로가기</button>
								<button type="submit" class="btn btn-primary mb-2">저장하기</button>
							</td>

						</tr>
					</table>
					<script>
											$(function () {
												const gender = "<%=gender%>";
												$("#gender").children().each(function () {
													if ($(this).val() == gender) {
														// console.log($(this).val());
														$(this).attr("selected", "selected"); // attr적용안될경우 prop으로 

													}

												});


												const adCheck = "<%=adCheck%>
						";

							$("input[type=checkbox]").each(function() {
								if (adCheck.search($(this).val()) != -1) {
									$(this).attr("checked", true); // input 태그에 checked=true라는 속성생기는 거라 봐도 됨
								}
							})
						})
					</script>


				</form>
			</div>

			<!-- 새로운 배송지 Modal -->
			<div class="modal" id="newLocation">
				<div class="modal-dialog">
					<div class="modal-content">
						<!-- Modal Header -->
						<div class="modal-header">
							<h4 class="modal-title">새로운 배송지</h4>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>
						<!-- Modal body -->
						<div class="modal-body" align="center">
							<form action="<%=contextPath%>/delete.me" method="post">
								<table>
									<tr>
										<th>배송지 이름</th>
									</tr>
									<tr>
										<td><input type="text" class="form-control mb-2 mr-sm-2"
											value="" name="" placeholder="배송지 이름을 입력해주세요"></td>
									</tr>
									<tr>
										<th>받으시는 분</th>
									</tr>
									<tr>
										<td><input type="text" class="form-control mb-2 mr-sm-2"
											value="" name="" placeholder="받으시는 분 이름을 입력해주세요"></td>
									</tr>
									<tr>
										<th>주소</th>
									</tr>
									<tr>
										<td>
											<div class="input-group mb-3">
												<input type="text" class="form-control" placeholder="우편번호"
													id="sample6_postcode" readonly>
												<div class="input-group-append">
													<button class="btn btn-success" type="button"
														onclick="sample6_execDaumPostcode()">우편번호 검색</button>
												</div>
											</div>

										</td>
									</tr>
									<tr>
										<td><input type="text" class="form-control mb-2 mr-sm-2"
											id="sample6_address" value="" name="" placeholder="주소"
											readonly></td>
									</tr>
									<tr>
										<td><input type="text" class="form-control mb-2 mr-sm-2"
											value="" name="" placeholder="상세주소를 입력해주세요"></td>
									</tr>
									<tr>
										<td align="center">
											<button type="button" class="btn btn-primary mb-2"
												onclick="history.back();">뒤로가기</button>
											<button type="submit" class="btn btn-primary mb-2">저장하기</button>
										</td>
									</tr>

								</table>

							</form>
						</div>
					</div>
				</div>
			</div>

			<!-- 배송지 목록 Modal -->
			<div class="modal" id="locationList">
				<div class="modal-dialog">
					<div class="modal-content">
						<!-- Modal Header -->
						<div class="modal-header">
							<h4 class="modal-title">배송지 목록</h4>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>
						<!-- Modal body -->
						<div class="modal-body" align="center">
							<form action="<%=contextPath%>/delete.me" method="post">
								<input type="hidden" name="memNo" value="<%=memNo%>">

								<table id="locationLists">
									<%
										if (list.isEmpty()) {
									%>
									<tr>
										<td>존재하는 배송지가 없습니다.</td>
									</tr>
									<%
										} else {
									%>
									<%
										for (Location l : list) {
									%>
									<tr>
										<td><%=l.getLocAddressName() %></td>
										<td><input type="radio" id="defaultLocation"
											name="defaultLocation" value="defaultLocation"> <span></span>
										</td>
									</tr>
									<tr>
										<td><%=l.getLocName() %></td>
									</tr>
									<tr>
										<td><%=l.getLocAddress() %></td>
										
									</tr>
									<tr>
										<td><%=l.getLocAddressDtl() %></td>
									</tr>
									<tr>
										<td><%=l.getLocPostCode() %></td>
									</tr>
									<tr>
										<td><%=l.getLocPhone() %></td>
									</tr>
									
									
									
									<%
										}
									%>
									
									<%
										}
									%>

									<tr>
										<td colspan="2">
											<hr>
										</td>
									</tr>

									<tr>
										<td></td>
										<td><button type="submit" class="btn btn-sm btn-danger">수정하기</button>
											<button type="submit" class="btn btn-sm btn-danger">삭제하기</button>
										</td>
									</tr>

								</table>
								<script>
									$(
											function() {
												$(
														'input[name="defaultLocation"]')
														.change(
																function() {
																	$(
																			'input[name="defaultLocation"]')
																			.each(
																					function() {
																						let checked = $(
																								this)
																								.prop(
																										'checked');
																						let defaultLocMsg = $(
																								this)
																								.next();
																						if (checked) {
																							$(
																									defaultLocMsg)
																									.text(
																											"기본배송지");
																						} else {
																							$(
																									defaultLocMsg)
																									.text(
																											"");
																						}
																					})
																})
											})
								</script>




							</form>
						</div>
					</div>
				</div>
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

			<!-- 회원탈퇴용 Modal -->
			<div class="modal" id="deleteModal">
				<div class="modal-dialog">
					<div class="modal-content">
						<!-- Modal Header -->
						<div class="modal-header">
							<h4 class="modal-title">회원탈퇴</h4>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>
						<!-- Modal body -->
						<div class="modal-body" align="center">
							<form action="<%=contextPath%>/delete.me" method="post">
								<input type="hidden" name="memId" value="<%=memId%>"> <b>탈퇴
									후 복구가 불가능합니다<br> 정말로 탈퇴하시겠습니까?<br>
								</b> 비밀번호 : <input type="password" name="memPwd" required> <br>
								<br>
								<button type="submit" class="btn btn-sm btn-danger">탈퇴하기</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>

</html>