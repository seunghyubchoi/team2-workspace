<%@page import="com.kh.common.PageInfo"%>
<%@page import="com.kh.myPage.model.vo.Follow"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ArrayList<Follow> followList = (ArrayList<Follow>) request.getAttribute("followList");
int memNo = (int) request.getAttribute("memNo");
PageInfo pi = (PageInfo) request.getAttribute("pi");
int currentPage = 0;
int startPage = 0;
int endPage = 0;
int maxPage = 0;
int currentPage2 = 0;
int startPage2 = 0;
int endPage2 = 0;
int maxPage2 = 0;
if (pi != null) {
	pi = (PageInfo) request.getAttribute("pi");
	currentPage = pi.getCurrentPage();
	startPage = pi.getStartPage();
	endPage = pi.getEndPage();
	maxPage = pi.getMaxPage();

}
PageInfo pi2 = (PageInfo) request.getAttribute("pi2");
if (pi2 != null) {
	pi2 = (PageInfo) request.getAttribute("pi2");
	currentPage2 = pi2.getCurrentPage();
	startPage2 = pi2.getStartPage();
	endPage2 = pi2.getEndPage();
	maxPage2 = pi2.getMaxPage();
} //페이징 처리를 하기 위해 자주 사용할 변수 미리 선언
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
	<%= currentPage2%>
	<%= startPage2%>
	<%= endPage2%>
	<%= maxPage2%>
	<div id="content_title">
		<p>팔로잉/팔로워</p>
		<img src="../../resources/img/heartEmpty.png" alt="">
	</div>
	<div id="content">
		<div id="btnBox">
			<div class="btn btn-primary mb-2 active" id="followBtn"
				onclick="selectFollowerList();">팔로워</div>
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
			<br> <br>
			<div class="paging-area" align="center">
				<%
					if (currentPage != 1) {
				%>
				<button
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
				<button style="background: pink" disabled><%=p%></button>
				<%
					} else {
				%>
				<button
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
				<button
					onclick="location.href='<%=contextPath%>/follow.mp?memNo=<%=loginUser.getMemNo()%>&cpage=<%=currentPage + 1%>';">&gt;</button>
				<%
					}
				%>
			</div>





			<%
				}
			%>
		</div>
		<div id="followingList">
			<p id="noList2"></p>
			<table id="followingTable">
				<tbody id="followingTableBody">

				</tbody>
			</table>
			<br> <br>
			<div class="paging-area" align="center">
			<%
					if (currentPage2 != 1) {
				%>
				<button
					onclick="location.href='<%=contextPath%>/follow.mp?memNo=<%=loginUser.getMemNo()%>&cpage=<%=currentPage2 - 1%>';">&lt;</button>
				<%
					}
				%>
				<%
					for (int p = startPage2; p <= endPage2; p++) {
				%>
				<%
					if (p == currentPage2) {
				%>
				<button style="background: pink" disabled><%=p%></button>
				<%
					} else {
				%>
				<button
					onclick="location.href= '<%=contextPath%>/follow.mp?memNo=<%=loginUser.getMemNo()%>&cpage=<%=p%>';"><%=p%></button>
				<%
					}
				%>
				<%
					}
				%>
				<%
					if (currentPage2 != maxPage2) {
				%>
				<button
					onclick="location.href='<%=contextPath%>/follow.mp?memNo=<%=loginUser.getMemNo()%>&cpage=<%=currentPage2 + 1%>';">&gt;</button>
				<%
					}
				%>
			</div>
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

		<script>
			
			$(document).ready(function() {
			    $('#followingList').css('display', 'none');
			});
			
                        function selectFollowingList() {
                        	$.ajax({
                        		url:"followingList.mp",
                        		data: {
                        			memNo:<%=memNo%>,
                        			cpage:1

                        		},
                        		type:"post",
                        		success:function(result){
                        			console.log("ajax 통신 성공!!")
                        			
                        			
                        			if(result.length == 0) {
                        				console.log("result 결과 없음")
                        				
                        				$("#followList").hide();
                            			$("#followingList").show();
                            			$("#followBtn").css("background-color","#C7A9CC");
                            			$("#follwingBtn").css("background-color","#9a77a1");
                            			
                            			$("#followBtn").hover(function(){
                            					$(this).css('background-color','#9a77a1');  
                            					},function(){
                            				    $(this).css('background-color','#C7A9CC');
                            				    })
                            			
                            			$("#follwingBtn").hover(function(){
                            					$(this).css('background-color','#9a77a1');  
                            					},function(){
                            				    $(this).css('background-color','#9a77a1');
                            				    })
                            				    
                            				    $("#noList2").text("팔로잉하는 회원이 없습니다");
                        				
                        			} else {
                        				console.log("result 결과 있음")
                        				
                        				$("#followList").hide();
                            			$("#noList2").hide();
                            			$("#followingList").show();
                            			$("#followBtn").css("background-color","#C7A9CC");
                            			$("#follwingBtn").css("background-color","#9a77a1");
                            			
                            			$("#followBtn").hover(function(){
                            					$(this).css('background-color','#9a77a1');  
                            					},function(){
                            				    $(this).css('background-color','#C7A9CC');
                            				    })
                            			
                            			$("#follwingBtn").hover(function(){
                            					$(this).css('background-color','#9a77a1');  
                            					},function(){
                            				    $(this).css('background-color','#9a77a1');
                            				    })
                            			
                            			
                            			
                            			
                            			let value = "";
                            			for(let i = 0; i < result.length; i++) {
                    						value += "<tr>"
                								+ "<td>" + result[i].followerId + "</td>"
                								+ "<td>" + "<button type='button' class='btn btn-primary mb-2' id='addDelFollowingBtn' onclick='addDelFollowingBtn(this);' value='" + result[i].followerId + "'>팔로잉</button>" + "</td>"
                								+ "</tr>"
                    					}
                            			$("#followingTableBody").html(value);
                        			}
                        			}
                        			
                        		,
                        		error: function() {
                        			console.log("ajax 통신 실패!!")
                        		}
                        	})
                        }
                        
                       
                        function selectFollowerList(){
                        	$.ajax({
                        		url:"followerList.mp",
                        		data: {memNo:<%=memNo%>,
                        			cpage:1	
                        		},
                        		type:"post",
                        		success:function(result){
                        			
                        			$("#followingList").hide();
                        			$("#followList").show();
                        			$("#followBtn").css("background-color","#9a77a1");
                        			$("#follwingBtn").css("background-color","#C7A9CC");
                        			
                        			$("#follwingBtn").hover(function(){
                        					$(this).css('background-color','#9a77a1');  
                        					},function(){
                        				    $(this).css('background-color','#C7A9CC');
                        				   	})
                        			
                        				$("#followBtn").hover(function(){
                        					$(this).css('background-color','#9a77a1');  
                        					},function(){
                        				    $(this).css('background-color','#9a77a1');
                        				  	})
                        			
                        			
                        			let value = "";
                        			
                        			for(let i = 0; i < result.length; i++) {
                						value += "<tr>"
            								+ "<td>" + result[i].followerId + "</td>"
            								+ "<td>" 
            								+ "<button type='button' class='btn btn-primary mb-2'  data-toggle='modal' data-target='#deleteFollower' onclick='deleteAlert(this);' value='" 
            								+ result[i].followerId + "'>삭제</button>" 
                        					+ "</td>"
            								+ "</tr>"
                					}
                        			
                        				
                        				
                        			$("#followTableBody").html(value);
                        		},
                        		error:function(){
                        			console.log("ajax 통신 실패!!")
                        		}
                        	})
                        }                        
                        function deleteAlert(e){
                        	//console.log($(e).val());
                        	$("#followerId").val($(e).val());
                        	//console.log($("#followerId").attr("name"));
                        	$("#targetId").text($(e).val());
                        }
                        
                        $(function(){
                        	$("#deleteFollowerBtn").on("click", function(){
                        		let queryString = $("form[name=deleteFollower]").serialize();
                        		console.log(queryString);
                        		$.ajax({
                            		url:"deleteFollower.mp",
                            		data: queryString,
                            		type: "post",
                            		success: function(result) {
                            			location.reload();
                            		},
                            		error: function() {
                            			console.log("ajax 통신 실패!!")

                            		}
                            	})
                        	})
                        	
                        })
                        
                        function addDelFollowingBtn(e){
                        	//console.log($(e).val());
                        	let id = $(e).val();
                        	console.log(id);
                        	$.ajax({
                        		url:"deleteFollowing.mp",
                        		data: {
                        			memNo:<%=memNo%>,
                        			followingId:id
                        		},
                        		type:"post",
                        		success: function(result) {
                        			$(e).removeAttr("onclick");
                        			$(e).attr("onclick", "cancelDeleteFollowing(this)")
                        			$(e).css("background-color","white");
                        			$(e).css("color","#9a77a1");
                        			
                   
                        		},
                        		error: function() {
                        			console.log("ajax 통신 실패!!")
                        		}
                        	})
                        }
                        
                        function cancelDeleteFollowing(e) {
                        	let id = $(e).val();
                        	console.log(id);
                        	$.ajax({
                        		url:"cancelDeleteFollowing.mp",
                        		data: {
                        			memNo:<%=memNo%>,
                        			followingId:id
                        		},
                        		type:"post",
                        		success: function(result) {
                        			$(e).removeAttr("onclick");
                        			$(e).attr("onclick", "addDelFollowingBtn(this)")
                        			$(e).css("background-color","#C7A9CC");
                        			$(e).css("color","white");
                        			
                        			
                        		},
                        		error: function() {
                        			console.log("ajax 통신 실패!!")
                        		}
                        	})
                        }
                        
                        
                        
                          
                        </script>
	</div>
	<%@include file="../common/footer.jsp"%>


</body>

</html>