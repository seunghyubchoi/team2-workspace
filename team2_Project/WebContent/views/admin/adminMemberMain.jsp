<%@page import="com.kh.member.model.vo.Member"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%
	ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list");
%>
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
                sidebarActive("#member");
            })
        </script>

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <div class="input-group">
                        <h2 class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100">회원관리</h2>
                    </div>
                    <div class="input-group">
                        <a class="d-none d-sm-inline-block form-inline ml-auto my-2 mr-3 my-md-0 mw-100" href="#" data-toggle="modal" data-target="#logoutModal" id="logoutBtn">로그아웃</a>
                    </div>

                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
            
                <div class="container-fluid mb-5">

                    <div class="table-responsive">
                        <table class="table table-bordered dataTables" id="memberTable" width="100%" cellspacing="0" style="text-align: center;">
                            <thead>
                                <tr>
                                    <th><input type="checkbox" id="checkAll" class="scale-120"></th>
                                    <th>번호</th>
                                    <th>아이디</th>
                                    <th>이름</th>
                                    <th>가입일</th>
                                    <th>수정</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for(Member m : list) { %>
	                                <tr>
	                                	<td><input type="checkbox" name="deleteCheck" class="scale-120" value="<%= m.getMemNo() %>"></td>
	                                    <td><%= m.getMemNo() %></td>
	                                    <td><a href="<%= contextPath%>/detailForm.me?mno=<%= m.getMemNo() %>"><%= m.getMemId() %></a></td>
	                                    <td><%= m.getMemName()%></td>
	                                    <td><%= m.getEnrollDate() %></td>
	                                    <td><a class="btn btn-sm btn-secondary" href="<%= contextPath%>/detailForm.me?mno=<%= m.getMemNo() %>">수정</a></td>
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

    <!-- DeactButton Process Modal-->
    <div class="modal fade" id="memberDeactModal" tabindex="-1" role="dialog" aria-labelledby="memberDeactModal"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="memberDeactModal">탈퇴하기</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    선택된 회원을 정말 탈퇴하시겠습니까?
                </div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
                    <form action="<%= contextPath %>/deleteList.me" method="post">
                        <input type="hidden" id="deleteList" name="deleteList">
                        <button type="submit" class="btn btn-warning" id="checkBtn">탈퇴</button>
                    </form>
                </div>
            </div>
        </div>
    </div>


</body>

</html>