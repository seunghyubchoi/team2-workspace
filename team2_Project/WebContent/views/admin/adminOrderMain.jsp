<%@page import="com.kh.payment.model.vo.OrderA"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%
	ArrayList<OrderA> list = (ArrayList<OrderA>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html lang="ko">

<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>주문관리</title>

</head>

<body id="page-top">
            
    <!-- Page Wrapper -->
    <div id="wrapper" style="display: flex;">

        <!-- include common element  -->
        <%@ include file="adminCommon.jsp" %>

        <script>
            $(function(){
                sidebarActiveDelete();
                sidebarActive("#order");
            })
        </script>

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

                    <div class="table-responsive">
                        <table class="table table-bordered dataTables" id="orderTable" width="100%" cellspacing="0" style="text-align: center;">
                            <thead>
                                <tr>
                                    <th><input type="checkbox" id="checkAll"></th>
                                    <th>번호</th>
                                    <th>아이디</th>
                                    <th>주문일자</th>
                                    <th>주문상태</th>
                                    <th>수정</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%for(OrderA o : list){ %>
                                <tr>
                                    <td><input type="checkbox" name="deleteCheck" class="orderCheckbox" value="<%= o.getOrderNo()%>"></td>
                                    <td><%= o.getOrderNo()%></td>
                                    <td><a href="<%= contextPath%>/modifyForm.od?ono=<%= o.getOrderNo()%>"><%= o.getMemNo() %></a></td>
                                    <td><%= o.getOrderDate() %></td>
                                    <td><%= o.getOrderStatus() %></td>
                                    <td><a class="btn btn-sm btn-secondary" href="<%= contextPath%>/modifyForm.od?ono=<%= o.getOrderNo() %>">수정</a></td>
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
    
    <!-- send Process Modal-->
    <div class="modal fade" id="orderDeleteModal" tabindex="-1" role="dialog" aria-labelledby="orderDeleteModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="orderDeleteModalLabel">취소하기</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    선택된 주문을 정말 취소하시겠습니까?
                </div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
                    <form action="<%= contextPath %>/delete.od" method="post">
                        <input type="hidden" id="deleteList" name="deleteList">
                        <button type="submit" class="btn btn-warning" id="checkBtn">주문취소</button>
                    </form>
                </div>
            </div>
        </div>
    </div>  

</body>

</html>