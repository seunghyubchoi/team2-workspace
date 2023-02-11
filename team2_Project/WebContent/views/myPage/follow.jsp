<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

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
                height: 100%;
            }

            #menu_list {
                width: 30%;
                float: left;
                height: 100%;

            }

            .list_name {
                width: 100%;
                padding-bottom: 2.5rem;
                padding-left: 4rem;

            }

            .list_name a {
                color: rgb(51, 51, 51);
                font-size: 1.5rem;
                text-decoration: none;
                font-weight: bold;

            }

            #menu_content {
                float: right;
                width: 70%;
                height: 100%;
                text-align: center;
            }


            #content_title p {
                text-align: left;
                font-size: 2rem;
                font-weight: bolder;
                padding-bottom: 3rem;
            }

            #member_info {
                width: 100%;
                color: rgb(51, 51, 51)
            }


            #member_table {
                text-align: left;
                width: 100%;
                height: 100%;
            }

            #member_table th {
                padding-bottom: 30px;

            }

            #member_table td {
                padding-left: 10px;
                padding-bottom: 30px;
            }

            .btn {
                border: #C7A9CC;
                background-color: #C7A9CC;
            }

            .btn:hover {
                background-color: #9a77a1;

            }
        </style>
    </head>

    <body>
        <%@include file="../common/menubar.jsp" %>

            <!-- 비밀번호 입력 전  -->

            <div id="wrap">
                <div id="menu_list">
                    <div class="list_name"><a href="<%= contextPath%>/myPage.me">회원정보관리</a></div>
                    <div class="list_name"><a href="<%= contextPath%>/orderHistory.me">주문내역</a></div>
                    <div class="list_name"><a href="<%= contextPath%>/mileageHistory.me">적립금내역</a></div>
                    <div class="list_name"><a href="<%= contextPath%>/likes.me">좋아요</a></div>
                    <div class="list_name"><a href="<%= contextPath%>/follow.me">팔로잉/팔로워</a></div>
                </div>
                <div id="menu_content">
                    <div id="content_title">
                        <p>팔로잉/팔로우</p>
                    </div>
               
                </div>
            </div>


    </body>

    </html>