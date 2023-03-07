<%@page import="com.kh.common.PageInfo"%>
<%@page import="com.kh.myPage.model.vo.MileageHistory"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ArrayList<MileageHistory> list = (ArrayList<MileageHistory>) request.getAttribute("list");
PageInfo pi = (PageInfo) request.getAttribute("pi");
int currentPage = pi.getCurrentPage();
int startPage = pi.getStartPage();
int endPage = pi.getEndPage();
int maxPage = pi.getMaxPage();
int sum = 0;
for (MileageHistory m : list) {
	if (m.getMileageHistory().equals("사용")) {
		sum -= m.getMileage();
	} else {
		sum += m.getMileage();
	}
}
%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>



<style>
li {
	width: none;
}

.content_subTitle {
	text-align: left;
	font-weight: 900;
	font-size: 1.6em;
	margin-bottom: 60px;
}

#mileageBox {
	border: 1px #cb7cdd solid;
	width: 80%;
	height: 200px;
	border-radius: 30px;
	margin: 0 auto;
	box-shadow: 0 0 4px;
	margin-bottom: 60px
}

#mileageBox p {
	text-align: center;
	margin: auto;
	padding-top: 33px;
	font-size: 1.2em;
}

#mileageBox span {
	font-size: 1.7em;
	font-weight: 700;
	color: #cb7cdd;
}

#mileageTable {
	width: 80%;
	/*  height: 100%; */
	text-align: left;
	margin: auto;
	font-size: 1.2em;
}

#mileageTable li {
	padding: 5px;
}

#mileageTable td:nth-child(2) {
	text-align: right;
	color: #cb7cdd;
	font-weight: 700;
}
</style>

</head>

<body>
	<%@include file="../common/menu.jsp"%>
	<%@include file="../common/leftList.jsp"%>
	<div id="content_title">
		<p>적립금내역</p>

	</div>
	<div id="content">
		<p class="content_subTitle">보유 포인트</p>
		<div id="mileageBox">
			<p>
				보유하고 계신 포인트는<br> <span> <%=sum%>P
				</span> <br> 입니다.
			</p>
		</div>
		<p class="content_subTitle">포인트 내역</p>
		<table id="mileageTable">
			<%
				if (list.isEmpty()) {
			%>
			<tr>
				<td align="center">
					<p>포인트 내역이 없습니다</p>
				</td>
			</tr>
			<%
				} else {
			%>
			<%
				for (MileageHistory m : list) {
			%>
			<tr>
				<td>
					<p><%=m.getMileageHistory()%>
						:
						<%=m.getProductNo()%></p>
				</td>
				<td>
					<p>
						<%
							if (m.getMileageHistory().equals("사용")) {
						%>
						-
						<%
							} else {
						%>
						+<%
							}
						%><%=m.getMileage()%>
					</p>
				</td>
			</tr>
			<%
				}
			%>

			<tr>
				<td>



					<div class="paging-area" align="center">
						<%
							if (currentPage != 1) {
						%>
						<button class="btn btn-primary mb-2"
							onclick="location.href='<%=contextPath%>/mileageHistory.mp?memNo=<%=loginUser.getMemNo()%>&cpage=<%=currentPage - 1%>';">&lt;</button>
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
							onclick="location.href= '<%=contextPath%>/mileageHistory.mp?memNo=<%=loginUser.getMemNo()%>&cpage=<%=p%>';"><%=p%></button>
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
							onclick="location.href='<%=contextPath%>/mileageHistory.mp?memNo=<%=loginUser.getMemNo()%>&cpage=<%=currentPage + 1%>';">&gt;</button>
						<%
							}
						%>
					</div>




				</td>
			</tr>

			<%
				}
			%>


		</table>



	</div>


	<br>
	<br>






	<%@include file="../common/footer.jsp"%>


</body>

</html>