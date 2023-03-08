<%@page import="com.kh.common.PageInfo"%>
<%@page import="com.kh.payment.model.vo.OrderDtlA"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int memNo = (int) request.getAttribute("memNo");
ArrayList<OrderDtlA> orderHistoryList = (ArrayList<OrderDtlA>) request.getAttribute("orderHistoryList");
PageInfo pi = (PageInfo) request.getAttribute("pi");
int currentPage = pi.getCurrentPage();
int startPage = pi.getStartPage();
int endPage = pi.getEndPage();
int maxPage = pi.getMaxPage();
%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
#btnBox {
	width: 100%;
	display: flex;
	padding-bottom: 30px;
}

#btnBox div {
	width: 50%;
}

#orderList p {
	font-size: 1.5em;
	font-weight: 700;
	padding: 50px;
}

#orderTable {
	width: 100%;
	height: 100%;
	text-align: left;
	margin: auto;
	font-size: 1.2em;
}

#orderTable td {
	padding: 8px;
	border-top: 1px lightgrey solid;
	border-bottom: 1px lightgrey solid;
}

#orderTableBody td:nth-child(1) {
	width: 25%;
	text-align: center;
}

#orderTableBody td:nth-child(2) p {
	font-size: 0.9em;
	padding: 2px;
}

#orderTableBody td:nth-child(2) {
	width: 60%;
}

#orderTableBody td:nth-child(3) {
	width: 15%;
	text-align: right;
}

#orderTableBody td:nth-child(3) button {
	width: 85%;
}

#orderTableBody img {
	object-fit: cover;
	width: 250px;
	height: 300px;
}

#cancelNotice {
	font-size: 1.2em;
	text-align: center;
	font-weight: 700;
	padding: 30px;
}

#returnBtn{
	margin-left: 400px;
}
</style>
</head>


