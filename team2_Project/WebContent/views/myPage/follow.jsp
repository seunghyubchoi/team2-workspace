<%@page import="com.kh.common.PageInfo"%>
<%@page import="com.kh.myPage.model.vo.Follow"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ArrayList<Follow> followList = (ArrayList<Follow>) request.getAttribute("followList");
int memNo = (int) request.getAttribute("memNo");
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

#followList p, #followingList p {
	font-size: 1.5em;
	font-weight: 700;
	padding: 50px;
}

#followTable, #followingTable {
	width: 60%;
	height: 100%;
	text-align: left;
	margin: auto;
	font-size: 1.2em;
}

#followTable td, #followingTable td {
	padding: 8px;
}

#followTable td:nth-child(2), #followingTable td:nth-child(2) {
	text-align: right;
	font-weight: 700;
}
</style>
</head>

<body>
	<%@include file="../common/menu.jsp"%>
	<%@include file="../common/leftList.jsp"%>

	<div id="content_title">
		<p>팔로잉/팔로워</p>
	</div>
	<div id="content">
		<div id="btnBox">
			<div class="btn btn-primary mb-2 active" id="followBtn">팔로워</div>
			<div class="btn btn-primary mb-2" id="follwingBtn"
				onclick="selectFollowingList();">팔로잉</div>
		</div>


		<div id="followList">
			<%
				if (followList.isEmpty()) {
			%>
			<p id="noList">팔로우하는 회원이 없습니다</p>
			<%
				} else {
			%>
			<table id="followTable">
				<tbody id="followTableBody">
					<%
						for (Follow f : followList) {
					%>
					<tr>
						<td><%=f.getFollowerId()%></td>
						<td><button type="button" class="btn btn-primary mb-2"
								value="<%=f.getFollowerId()%>" data-toggle="modal"
								data-target="#deleteFollower" onclick="deleteAlert(this);">삭제</button></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
			<%@include file="../common/pageIndex.jsp"%>
			<%
				}
			%>
		</div>

		<script>
		function selectFollowingList() {
			location.href = "<%=contextPath%>/followingList.mp?memNo=<%=loginUser.getMemNo()%>&cpage=1";
			}

			function deleteAlert(e) {
				//console.log($(e).val());
				$("#followerId").val($(e).val());
				//console.log($("#followerId").attr("name"));
				$("#targetId").text($(e).val());
			}

			$(function() {
				$("#deleteFollowerBtn").on(
						"click",
						function() {
							let queryString = $("form[name=deleteFollower]").serialize();
							console.log(queryString);
							$.ajax({
								url : "deleteFollower.mp",
								data : queryString,
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


	</div>
	<br> <br>
<div class="paging-area" align="center">
			<%
				if (currentPage != 1) {
			%>
			<button class="btn btn-primary mb-2"
				onclick="location.href='<%=contextPath%>/follow.mp?memNo=<%=loginUser.getMemNo()%>&cpage=<%=currentPage - 1%>';">&lt;</button>
			<%
				}
			%>
			<%
				for (int p = startPage; p <= endPage; p++) {
			%>
			<%
				if (p == currentPage) {
			%>
			<button class="btn btn-primary mb-2" style="background: pink" disabled><%=p%></button>
			<%
				} else {
			%>
			<button class="btn btn-primary mb-2"
				onclick="location.href= '<%=contextPath%>/follow.mp?memNo=<%=loginUser.getMemNo()%>&cpage=<%=p%>';"><%=p%></button>
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
				onclick="location.href='<%=contextPath%>/follow.mp?memNo=<%=loginUser.getMemNo()%>&cpage=<%=currentPage + 1%>';">&gt;</button>
			<%
				}
			%>
		</div>

	<!-- 팔로워 삭제 -->
	<div class="modal" id="deleteFollower">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">팔로워 삭제</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<!-- Modal body -->
				<div class="modal-body" align="center">
					<form name="deleteFollower">
						<input type="hidden" name="memNo" id="memNo" value="<%=memNo%>">
						<input type="hidden" name="followerId" value="" id="followerId">
						<b><span id="targetId"></span>님을 정말로 삭제하시겠습니까?<br>
							<div class="btn btn-sm btn-danger" id="deleteFollowerBtn">삭제</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>

</html>