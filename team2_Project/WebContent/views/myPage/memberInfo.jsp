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
                        <p>회원정보 관리</p>
                    </div>
                    <div id="member_info">
                        <form action="">
                            <table id="member_table">
                                <tr>
                                    <th>ID</th>
                                    <td>user01</td>
                                    <td> <button type="submit" class="btn btn-primary mb-2">비밀번호 변경</button></td>
                                </tr>
                                <tr>
                                    <th>이름</th>
                                    <td><input type="text" class="form-control mb-2 mr-sm-2" placeholder="" readonly>
                                    </td>
                                </tr>
                                <tr>
                                    <th>성별</th>
                                    <td><select name="" id="">
                                            <option value="">입력안함</option>
                                            <option value="">남자</option>
                                            <option value="">여자</option>
                                        </select></td>
                                </tr>
                                <tr>
                                    <th>생년월일</th>
                                    <td><input type="text" class="form-control mb-2 mr-sm-2" placeholder=""></td>
                                </tr>
                                <tr>
                                    <th>전화번호</th>
                                    <td><input type="tel" class="form-control mb-2 mr-sm-2" placeholder="" readonly>
                                    </td>
                                    <td> <button type="submit" class="btn btn-primary mb-2">전화번호 변경</button></td>
                                </tr>
                                <tr>
                                    <th>이메일</th>
                                    <td><input type="email" class="form-control mb-2 mr-sm-2" placeholder=""></td>
                                </tr>
                                <tr>
                                    <th>배송지</th>
                                    <td><input type="text" class="form-control mb-2 mr-sm-2" placeholder=""></td>
                                    <td> <button type="submit" class="btn btn-primary mb-2">새로운 배송지</button>
                                        <button type="submit" class="btn btn-primary mb-2">배송지 목록</button>
                                    </td>


                                </tr>
                                <tr>
                                    <th>인스타그램 ID</th>
                                    <td><input type="text" class="form-control mb-2 mr-sm-2" placeholder=""></td>
                                </tr>
                                <tr>
                                    <th>선택 동의 사항</th>
                                    <td><input type="checkbox" name="marketing_yn" id="marketing_yn"> 마케팅 수신 정보 동의
                                        안내<br>
                                        <input type="checkbox" name="marketing" id="email" value="이메일"> 이메일<br>
                                        <input type="checkbox" name="marketing" id="text" value="문자"> 문자
                                    </td>

                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td><a href="#">탈퇴하기</a></td>


                                </tr>

                                <tr>
                                    <td></td>

                                    <td><button type="reset" class="btn btn-primary mb-2">취소하기</button>
                                        <button type="submit" class="btn btn-primary mb-2">저장하기</button>
                                    </td>

                                </tr>
                            </table>

                        </form>
                    </div>
                </div>
            </div>


    </body>

    </html>