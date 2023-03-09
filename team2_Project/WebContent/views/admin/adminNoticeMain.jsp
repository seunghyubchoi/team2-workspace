<%@page import="com.kh.notice.model.vo.Notice"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 관리</title>

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
                                    <th id="check1"><input type="checkbox" id="checkAll" class="scale-120"></th>
                                    <th style="width: 60px">번호</th>
                                    <th>제목</th>
                                    <th style="width: 200px">작성일</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<% for(Notice n : list){ %>
                                <tr>
                                    <td><input type="checkbox" name="deleteCheck" class="noticeCheckbox scale-120" value="<%= n.getNoticeNo()%>"></td>
                                    <td><%= n.getNoticeNo()%></td>
                                    <td><a href="<%= contextPath%>/modifyView.nt?nno=<%= n.getNoticeNo()%>"><%= n.getNoticeTitle() %></a></td>
                                    <td><%= n.getNoticeDate() %></td>
                                </tr>
                            	<%} %>
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

    <!-- DeleteButton Process Modal-->
    <div class="modal fade" id="NoticeDeleteModal" tabindex="-1" role="dialog" aria-labelledby="NoticeDeleteModal"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="NoticeDeleteModal">삭제하기</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    선택된 항목을 정말 삭제하시겠습니까?
                </div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
                    <form action="<%= contextPath %>/delete.nt" method="post">
                        <input type="hidden" id="deleteList" name="deleteList">
                        <button type="submit" class="btn btn-warning" id="checkBtn">삭제</button>
                    </form>
                </div>
            </div>
        </div>
    </div>  
</body>

</html>