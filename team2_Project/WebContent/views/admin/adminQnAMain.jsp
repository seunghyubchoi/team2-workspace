<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
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
                                    <th>답변하기</th>
                                </tr>
                            </thead>
                            <tbody>
                                
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