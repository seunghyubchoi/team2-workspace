<%@page import="com.kh.payment.model.vo.Location"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
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
	<%@include file="../common/menu.jsp"%>
	<%@include file="../common/leftList.jsp"%>

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
	Location defaultLocation;

	defaultLocation = (Location) session.getAttribute("defaultLocation");
	ArrayList<Location> list = (ArrayList<Location>) session.getAttribute("list");
	String locName = null;
	String locAddress = null;
	String locAddressName = null;
	String locAddressDtl = null;
	String locPhone = null;
	String locPostCode = null;
	String locYn = null;
	boolean flag = false;

	if (defaultLocation != null) {
		locName = defaultLocation.getLocName();
		locAddress = defaultLocation.getLocAddress();
		locAddressName = defaultLocation.getLocAddressName();
		locAddressDtl = defaultLocation.getLocAddressDtl();
		locPhone = defaultLocation.getLocPhone();
		locPostCode = defaultLocation.getLocPostCode();
		locYn = defaultLocation.getLocYn();
	} else{
		flag = true;
	}
	int num = 0;
	%>




	<div id="content_title">
		<p>회원정보 관리</p>
	</div>
	<div id="content">
		<form action="<%=contextPath%>/update.me" method="post">
			<table id="content_table">
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
					<%
						if (defaultLocation != null) {
					%>
					<td>
					<%=locAddressName%><br> <%=locName%><br> <%=locAddress%><br>
					<%=locAddressDtl%><br> <%=locPostCode%><br> <%=locPhone%>
					</td>
					<%
						} else {
					%>
					<td>등록된 배송지가 없습니다.</td>
					<%
						}
					%>
					<td>
						<button type="button" id="btn_newLoc" class="btn btn-primary mb-2"
							data-toggle="modal" data-target="#newLocation">
							<!-- onclick="return validateLoc();" -->
							새로운 배송지
						</button>
						<button type="button" id="btn_locList"
							class="btn btn-primary mb-2" data-toggle="modal"
							data-target="#locationList">배송지 목록</button>
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
							onclick="checkPwd();">뒤로가기</button>
						<button type="submit" class="btn btn-primary mb-2">저장하기</button></td>

				</tr>
			</table>
			<script>
			function checkPwd() {
				location.href = "<%=contextPath%>/myPage.mp";
			}
											$(function () {
												const gender = "<%=gender%>";
												$("#gender").children().each(function () {
													if ($(this).val() == gender) {
														// console.log($(this).val());
														$(this).attr("selected", "selected"); // attr적용안될경우 prop으로 

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
				<%if(flag == true) {%>
					<form action="<%=contextPath%>/insertFirst.lo" method="post">
				<%} else { %>
					<form action="<%=contextPath%>/insert.lo" method="post">
					<%} %>
						<input type="hidden" name="memNo" value="<%=memNo%>">
						<table>
							<tr>
								<th>배송지 이름</th>
							</tr>
							<tr>
								<td><input type="text" class="form-control mb-2 mr-sm-2"
									value="" name="locAddressName" placeholder="배송지 이름을 입력해주세요"
									required></td>
							</tr>
							<tr>
								<th>받으시는 분</th>
							</tr>

							<tr>
								<td><input type="text" class="form-control mb-2 mr-sm-2"
									value="" name="locName" placeholder="받으시는 분 이름을 입력해주세요"
									required></td>
							</tr>
							<tr>
								<th>전화번호</th>
							</tr>
							<tr>
								<td><input type="text" class="form-control mb-2 mr-sm-2"
									value="" name="locPhone" placeholder="전화번호를 입력해주세요" required></td>
							</tr>
							<tr>
								<th>주소</th>
							</tr>
							<tr>
								<td>
									<div class="input-group mb-3">
										<input type="text" class="form-control" placeholder="우편번호"
											name="locPostCode" id="sample6_postcode" required readonly>
										<div class="input-group-append">
											<button class="btn btn-success" type="button"
												onclick="sample6_execDaumPostcode()">우편번호 검색</button>
										</div>
									</div>

								</td>
							</tr>
							<tr>
								<td><input type="text" class="form-control mb-2 mr-sm-2"
									id="sample6_address" value="" name="locAddress"
									placeholder="주소" required readonly></td>
							</tr>
							<tr>
								<td><input type="text" class="form-control mb-2 mr-sm-2"
									id="sample6_extraAddress" placeholder="주소2" required readonly></td>
							</tr>

							<tr>
								<td><input type="text" class="form-control mb-2 mr-sm-2"
									id="sample6_detailAddress" value="" name="locAddressDtl"
									placeholder="상세주소를 입력해주세요" required></td>
							</tr>

							<tr>
								<td align="center">
									<button type="button" class="btn btn-primary mb-2"
										 data-dismiss="modal">뒤로가기</button>
									<button type="submit" class="btn btn-primary mb-2">저장하기</button>
								</td>
							</tr>

						</table>

					</form>
				</div>
			</div>
		</div>
	</div>
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	function backToMyPage(){
		location.href = "<%=contextPath%>/memberInfo.mp";
		}

		function sample6_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
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
							if (data.userSelectedType === 'R') {
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (extraAddr !== '') {
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
							document.getElementById("sample6_detailAddress")
									.focus();
						}
					}).open();
		}
	</script>


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
							// int i=0;

						for (Location l : list) {
						%>
						<form action="<%=contextPath%>/modifyLoc.lo" method="post">
							<input type="hidden" name="locNo" value="<%=l.getLocNo()%>">
							<!--<input type="hidden" value="<%=l.getLocYn()%>">  -->
							<tr>
								<td><%=l.getLocAddressName()%></td>
							</tr>

							<tr>
								<td><%=l.getLocName()%></td>
							</tr>
							<tr>
								<td><%=l.getLocAddress()%></td>

							</tr>
							<tr>
								<td><%=l.getLocAddressDtl()%></td>
							</tr>
							<tr>
								<td><%=l.getLocPostCode()%></td>
							</tr>
							<tr>
								<td><%=l.getLocPhone()%></td>
							</tr>
							<%
								num++;
							%>
							<tr>
								
								<td><button type="submit" class="btn btn-sm btn-danger"
										value="<%=l.getLocNo()%>">수정하기</button>
									<button type="button" class="btn btn-sm btn-danger"
										data-toggle="modal" data-target="#deleteLocation" id="<%=l.getLocYn() %>"
										value="<%=l.getLocNo()%>" onclick="return deleteLocNo(this);">삭제하기</button></td>
							</tr>
							<tr>
								<td colspan="2">
									<hr>
								</td>
							</tr>
						</form>
						<%
							}
						%>

						<%
							}
						%>




					</table>
					<script>
						$(function() {

							// 새로운 배송지 추가 클릭 시 2개면?
							let num =
					<%=num%>
						;
							$("#btn_newLoc").click(function() {
								if (num == 2) {
									alert("새로운 배송지를 추가할 수 없습니다.");
									console.log($(this))
									$(this).removeAttr("data-target");
									// 여기서 배송지가 2개에서 1개로 변경하고도 나오는지 확인해야함
								}
							})
							// 목록 클릭시 기본배송지 radio 체크 표기(사용안함)
							$('input[name="defaultLocation"]').each(function() {
								if ($(this).val() == 'Y') {
									$(this).prop('checked', true);
									$(this).next().text("기본배송지");
								}
							})
							// radio로 기본배송지 선택 (사용안함)
							$('input[name="defaultLocation"]')
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

						function validateLoc() {
							let num =
					<%=num%>
						;
							console.log(num);
							if (num == 2) {
								alert("새로운 배송지를 추가할 수 없습니다.");
								return false;
							}
						}
					</script>




					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- 배송지 삭제 -->
	<div class="modal" id="deleteLocation">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">배송지 삭제</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<!-- Modal body -->
				<div class="modal-body" align="center">
					<form action="<%=contextPath%>/delete.lo" method="post"
						onsubmit="return validateLocDel();">
						<input type="hidden" name="memNo" value="<%=memNo%>"> <input
							type="hidden" name="locNo" value="" id="locDelete">  <b>정말로 삭제하시겠습니까?<br>

							<button type="submit" class="btn btn-sm btn-danger">삭제</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script>
		let listSize = <%=list.size()%>
		
		//let locYnCheck = $(".locYnCheck").val();
		//console.log(listSize);
		
		/*
		function validateLocDel() {
			if (ynValue == "Y") {
				alert("계정 당 최소 하나의 기본배송지가 있어야 합니다.");
				return false;
			}
		}
		*/
		
		function deleteLocNo(e) {
			//console.log(listSize);
			//console.log(locYnCheck);
			// console.log(ynValue);
			let ynValue = $(e).attr("id");
			if (ynValue == "Y") {
				alert("계정 당 최소 하나의 기본배송지가 있어야 합니다.");
				$(e).removeAttr("data-target");
				return false;
			}
			
			$("#locDelete").attr('value', $(e).val())
			 console.log($("#locDelete").val());
		}
	</script>
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
	<%@include file="../common/footer.jsp"%>


</body>

</html>