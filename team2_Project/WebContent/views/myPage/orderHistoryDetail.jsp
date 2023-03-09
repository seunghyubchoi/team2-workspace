<%@page import="com.kh.common.PageInfo"%>
<%@page import="com.kh.payment.model.vo.OrderDtlA"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int memNo = (int) request.getAttribute("memNo");
ArrayList<OrderDtlA> orderHistoryDetail = (ArrayList<OrderDtlA>) request.getAttribute("orderHistoryDetail");

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
	text-align: left;
	font-weight: 700;
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
	

		<div id="orderList">
			
			<table id="orderTable">
				<tbody id="orderTableBody">
			<%
				for (OrderDtlA o : orderHistoryDetail) {
			%>
					
					<tr>
						<td>
                            <img src="<%=contextPath%><%=o.getFilePath()%><%=o.getChangeName() %>"
							alt="">
                        </td>
						<td>
							상품명 : <%=o.getProductNo() %> <br>
							수량 : <%=o.getDtlQnt() %> <br>
							옵션 : <%=o.getDtlSize() %>
						</td>
						<td>
							
						</td>
					</tr>
					
					<tr>
						<td>
                            주문번호
                        </td>
						<td>
							<%=o.getOrderNo() %>
						</td>
						<td>
							
						</td>
					</tr>
                    
                    <tr>
						<td>
                            주문일
                        </td>
						<td>
							<%=o.getOrderDate() %>
						</td>
						<td>
							
						</td>
					</tr>
                    <tr>
						<td>
                           	주문자 정보
                        </td>
						<td>
							<%=o.getRcpName() %>
							<br>
							<%=o.getRcpPhone() %>
						</td>
						<td>
							
						</td>
					</tr>
                    <tr>
						<td>
                            배송지 정보
                        </td>
						<td>
							<%=o.getRcpAddress() %> <br>
							<%=o.getRcpAddressDtl() %> <br>
							<%=o.getRcpPostCode() %>
						</td>
						<td>
							
						</td>
					</tr>
                    
					
					<%} %>
				</tbody>
			</table>


			



		
		</div>



	</div>

	

	<%@include file="../common/footer.jsp"%>


	

</body>
</html>