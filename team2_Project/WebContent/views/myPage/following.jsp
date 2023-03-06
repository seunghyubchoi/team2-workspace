<%@page import="com.kh.common.PageInfo"%>
<%@page import="com.kh.myPage.model.vo.Follow"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ArrayList<Follow> follwingList = (ArrayList<Follow>) request.getAttribute("follwingList");
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
			<div class="btn btn-primary mb-2 " id="followBtn"
				onclick="selectFollowerList();">팔로워</div>
			<div class="btn btn-primary mb-2 active" id="follwingBtn">팔로잉</div>
		</div>
		<div id="followingList">
			<%
				if (follwingList.isEmpty()) {
			%>
			<p id="noList">팔로잉하는 회원이 없습니다</p>
			<%
				} else {
			%>
			<table id="followingTable">
				<tbody id="followingTableBody">
					<%
						for (Follow f : follwingList) {
					%>
					<tr>
						<td><%=f.getFollowerId()%></td>
						<td><button type="button" class="btn btn-primary mb-2"
								value="<%=f.getFollowerId()%>" id="addDelFollowingBtn"
								onclick="addDelFollowingBtn(this);">팔로잉</button></td>
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
				onclick="location.href='<%=contextPath%>/followingList.mp?memNo=<%=loginUser.getMemNo()%>&cpage=<%=currentPage - 1%>';">&lt;</button>
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
				onclick="location.href= '<%=contextPath%>/followingList.mp?memNo=<%=loginUser.getMemNo()%>&cpage=<%=p%>';"><%=p%></button>
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
				onclick="location.href='<%=contextPath%>/followingList.mp?memNo=<%=loginUser.getMemNo()%>&cpage=<%=currentPage + 1%>';">&gt;</button>
			<%
				}
			%>
		</div>


			<%
				}
			%>
		</div>
		










		
		<script>
			

			function selectFollowerList() {
					location.href = "<%=contextPath%>/follow.mp?memNo=<%=loginUser.getMemNo()%>&cpage=1";
			}
			

			function addDelFollowingBtn(e) {
				//console.log($(e).val());
				let id = $(e).val();
				console.log(id);
				$.ajax({
					url : "deleteFollowing.mp",
					data : {
						memNo :<%=memNo%>,
						followingId : id
					},
					type : "post",
					success : function(result) {
						console.log("ajax 성공")
						$(e).removeAttr("onclick");
						$(e).attr("onclick", "cancelDeleteFollowing(this)")
						$(e).css("background-color", "white");
						$(e).css("color", "#e2bbe7");

					},
					error : function() {
						console.log("ajax 통신 실패!!")
					}
				})
			}

			function cancelDeleteFollowing(e) {
				let id = $(e).val();
				console.log(id);
				$.ajax({
					url : "cancelDeleteFollowing.mp",
					data : {
						memNo :<%=memNo%>,
						followingId : id
					},
					type : "post",
					success : function(result) {
						console.log("ajax 성공")
						$(e).removeAttr("onclick");
						$(e).attr("onclick", "addDelFollowingBtn(this)")
						$(e).css("background-color", "#e2bbe7");
						$(e).css("color", "white");

					},
					error : function() {
						console.log("ajax 통신 실패!!")
					}
				})
			}
		</script>
	</div>
	<%@include file="../common/footer.jsp"%>


</body>

</html>