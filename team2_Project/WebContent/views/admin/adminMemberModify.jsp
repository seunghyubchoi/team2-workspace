<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>회원 관리</title>

</head>

<body id="page-top">
    
    <!-- Page Wrapper -->
    <div id="wrapper" style="display: flex;">

        <!-- include common element  -->
        <%@ include file="adminCommon.jsp" %>

        <script>
            $(function(){
                sidebarActiveDelete();
                sidebarActive("#board");
                sidebarCollapseActive("#notice");
            })
        </script>

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <div class="input-group" style="padding-top: 10px;">
                        <h2 class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100">&lt;&gt; 님의 회원정보</h2>
                    </div>
                    <div class="input-group" style="padding-top: 10px;">
                        <a class="d-none d-sm-inline-block form-inline ml-auto my-2 mr-3 my-md-0 mw-100" href="#" data-toggle="modal" data-target="#logoutModal" id="logoutBtn">로그아웃</a>
                    </div>

                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
            
                <div class="container-fluid mb-5">
                    <div class="content-wrapper">

                        <form action="adminModify.me">
                            <table class="table table-primary table-bordered">
                                <tr>
                                    <td class="text-right w-120px"><h5>아이디</h5></td>
                                    <td colspan="2"></td>
                                    <td class="text-right w-120px"><h5>성별</h5></td>
                                    <td colspan="2"></td>
                                </tr>
                                <tr>
                                    <td class="text-right w-120px"><h5>이름</h5></td>
                                    <td colspan="2"></td>
                                    <td class="text-right w-120px"><h5>생년월일</h5></td>
                                    <td colspan="2"></td>
                                </tr>
                                <tr>
                                    <td class="text-right w-120px"><h5>이메일주소</h5></td>
                                    <td colspan="2"></td>
                                    <td class="text-right w-120px"><h5>전화번호</h5></td>
                                    <td colspan="2"></td>
                                </tr>
                                <tr>
                                    <td class="text-right w-120px"><h5>sns아이디</h5></td>
                                    <td colspan="2"></td>
                                    <td class="text-right w-120px"><h5>적립금</h5></td>
                                    <td colspan="2"></td>
                                </tr>
                                <tr>
                                    <td colspan="2" class="text-right"><h5>선택항목 동의 여부</h5></td>
                                    <td colspan="4">
                                        <input type="checkbox" name="adCheck" value="email">이메일 &nbsp;&nbsp;&nbsp;&nbsp;
                                        <input type="checkbox" name="adCheck" value="sms">sms &nbsp;&nbsp;&nbsp;&nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td rowspan="2" class="text-center w-120px">
                                        <h5>배송지1</h5>
                                        기본배송지<input type="radio" name="primaryAddress">
                                    </td>
                                    <td colspan="4" rowspan="2">
                                        <input type="text" name="addressName1" value="학원"><br>
                                        <input type="phone" name="addressPhone1" value="01023121932"><br>
                                        <input type="text" name="address1" value="" readonly><br>
                                        <input type="text" name="addressDetail1" value="" readonly><br>
                                        <input type="text" name="postNumber1" value="" readonly><br>
                                    </td>
                                    <td><button class="btn btn-secondary">수정</button></td>
                                </tr>
                                <tr>
                                    <td><button class="btn btn-secondary">삭제</button></td>
                                </tr>
                                <tr>
                                    <td rowspan="2" class="text-center w-120px">
                                        <h5>배송지2</h5>
                                        기본배송지<input type="radio" name="primaryAddress">
                                    </td>
                                    <td colspan="4" rowspan="2">
                                        <input type="text" name="addressName1" value="학원"><br>
                                        <input type="phone" name="addressPhone1" value="01023121932"><br>
                                        <input type="text" name="address1" value="" readonly><br>
                                        <input type="text" name="addressDetail1" value="" readonly><br>
                                        <input type="text" name="postNumber1" value="" readonly><br>
                                    </td>
                                    <td><button class="btn btn-secondary">수정</button></td>
                                </tr>
                                <tr>
                                    <td><button class="btn btn-secondary">삭제</button></td>
                                </tr>
                                
                            </table>
                            <div class="table-buttons mr-0 ml-auto" align="right">
                                <button type="button" class="btn btn-secondary" data-toggle="modal"
                                    data-target="#backModal">뒤로가기</button>
                                <button type="submit" class="btn btn-primary">수정</button>
                            </div>
                        </form>
                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->


</body>

</html>