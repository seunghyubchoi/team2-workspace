<%@page import="com.kh.common.PageInfo"%>
<%@page import="com.kh.community.model.vo.Instagram"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int memNo = (int) request.getAttribute("memNo");
ArrayList<Instagram> LikeList = (ArrayList<Instagram>) request.getAttribute("LikeList");
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
.wrap{
	height: 2300px !important;
}

.list-area {
	display: flex;
	/*  justify-content: space-between; */
	flex-wrap: wrap;
}

.thumbnail {
	overflow: hidden;
	box-sizing: border-box;
	border: 1px solid white;
	width: 300px;
	margin: 14px;
	display: inline-block;
}

.thumbnailImg:hover, .heart:hover, .instaLogo:hover {
	cursor: pointer;
	opacity: 0.7
}

.thumbnailMenu {
	margin-top: 10px;
}

.heart, .instaLogo {
	width: 30px;
}

.heart {
	float: left;
}

.instaLogo {
	float: right;
}
</style>
</head>

<body>
	<%@include file="../common/menu.jsp"%>
	<%@include file="../common/leftList.jsp"%>
	<div id="content_title">
		<p>좋아요</p>
	</div>
	<div id="content">
		<%
			if (LikeList.isEmpty()) {
		%>
		<p>좋아요한 스타일이 없습니다.</p>
		<%
			} else {
		%>

		<div class="list-area">
			<%
				for (Instagram i : LikeList) {
			%>
			<!-- 썸네일 한 개-->
			<div class="thumbnail" align="center">
				<img src="<%=contextPath%><%=i.getInstaImgSrc()%>" alt=""
					class="thumbnailImg" width="300" height="330">
				<div class="thumbnailMenu">
					<input type="hidden" value="<%=i.getComNo()%>"> <img
						src="<%=contextPath%>/resources/img/heartRed.png" alt=""
						class="heart" onclick="DeleteLike(this)"> <span><%=i.getInstaId()%></span>
					<a href="https://www.instagram.com/<%=i.getInstaId()%>"
						target="_blank"><img
						src="<%=contextPath%>/resources/img/instagram.png" alt=""
						class="instaLogo"></a>
				</div>
			</div>
			<%
				}
			%>
			<%
				}
			%>

		</div>
		
		<br> <br>
<div class="paging-area" align="center">
			<%
				if (currentPage != 1) {
			%>
			<button class="btn btn-primary mb-2"
				onclick="location.href='<%=contextPath%>/likes.mp?memNo=<%=loginUser.getMemNo()%>&cpage=<%=currentPage - 1%>';">&lt;</button>
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
				onclick="location.href= '<%=contextPath%>/likes.mp?memNo=<%=loginUser.getMemNo()%>&cpage=<%=p%>';"><%=p%></button>
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
				onclick="location.href='<%=contextPath%>/likes.mp?memNo=<%=loginUser.getMemNo()%>&cpage=<%=currentPage + 1%>';">&gt;</button>
			<%
				}
			%>
		</div>

		<script>
					
					function DeleteLike(e){
                    	
						let imgurl = "<%=contextPath%>/resources/img/heartEmpty.png"
						
                    	let cNo = $(e).siblings(":input").val();
                    	//console.log(cNo);
                    	$.ajax({
                    		url:"deleteLike.mp",
                    		data: {
                    			memNo:<%=memNo%>,
                    			comNo:cNo
                    		},
                    		type:"post",
                    		success: function(result) {
                    			console.log("ajax 통신 성공!!");
                    			$(e).removeAttr("onclick");
                    			$(e).attr("onclick", "cancelDeleteLike(this)")
                    			$(e).removeAttr("src");
                    			$(e).attr("src", imgurl);
                    		},
                    		error: function() {
                    			console.log("ajax 통신 실패!!")
                    		}
                    	})
                    }
					
					
					 function cancelDeleteLike(e) {
						 let imgurl = "<%=contextPath%>
			/resources/img/heartRed.png"

				let cNo = $(e).siblings(":input").val();
				$.ajax({
					url : "insertLike.mp",
					data : {
						memNo :
		<%=memNo%>
			,
						comNo : cNo
					},
					type : "post",
					success : function(result) {
						$(e).removeAttr("onclick");
						$(e).attr("onclick", "DeleteLike(this)")
						$(e).removeAttr("src");
						$(e).attr("src", imgurl);

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