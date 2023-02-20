<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>상품추가</title>

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
                    aria-expanded="true" aria-controls="collapsePages">
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
            <li class="nav-item active">
                <a class="nav-link" href="adminProductMain.jsp">
                    <i class="fas fa-fw fa-tags"></i>
                    <span>상품관리</span></a>
            </li>

            <!-- Nav Item - Tables -->
            <li class="nav-item">
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
                        <h2 class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100">상품추가</h2>
                    </div>
                    <div class="input-group" style="padding-top: 10px;">
                        <a class="d-none d-sm-inline-block form-inline ml-auto my-2 mr-3 my-md-0 mw-100" href="#" data-toggle="modal" data-target="#logoutModal" id="logoutBtn">로그아웃</a>
                    </div>

                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
            
                <div class="container-fluid mb-5">

                    <div class="content-wrapper">
                        <form>
                            <div><h5>메인사진</h5></div>
                            <div class="display-flex">
                                <div id="productImg"><img src="" alt=""></div>
                                <div id="productInfo">
                                    <table class="table table-primary table-bordered">
                                        <tr>
                                            <td>브랜드</td>
                                            <td>
                                                <select name="brand" id="">
                                                    <option value="nike">나이키</option>
                                                    <option value="adidas">아디다스</option>
                                                    <option value="muamua">무아무아</option>
                                                    <option value="kirsi">키르시</option>
                                                    <option value=""></option>
                                                </select>
                                            </td>
                                            <td>카테고리</td>
                                            <td>
                                                <select name="product-category" id="">
                                                    <option value="outer">아우터</option>
                                                    <option value="top">상의</option>
                                                    <option value="bottom">하의</option>
                                                    <option value="shoes">슈즈</option>
                                                    <option value="etc">기타</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>상품명</td>
                                            <td><input type="text" class="input content" placeholder="상품명을 입력해주세요"></td>
                                            <td>재고</td>
                                            <td><input type="number" class="input content" placeholder="재고를 입력해주세요"></td>
                                        </tr>
                                        <tr>
                                            <td>가격</td>
                                            <td><input type="number" class="input content" placeholder="가격을 입력해주세요"></td>
                                            <td>할인율</td>
                                            <td><input type="number" class="input content" placeholder="할인율을 입력해주세요"></td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                            <hr class="hr-3">
                            <div id="product-option" class="display-flex">
                                <div id="option-btn">
                                    <button class="btn btn-secondary mb-2">옵션추가</button><br>
                                    <button class="btn btn-secondary">옵션삭제</button>
                                </div>
                                <div id="option-content" class="ml-3">
                                    옵션1 <input type="text">
                                </div>
                            </div>
                            <hr class="hr-3">
                            <div class="mb-3">
                                <textarea class="form-control" id="productDescript" name="productDescript"></textarea>
                
                                <script type="text/javascript">
                                    CKEDITOR.replace('productDescript'
                                        , {
                                            height: 350, width: "100%"
                                        });
                                </script>
                            </div>
                            <div class="table-buttons mr-0 ml-auto" align="right">
                                <button type="button" class="btn btn-secondary" data-toggle="modal"
                                    data-target="#backModal">뒤로가기</button>
                                <button type="submit" class="btn btn-primary">추가</button>
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