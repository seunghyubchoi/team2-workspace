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
<title>공지사항 관리2</title>

</head>

<body id="page-top">

    
    <!-- Page Wrapper -->
    <div id="wrapper" style="display: flex;">
        <!-- include common element  -->
        <%@ include file="adminCommon2.jsp" %>

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