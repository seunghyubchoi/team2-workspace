<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>

       
        <style>
            #btnBox{
                width: 100%;
                display: flex;
            }
            #btnBox div{
                width: 50%;
                }

            #followList p{
                font-size: 1.5em;
                font-weight: 700;
                padding: 50px;
            }
        </style>
    </head>

    <body>
	<%@include file="../common/menu.jsp"%>
	<%@include file="../common/leftList.jsp"%>
	<div id="content_title">
		<p>팔로잉/팔로우</p>
	</div>
    <div id="content">
        <div id="btnBox">
            <div class="btn btn-primary mb-2 active" id="follow">팔로우</div> 
            <div class="btn btn-primary mb-2" id="follwing">팔로잉</div>
        </div>
        <div id="followList">
            <p>팔로우하는 사람이 없습니다</p>
        </div>
    </div>
	<%@include file="../common/footer.jsp"%>


</body>

    </html>