<%@page import="com.kh.manager.model.vo.Manager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  Manager loginManager = (Manager)session.getAttribute("loginManager");

  String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 관리</title>
<style>
    div{border: 1px solid red;}
    .wrap{
        width: 1200px;
        height: 600px;
    }

    .wrap>div{
        height: 100%;
        display: flex;
    }

    #left{
        width: 25%;
    }

    #right{
        width: 75%;
    }
</style>
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
                        <h2 class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100">공지사항 관리</h2>
                    </div>
                    <div class="input-group">
                        <a class="d-none d-sm-inline-block form-inline ml-auto my-2 mr-3 my-md-0 mw-100" href="#" data-toggle="modal" data-target="#logoutModal" id="logoutBtn">로그아웃</a>
                    </div>

                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
            
                <div class="container-fluid mb-5">

                    <div class="table-responsive">
                        <table class="table table-bordered dataTables" id="noticeTable" width="100%" cellspacing="0" style="text-align: center;">
                            <thead>
                                <tr>
                                    <th id="check1"><input type="checkbox" id="checkAll"></th>
                                    <th style="width: 60px">번호</th>
                                    <th>제목</th>
                                    <th style="width: 200px">작성일</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><input type="checkbox" name="changeList"></td>
                                    <td>3</td>
                                    <td><a href="#">어쩌구 저쩌구</a></td>
                                    <td>2021-10-22</td>
                                </tr>
                            </tbody>
                        </table>
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