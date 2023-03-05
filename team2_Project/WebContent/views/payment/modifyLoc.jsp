<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.payment.model.vo.Location"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>



</head>

<body>
	<%@include file="../common/menu.jsp"%>
	<%@include file="../common/leftList.jsp"%>
	<%
	ArrayList<Location> list = (ArrayList<Location>)session.getAttribute("list");
	Location location = (Location) request.getAttribute("location");
	int memNo = loginUser.getMemNo();
	int locNo = location.getLocNo();
	String locName = location.getLocName();
	String locAddress = location.getLocAddress();
	String locAddressName = location.getLocAddressName();
	String locAddressDtl = location.getLocAddressDtl();
	String locPhone = location.getLocPhone();
	String locPostCode = location.getLocPostCode();
	String locYn = location.getLocYn();
	%>
	<%=locYn %>
	<div id="content_title">
		<p>배송지 수정</p>
	</div>
	<div id="content">
		<form action="<%=contextPath%>/update.lo" method="post"
			id="updateLocationForm" onsubmit="return validateDefault();">
			<input type="hidden" name="locNo" value="<%=locNo%>"> <input
				type="hidden" name="locYn" value="<%=locYn%>"> <input
				type="hidden" name="memNo" value="<%=memNo%>">
			<table id="content_table">
				<tr>
					<th>배송지 이름</th>
					<td><input type="text" class="form-control mb-2 mr-sm-2"
						value="<%=locAddressName%>" name="locAddressName" required></td>
				</tr>


				<tr>
					<th>수령자 이름</th>

					<td><input type="text" class="form-control mb-2 mr-sm-2"
						value="<%=locName%>" name="locName" required></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><input type="text" class="form-control mb-2 mr-sm-2"
						value="<%=locPhone%>" name="locPhone" required></td>
				</tr>

				<tr>
					
				</tr>
				<tr>
					<th></th>
					
				</tr>
				<tr>
				<th>우편번호</th>
					<td><input type="text" class="form-control" placeholder="우편번호"
								name="locPostCode" id="sample6_postcode" value="<%=locPostCode%>" required readonly></td>
				</tr>
				
				
				
				<tr>
				<th>주소</th>
					<td><input type="text" class="form-control mb-2 mr-sm-2"
						id="sample6_address" value="<%=locAddress%>" name="locAddress" placeholder="주소"
						required readonly></td>
				</tr>
				<tr>
				<th>주소</th>
					<td><input type="text" class="form-control mb-2 mr-sm-2"
						id="sample6_extraAddress" placeholder="주소2" required readonly></td>
				</tr>

				<tr>
				<th>주소</th>
					<td><input type="text" class="form-control mb-2 mr-sm-2"
						id="sample6_detailAddress" value="<%=locAddressDtl%>" name="locAddressDtl"
						placeholder="상세주소를 입력해주세요" required></td>
						
					<td>
						
							
							
								<button class="btn btn-primary mb-2" type="button"
									onclick="sample6_execDaumPostcode()">우편번호 검색</button>
							
						
					</td>
				</tr>

				<!--  
				<tr>
					<th>주소</th>
					<td><input type="text" class="form-control mb-2 mr-sm-2"
						value="<%=locAddress%>" name="locAddress" required></td>

				</tr>
				<tr>
					<th>상세주소</th>
					<td><input type="text" class="form-control mb-2 mr-sm-2"
						value="<%=locAddressDtl%>" name="locAddressDtl" required></td>
				</tr>
				<tr>
					<th>우편번호</th>
					<td><input type="text" class="form-control mb-2 mr-sm-2"
						value="<%=locPostCode%>" name="locPostCode" required></td>
				</tr>
				
				-->


				<tr>
					<th><label for="defaultLoc">기본 배송지로 지정</label></th>
					<td><input type="checkbox" name="locYnCheck"></td>

				</tr>


				<tr style="visibility: hidden;">
					<th>현재 배송지</th>

					<td></td>

					<td>
						<button type="button" id="btn_newLoc" class="btn btn-primary mb-2">
							<!-- onclick="return validateLoc();" -->
							새로운 배송지
						</button>
						<button type="button" id="btn_locList"
							class="btn btn-primary mb-2">배송지 목록</button>
					</td>
				</tr>



				<tr>
					<td></td>

					<td><button type="button" class="btn btn-primary mb-2"
							onclick="backToMyPage();">뒤로가기</button>
						<button type="submit" class="btn btn-primary mb-2"
							id="<%=locYn%>">저장하기</button></td>

				</tr>
			</table>
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
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			let listSize = <%=list.size()%>
			function validateDefault() {
				if($("input[name='locYn']").val() == "Y") {
					if(!$('input[name="locYnCheck"]').is(":checked")){
						alert("계정 당 최소 하나의 기본배송지가 있어야 합니다.")
						$('input[name="locYnCheck"]').prop("checked",true)
						return false;
					}
					
				} 
			}
			$(function () {
				
				
				
				
				$('#updateLocationForm').submit(function() {
					if ($('input[name="locYnCheck"]').is(":checked")) {
					    $('input[name="locYn"]').val('Y');
					} else {
					    $('input[name="locYn"]').val('N');
					}
				
						
				});
				
				
				// 기본배송지면 체크박스 체크로 보이는 것(현재 사용 안 함)
				const defaultLoc = "<%=locYn%>";
					
					$("input[type=checkbox]").each(function() {
						if (defaultLoc == "Y") {
							$(this).attr("checked", true);
						}
					})
					
					
					
					
				})
			</script>

		</form>
	</div>
	


	<%@include file="../common/footer.jsp"%>


</body>

</html>