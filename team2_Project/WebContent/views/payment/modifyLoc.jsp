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
	<%=locNo %>
	<div id="content_title">
		<p>배송지 수정</p>
	</div>
	<div id="content">
		<form action="<%=contextPath%>/update.lo" method="post" id="updateLocationForm">
		<input type="hidden" name="locNo" value="<%=locNo%>">
		<input type="hidden" name="locYn">
		
		<input type="hidden" name="memNo" value="<%=memNo%>">
			<table id="content_table">
				<tr>
					<th>배송지명</th>
					<td><input type="text" class="form-control mb-2 mr-sm-2"
						value="<%=locAddressName%>" name="locAddressName"></td>
				</tr>
				<tr>
					<th>수령자 이름</th>

					<td><input type="text" class="form-control mb-2 mr-sm-2"
						value="<%=locName%>" name="locName"></td>
				<tr>
					<th>주소</th>
					<td><input type="text" class="form-control mb-2 mr-sm-2"
						value="<%=locAddress%>" name="locAddress"></td>

				</tr>
				<tr>
					<th>상세주소</th>
					<td><input type="text" class="form-control mb-2 mr-sm-2"
						value="<%=locAddressDtl%>" name="locAddressDtl"></td>
				</tr>
				<tr>
					<th>우편번호</th>
					<td><input type="text" class="form-control mb-2 mr-sm-2"
						value="<%=locPostCode%>" name="locPostCode"></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><input type="text" class="form-control mb-2 mr-sm-2"
						value="<%=locPhone%>" name="locPhone"></td>
				</tr>

		
		
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
							onclick="history.back();">뒤로가기</button>
						<button type="submit" class="btn btn-primary mb-2">저장하기</button></td>

				</tr>
			</table>
			<script>
			
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