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

            #content_title p{
                text-align: left;
                font-size: 2rem;
                font-weight: bolder;
                padding-bottom: 3rem;
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
                        <p>비밀번호 확인</p>
                    </div>
                    <div id="pwd_box">
                        <p>회원님의 개인정보를 안전하게 보호하기 위해<br>
                            비밀번호를 입력해주세요
                        </p>
                        <form class="form-inline" action="<%= contextPath%>/pwdCheck.me" method="post"]>
                      <input type="hidden" name="memId" value="<%=loginUser.getMemId()%>">
                            <label for="pwd" class="mr-sm-2">비밀번호: </label>
                            <input type="password" class="form-control mb-2 mr-sm-2" placeholder="비밀번호를 입력해주세요"
                                id="pwd" name="pwdCheck">
                            
                            <button type="submit" class="btn btn-primary mb-2" >확인하기</button>
                        </form>
                    </div>
                </div>
            </div>


    </body>

    </html>