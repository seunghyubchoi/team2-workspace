<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>주문수정</title>

</head>

<body id="page-top">
            
    <!-- include common element  -->
    <%@ include file="adminCommon.jsp" %>

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <a class="sidebar-brand align-items-center justify-content-center" href="index.html" id="logoWrapper">
                <img src="../../resources/img/admin/W4T_crop.svg" alt="" id="logo">
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
                    aria-expanded="false" aria-controls="collapsePages">
                    <i class="fas fa-fw fa-clipboard"></i>
                    <span>게시판관리</span>
                </a>
                <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="adminNoticeMain.jsp">공지사항</a>
                        <a class="collapse-item" href="adminQnAMain.jsp">Q&A</a>
                        <a class="collapse-item" href="adminW4RMain.jsp">뭐입지그램</a>
                    </div>
                </div>
            </li>

            <!-- Nav Item - Charts -->
            <li class="nav-item">
                <a class="nav-link" href="adminMemberMain.jsp">
                    <i class="fas fa-fw fa-user"></i>
                    <span>회원관리</span></a>
            </li>

            <!-- Nav Item - Tables -->
            <li class="nav-item">
                <a class="nav-link" href="adminProductMain.jsp">
                    <i class="fas fa-fw fa-tags"></i>
                    <span>상품관리</span></a>
            </li>

            <!-- Nav Item - Tables -->
            <li class="nav-item active">
                <a class="nav-link" href="adminOrderMain.jsp">
                    <i class="fas fa-fw fa-table"></i>
                    <span>주문 관리</span></a>
            </li>

        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <div class="input-group" style="padding-top: 10px;">
                        <h2 class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100">주문관리</h2>
                    </div>
                    <div class="input-group" style="padding-top: 10px;">
                        <a class="d-none d-sm-inline-block form-inline ml-auto my-2 mr-3 my-md-0 mw-100" href="#" data-toggle="modal" data-target="#logoutModal" id="logoutBtn">로그아웃</a>
                    </div>

                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
            
                <div class="container-fluid mb-5">

                    <div class="content-wrapper">
                        <h6 style="color: #635566;"><b>주문정보</b></h6>
                        <div id="orderInfo" class="display-flex">
                            <table class="table">
                                <tr>
                                    <td>주문번호</td>
                                    <td>xx</td>
                                    <td>주문자성함</td>
                                    <td>권나연</td>
                                </tr>
                                <tr>
                                    <td>주문날짜</td>
                                    <td>20xx-xx-xx</td>
                                    <td>이메일주소</td>
                                    <td>nana@naver.com</td>
                                </tr>
                                <tr>
                                    <td>주문상태</td>
                                    <td>
                                        <select name="orderStatus" id="orderStatus">
                                        <option value="">입금대기중</option>
                                        <option value="">상품준비중</option>
                                        <option value="">배송중</option>
                                        <option value="">배송완료</option>
                                        <option value="">취소완료</option>
                                        <option value="">교환요청</option>
                                        <option value="">교환중</option>
                                        <option value="">교환완료</option>
                                        <option value="">환불요청</option>
                                        <option value="">환불중</option>
                                        <option value="">환불완료</option>
                                        </select>
                                    </td>
                                    <td>전화번호</td>
                                    <td>010-xxxx-xxxx</td>
                            </table>
                        </div>
                        <hr class="hr-3">
                        
                        <div id="orderProductInfo">
                            <h6 style="color: #635566;"><b>주문상품정보</b></h6>
                            <div class="display-flex">
                                <div id="orderProductImg"><img src="" alt=""></div>
                                <div id="orderProductInfo">
                                    <table class="table">
                                        <tr>
                                            <td>브랜드</td>
                                            <td>XXX</td>
                                            <td>가격</td>
                                            <td>10,000원</td>
                                        </tr>
                                        <tr>
                                            <td>상품명</td>
                                            <td>XXXXXXXXXXXXXXXX</td>
                                            <td>옵션</td>
                                            <td>
                                                <select name="orderProductOption" id="">
                                                    <option value="">220</option>
                                                    <option value="">230</option>
                                                    <option value="">240</option>
                                                    <option value="">250</option>
                                                </select>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>

                        <hr class="hr-3">

                        <div id="orderLocationInfo" class="display-flex">
                            <div style="width: 15%;">
                                <h6 style="color: #635566;"><b>배송정보</b></h6>
                            </div>
                            <div>
                                <table class="table">
                                    <tr>
                                        <td><input type="text" class=".input" name="locationAddressName" value="나연이네"></td>
                                    </tr>
                                    <tr>
                                        <td><input type="text" class=".input" name="locationName" value="권나연"></td>
                                    </tr>
                                    <tr>
                                        <td><input type="text" class=".input" name="locationPhone" value="010-xxxx-xxxx"></td>
                                    </tr>
                                    <tr>
                                        <td>서울시 강남구 테헤란로</td>
                                        <td><button class="btn btn-secondary btn-sm">주소변경</button></td>
                                    </tr>
                                    <tr>
                                        <td>우아빌딩 3층</td>
                                    </tr>
                                    <tr>
                                        <td>10294</td>
                                    </tr>
                                    <tr>
                                        <td><input type="text" class=".input"  name="locationMsg" value="문앞에 두고 가주세요"></td>
                                    </tr>
                                </table>
                            </div>
                        </div>

                        <hr class="hr-3">

                        <div id="orderPayInfo" class="display-flex">
                            <div style="width: 15%;">
                                <h6 style="color: #635566;"><b>결제정보</b></h6>
                            </div>
                            <div style="width: 85%;">
                                <table class="table">
                                    <tr>
                                        <td>결제완료</td>
                                        <td class="text-right">네이버페이 간편결제</td>
                                    </tr>
                                    <tr>
                                        <td>주문상품 수</td>
                                        <td class="text-right">1</td>
                                    </tr>
                                    <tr>
                                        <td>주문금액</td>
                                        <td class="text-right">198,000 원</td>
                                    </tr>
                                    <tr>
                                        <td>할인금액</td>
                                        <td class="text-right" style="color: red;">-0원</td>
                                    </tr>
                                    <tr>
                                        <td>적립금할인</td>
                                        <td class="text-right">-0 원</td>
                                    </tr>
                                    <tr>
                                        <td>적립포인트</td>
                                        <td class="text-right">+000 원</td>
                                    </tr>
                                    <tr>
                                        <td>최종결제금액</td>
                                        <td class="text-right">198,000 원</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <div class="table-buttons mr-0 ml-auto" align="right">
                            <button type="button" class="btn btn-secondary" data-toggle="modal"
                                data-target="#backModal">뒤로가기</button>
                            <button type="submit" class="btn btn-primary">수정</button>
                        </div>

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