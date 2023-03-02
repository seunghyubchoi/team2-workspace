<%@page import="com.kh.inquire.model.vo.Inquire"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%
	ArrayList<Inquire> list = (ArrayList<Inquire>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html lang="ko">

<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>QnA 관리</title>

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
                sidebarCollapseActive("#qna");
            })
        </script>
        
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">
            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <div class="input-group" style="padding-top: 10px;">
                        <h2 class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100">QnA 관리</h2>
                    </div>
                    <div class="input-group" style="padding-top: 10px;">
                        <a class="d-none d-sm-inline-block form-inline ml-auto my-2 mr-3 my-md-0 mw-100" href="#" data-toggle="modal" data-target="#logoutModal" id="logoutBtn">로그아웃</a>
                    </div>

                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
            
                <div class="container-fluid mb-5">

                    <div class="table-responsive">
                        <table class="table table-bordered dataTables" id="QnATable" width="100%" cellspacing="0" style="text-align: center;">
                            <thead>
                                <tr>
                                    <th><input type="checkbox" id="checkAll"></th>
                                    <th>번호</th>
                                    <th>카테고리</th>
                                    <th>제목</th>
                                    <th>작성자</th>
                                    <th>작성일</th>
                                    <th>상태</th>
                                    <th>조회수</th>
                                    <th>답변하기</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for(Inquire i : list){ %>
                                <tr>
                                	<td><input type="checkbox" name="deleteCheck" class="inquireCheckbox" value="<%= i.getQnaNo() %>"></td>
                                    <td><%= i.getQnaNo() %></td>
                                    <td><%= i.getHeaderNo() %></td>
                                    <td><a href="<%= contextPath%>/detailForm.qa?ino=<%= i.getQnaNo() %>"><%= i.getQnaTitle() %></a></td>
                                    <td><%= i.getMemNo() %></td>
                                    <td><%= i.getQnaDate() %></td>
                                    <td>
                                    	<% if(i.getAnsYn().equals("N")){ %>
                                    	진행중
                                    	<%}else{ %>
                                    	답변완료
                                    	<%} %>
                                    </td>
                                    <td><%= i.getQndViewCount() %></td>
                                    <td><a class="btn btn-sm btn-secondary" href="<%= contextPath%>/detailForm.qa?ino=<%= i.getQnaNo() %>">답변하기</a></td>
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
    <div class="modal fade" id="qnaDeleteModal" tabindex="-1" role="dialog" aria-labelledby="qnaDeleteModal"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="qnaDeleteModal">삭제하기</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    선택된 항목을 정말 삭제하시겠습니까?
                </div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
                    <form action="<%= contextPath %>/delete.qa" method="post">
                        <input type="hidden" id="deleteList" name="deleteList">
                        <button type="submit" class="btn btn-warning" id="checkBtn">삭제</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

</body>

</html>