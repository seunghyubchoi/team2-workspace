<%@page import="com.kh.myPage.model.vo.Follow"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int memNo = (int) request.getAttribute("memNo");
ArrayList<Follow> followList = (ArrayList<Follow>) request.getAttribute("followList");
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

#followList p {
	font-size: 1.5em;
	font-weight: 700;
	padding: 50px;
}

#followTable {
	
	width: 60%;
	height: 100%;
	text-align: left;
	margin: auto;
	font-size: 1.2em;
}
#followTable td {
	padding: 8px;
}
#followTable td:nth-child(2) {
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
			<div class="btn btn-primary mb-2 active" id="followBtn" onclick="selectFollowerList();">팔로워</div>
			<div class="btn btn-primary mb-2" id="follwingBtn" onclick="selectFollowingList();">팔로잉</div>
		</div>
		<div id="followList">
			<%
				if (followList.isEmpty()) {
			%>
			<p>해당하는 회원이 없습니다</p>
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
						<td><button type="button" class="btn btn-primary mb-2" value="<%=f.getFollowerId()%>" 
						data-toggle="modal" data-target="#deleteFollower" 
						onclick="deleteAlert(this);">삭제</button></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
			<%
				}
			%>
			
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
                    						<div class="btn btn-sm btn-danger" onclick="deleteFollower();">삭제</div>
                    					</form>
                    				</div>
                    			</div>
                    		</div>
                    	</div>
			
			<script>
                        function selectFollowingList() {
                        	$.ajax({
                        		url:"followingList.mp",
                        		data: {memNo:<%=memNo%>},
                        		type:"post",
                        		success:function(result){
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
                        			
                        			
                        			//$("#followTableBody").empty();
                        			
                        			
                        			
                        			let value = "";
                        			for(let i = 0; i < result.length; i++) {
                						value += "<tr>"
            								+ "<td>" + result[i].followerId + "</td>"
            								+ "<td>" + "<button type='button' class='btn btn-primary mb-2'>팔로잉</button>" + "</td>"
            								+ "</tr>"
                					}
                        			$("#followTableBody").html(value);
                        		},
                        		error: function() {
                        			console.log("ajax 통신 실패!!")
                        		}
                        	})
                        }
                        
                        
                        function selectFollowerList(){
                        	$.ajax({
                        		url:"followerList.mp",
                        		data: {memNo:<%=memNo%>},
                        		type:"post",
                        		success:function(result){
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
            								+ "<td>" + "<button type='button' class='btn btn-primary mb-2'>삭제</button>" + "</td>"
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
                        	$("#followerId").attr("name", $(e).val());
                        	console.log($("#followerId").attr("name"));
                        	$("#targetId").text($(e).val());
                        }
                        
                        function deleteFollower() {
                                                	
                        	$.ajax({
                        		url:"deleteFollower.mp",
                        		data: {
                        			followerId: $("#followerId").attr("name"),
                        			memNo: <%=memNo%>
                        		},
                        		type: "post",
                        		success: function(result) {
                        			alert("하잉")
                        		},
                        		error: function() {
                        			console.log("ajax 통신 실패!!")

                        		}
                        	})
                        }
                    	
                          
                        </script>
		</div>
	</div>
	<%@include file="../common/footer.jsp"%>


</body>

</html>