<body>
	<%@include file="../common/menu.jsp"%>
	<%@include file="../common/leftList.jsp"%>
	<div id="content_title">
		<p>주문내역</p>
	</div>
	<div id="content">
		<div id="btnBox">
			<div class="btn btn-primary mb-2 active" id="historyAllBtn">전체</div>
			<div class="btn btn-primary mb-2" id="historyCancelBtn"
				onclick="orderHistoryCancelList();">교환/반품/취소</div>
		</div>

		<div id="orderList">

			<%
				if (orderHistoryList.isEmpty()) {
			%>

			<table id="orderTable">
				<tbody id="orderTableBody">
					<tr>
						<td><p id="noList">주문내역이 없습니다</p></td>
					</tr>
				</tbody>
			</table>

			<%
				} else {
			%>
			
			<table id="orderTable">
				<tbody id="orderTableBody">
			
			<%
				for (OrderDtlA o : orderHistoryList) {
			%>

			
					<tr>
						<td><img src="<%=contextPath%><%=o.getFilePath()%>"
							alt=""></td>
						<td>
							<p>
								주문번호 :
								<%=o.getDtlOrderNo()%></p>
							<p>
								상품이름 :
								<%=o.getProductNo()%></p>
							<p>
								옵션 :
								<%=o.getDtlSize()%></p>
							<p>
								주문상태 :
								<%=o.getOrderStatus()%></p>
								<% String status = o.getOrderStatus(); %>
						</td>
						<td>
							<button class="btn btn-primary mb-2" value="<%=o.getOrderNo()%>" onclick="orderHistoryDetail(this);">상세내역</button>
							<%if(status.equals("상품준비중")) { %>
							<input type="hidden" >
							<button class="btn btn-primary mb-2" value="<%=o.getDtlOrderNo()%>" id="<%=o.getProductNo() %>" 
							data-toggle="modal" data-target="#cancelOrder" onclick="deleteAlert(this)">주문취소</button>
							<%} else if(status.equals("취소완료") || status.equals("교환완료") || status.equals("환불완료")){%>
							
							<%} else {%>
							<button class="btn btn-primary mb-2" value="<%=o.getDtlOrderNo()%>"
							data-toggle="modal" data-target="#return" onclick="returnAlert(this)">교환/환불</button>
							<%} %>
						</td>
					</tr>
					<%
						}
					%>


				</tbody>
			</table>


			<br> <br>
			<div class="paging-area" align="center">
				<%
					if (currentPage != 1) {
				%>
				<button class="btn btn-primary mb-2"
					onclick="location.href='<%=contextPath%>/orderHistory.mp?memNo=<%=loginUser.getMemNo()%>&cpage=<%=currentPage - 1%>';">&lt;</button>
				<%
					}
				%>
				<%
					for (int p = startPage; p <= endPage; p++) {
				%>
				<%
					if (p == currentPage) {
				%>
				<button class="btn btn-primary mb-2" style="background: pink"
					disabled><%=p%></button>
				<%
					} else {
				%>
				<button class="btn btn-primary mb-2"
					onclick="location.href= '<%=contextPath%>/orderHistory.mp?memNo=<%=loginUser.getMemNo()%>&cpage=<%=p%>';"><%=p%></button>
				<%
					}
				%>
				<%
					}
				%>
				<%
					if (currentPage != maxPage) {
				%>
				<button class="btn btn-primary mb-2"
					onclick="location.href='<%=contextPath%>/orderHistory.mp?memNo=<%=loginUser.getMemNo()%>&cpage=<%=currentPage + 1%>';">&gt;</button>
				<%
					}
				%>
			</div>



		<%
			}
		%>
		</div>



	</div>

	<!-- 주문 취소 모달 -->
	<div class="modal" id="cancelOrder">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">주문 취소</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<!-- Modal body -->
				<div class="modal-body" align="center">
					<form name="deleteFollower">
						<input type="hidden" name="" value="">
						<span id="targetProduct"></span><br>주문을 정말로 삭제하시겠습니까?<br>
						<p></p>
						<div class="btn btn-sm btn-danger" value="" id="cancelOrderBtn">삭제</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 교환/환불 모달 -->
	<div class="modal" id="return">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">교환 및 환불</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<!-- Modal body -->
				<div class="modal-body" align="left">
					<form action="<%=contextPath%>/returnOrder.mp" method="post">
						<input type="hidden" name="memNo" value="<%=memNo%>">
						<input type="hidden" name="dtlOrderNo" value="">
						<label><input type="radio" name="returnStatus" value="exchange" checked>교환</label>
						<br>
						<label><input type="radio" name="returnStatus" value="return">반품</label>
						<br>
						<br>
						사유:
						<input type="text"  class="form-control mb-2 mr-sm-2"  name="returnReason" placeholder="사유를 입력해주세요." required>
						<button type="submit" class="btn btn-sm btn-secondary" id="returnBtn">신청</button>
						
					</form>
				</div>
			</div>
		</div>
	</div>

	<script>
		function orderHistoryDetail(e) {
			let orderNo = $(e).val();
			location.href = "<%=contextPath%>/orderHistoryDetail.mp?memNo=<%=loginUser.getMemNo()%>&orderNo=" + orderNo;
		}

		function orderHistoryCancelList() {
			location.href = "<%=contextPath%>/orderHistoryCancel.mp?memNo=<%=loginUser.getMemNo()%>&cpage=1";
			}

			function deleteAlert(e) {
				
				let productName = $(e).attr("id");
				$("#cancelOrderBtn").val($(e).val());
				console.log(productName);
				console.log($("#cancelOrderBtn").val());
				$("#targetProduct").text(productName);
			}

			
			function returnAlert(e) {
				/* 마저해야함  */
				$("input[name='dtlOrderNo']").val($(e).val())
				
				console.log($("input[name='dtlOrderNo']").val());
				
			}

			$(function() {
				$("#cancelOrderBtn").on("click",function() {
					let orderNo = $("#cancelOrderBtn").val();
					console.log(orderNo);
							$.ajax({
								url : "cancelOrder.mp",
								data : {
									orderNo: orderNo
									},
								type : "post",
								success : function(result) {
									location.reload();
								},
								error : function() {
									console.log("ajax 통신 실패!!")

								}
							})
						})

			})
		</script>


	<%@include file="../common/footer.jsp"%>


	

</body>
</html>