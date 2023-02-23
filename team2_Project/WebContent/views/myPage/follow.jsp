<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>

       
        <style>
            #btnBox{
                
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
            <button class="btn btn-primary mb-2" id="follow">팔로우</button> <button class="btn btn-primary mb-2" id="follwing">팔로잉</button>
        </div>
    </div>
	<%@include file="../common/footer.jsp"%>


</body>

    </html>