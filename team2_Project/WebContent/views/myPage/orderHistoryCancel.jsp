<%@page import="com.kh.common.PageInfo"%>
<%@page import="com.kh.payment.model.vo.OrderDtlA"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int memNo = (int) request.getAttribute("memNo");
ArrayList<OrderDtlA> orderHistoryCancelList = (ArrayList<OrderDtlA>) request.getAttribute("orderHistoryCancelList");
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
			<div class="btn btn-primary mb-2" id="historyAllBtn" onclick="selectOrderHistoryList();">전체</div>
			<div class="btn btn-primary mb-2 active" id="historyCancelBtn"
				>교환/반품/취소</div>
		</div>

		<div id="orderList">

			<%
				if (orderHistoryCancelList.isEmpty()) {
			%>

			<table id="orderTable">
				<tbody id="orderTableBody">
					<tr>
						<td><p id="noList">교환/반품/취소 내역이 없습니다</p></td>
					</tr>
				</tbody>
			</table>

			<%
				} else {
			%>
			<%
				for (OrderDtlA o : orderHistoryCancelList) {
			%>

			<table id="orderTable">
				<tbody id="orderTableBody">

					<tr>
						<td><img src="<%=contextPath%><%=o.getProductImgSrc()%>"
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
								배송상태 :
								<%=o.getOrderStatus()%></p>
								<% String status = o.getOrderStatus(); %>
						</td>
						<td>
							
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
					onclick="location.href='<%=contextPath%>/orderHistoryCancel.mp?memNo=<%=loginUser.getMemNo()%>&cpage=<%=currentPage - 1%>';">&lt;</button>
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
					onclick="location.href= '<%=contextPath%>/orderHistoryCancel.mp?memNo=<%=loginUser.getMemNo()%>&cpage=<%=p%>';"><%=p%></button>
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
					onclick="location.href='<%=contextPath%>/orderHistoryCancel.mp?memNo=<%=loginUser.getMemNo()%>&cpage=<%=currentPage + 1%>';">&gt;</button>
				<%
					}
				%>
			</div>



		<%
			}
		%>
		</div>



	</div>

	<script>
		function selectOrderHistoryList() {
			location.href = "<%=contextPath%>/orderHistory.mp?memNo=<%=loginUser.getMemNo()%>&cpage=1";
			}
	</script>


	<%@include file="../common/footer.jsp"%>


	

</body>
</html>