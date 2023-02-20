<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>공지사항 수정</title>

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
            <li class="nav-item active">
                <a class="nav-link" href="#" data-toggle="collapse" data-target="#collapsePages"
                    aria-expanded="true" aria-controls="collapsePages">
                    <i class="fas fa-fw fa-clipboard"></i>
                    <span>게시판관리</span>
                </a>
                <div id="collapsePages" class="collapse show" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item active" href="adminNoticeMain.jsp">공지사항</a>
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
                <a class="nav-link" href="adminPrductMain.jsp">
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

                    <div class="input-group">
                        <h2 class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100">공지사항 수정</h2>
                    </div>
                    <div class="input-group">
                        <a class="d-none d-sm-inline-block form-inline ml-auto my-2 mr-3 my-md-0 mw-100" href="#" data-toggle="modal" data-target="#logoutModal" id="logoutBtn">로그아웃</a>
                    </div>

                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
            
                <div class="container-fluid mb-5">

                    <div class="content-wrapper" align="center">
                        <form action="modify.nt">
                            <div class="mb-3" align="left">
                                <h3>작성일 : yyyy년 mm월 dd일</h3>
                            </div>
                            <div id="noticeAddTop" class="mb-3">
                                <input type="text" name="noticeTitle" class="input form-control bg-light border-0 small"
                                    placeholder="제목을 입력해주세요">
                            </div>
                            <div id="noticeAddMiddle" class="mb-3">
                                <textarea class="form-control" id="noticeContent"></textarea>
                
                                <script type="text/javascript">
                                    CKEDITOR.replace('noticeContent'
                                        , {
                                            height: 350, width: "100%"
                                        });
                                </script>
                            </div>
                            <div id="notice-add-bottom" class="mb-3 display-flex">
                                <div id="noticeAddFile">
                                    <!-- <input type="file" name="noticeFile" id="noticeFile" class="btn btn-sm"> -->
                                    <label className="input-file-button" class="btn btn-secondary" for="notice-file">
                                        파일추가
                                      </label>
                                      <input type="file" name="notice-file" id="notice-file" style="display: none;">
                                </div>
                                <div id="noticeAddBtns" class="table-buttons mr-0 ml-auto" align="right">
                                    <button type="button" id="noticeAddBack" class="btn btn-secondary" data-toggle="modal"
                                        data-target="#backModal">뒤로가기</button>
                                    <button type="submit" id="noticeAddGo" class="btn btn-primary">수정</button>
                                </div>
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