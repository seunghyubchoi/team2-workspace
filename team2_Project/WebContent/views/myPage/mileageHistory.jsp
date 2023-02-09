<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>


    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>

        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" />

        <!-- jQuery library -->
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>

        <!-- Popper JS -->
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>


        <style>
            #wrap {
                margin: auto;
                width: 1500px;
                padding-top: 20px;
            }

            #menu_list {
                width: 30%;

            }

            .list_name {
                width: 100%;
                padding-bottom: 2.5rem;
                padding-left: 4rem;
                float: left;
            }

            .list_name a {
                color: rgb(51, 51, 51);
                font-size: 1.5rem;
                text-decoration: none;
                font-weight: bold;

            }

            #menu_content {
                width: 70%;
            }

            #menu_content{
                text-align: center;
            }

            #contnet_title p{
                text-align: left;
                font-size: 2rem;
                font-weight: bolder;
            }

            #pwd_box{
                /* border: 1px rgb(51, 51, 51) solid; */
                /* border-radius: 20%; */
                font-size: 1.5rem;
                font-weight: bold;
            }
            #pwd_box form{
                padding-left: 60px;
            }
        </style>
</head>
<body>
 <%@include file="../common/menubar.jsp" %>

<div id="wrap">
                <div id="menu_list">
                    <div class="list_name"><a href="memberInfo.jsp">회원정보관리</a></div>
                    <div class="list_name"><a href="orderHistory.jsp">주문내역</a></div>
                    <div class="list_name"><a href="mileageHistory.jsp">적립금내역</a></div>
                    <div class="list_name"><a href="likes.jsp">좋아요</a></div>
                    <div class="list_name"><a href="follow.jsp">팔로잉/팔로워</a></div>
                </div>
                <div id="menu_content">
                    <div id="contnet_title">
                        <p>적립금내역</p>
                    </div>
                    
                </div>
            </div>

</body>


</html>