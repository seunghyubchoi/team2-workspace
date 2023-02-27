<%@ page import="com.kh.manager.model.vo.Manager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%
	Manager loginManager = (Manager)session.getAttribute("loginManager");
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="ko">

<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>common</title>
    <!-- Custom fonts for this template-->
    <link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="resources/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="resources/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.13.2/js/jquery.dataTables.js"></script>

    <script src="resources/vendor/jquery/jquery.min.js"></script>

    <script src="resources/ckeditor/ckeditor.js"></script>

    <!-- Bootstrap core JavaScript-->
    <script src="resources/vendor/bootstrap/js/bootstrap.bundle.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="resources/js/admin/sb-admin-2.js"></script>

    <!-- Page level plugins -->
    <script src="resources/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

     <!-- Page level custom scripts -->
     <script src="resources/js/admin/datatables.js"></script>
     <!-- <script src="resources/js/admin/sidebar.js"></script>  -->

</head>

<body>

    <%
	String alertMsg = (String)session.getAttribute("alertMsg");
    %>

    <% if(alertMsg != null) {%>
	    <script>
	        alert("<%= alertMsg %>");
	    </script>
	<% session.removeAttribute("alertMsg"); %>
    <% } %>

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

        <a class="sidebar-brand align-items-center justify-content-center" href="index.html" id="logoWrapper">
            <img src="resources/img/admin/W4T_crop.svg" alt="사용자페이지로" id="logo">
        </a>

        <!-- Divider -->
        <hr class="sidebar-divider my-0">

        <!-- Nav Item - Pages Collapse Menu -->
        <li class="nav-item" id="board">
            <a class="nav-link" href="#" data-toggle="collapse" data-target="#collapsePages"
                aria-expanded="true" aria-controls="collapsePages">
                <i class="fas fa-fw fa-clipboard"></i>
                <span>게시판관리</span>
            </a>
            <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <a class="collapse-item" id="notice" href="<%= contextPath%>/noticeList.ma">공지사항</a>
                    <a class="collapse-item" id="qna" href="<%= contextPath%>/qnaList.ma">Q&A</a>
                    <a class="collapse-item" id="community" href="<%= contextPath%>/communityList.ma">뭐입지그램</a>
                </div>
            </div>
        </li>

        <!-- Nav Item - Charts -->
        <li class="nav-item" id="member">
            <a class="nav-link" href="<%= contextPath%>/memberList.ma">
                <i class="fas fa-fw fa-user"></i>
                <span>회원관리</span></a>
        </li>

        <!-- Nav Item - Tables -->
        <li class="nav-item" id="product">
            <a class="nav-link" href="<%= contextPath%>/productList.ma">
                <i class="fas fa-fw fa-tags"></i>
                <span>상품관리</span></a>
        </li>

        <!-- Nav Item - Tables -->
        <li class="nav-item" id="order">
            <a class="nav-link" href="<%= contextPath%>/orderList.ma">
                <i class="fas fa-fw fa-table"></i>
                <span>주문 관리</span></a>
        </li>

    </ul>

    <!-- <script>
        $(function(){
            $(".nav-item").click(function(){
                $(".nav-item").each(function(){
                    if ($(this).hasClass("active")) {
                        $(this).removeClass('active')
                    }
                });
        
                console.log($(this));
                $(this).addClass("active");
            });
        });
    </script> -->


    <!-- End of Sidebar -->

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">로그아웃</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">로그아웃 하시겠습니까?</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
                    <a class="btn btn-primary" href="<%= contextPath%>/logout.ma">로그아웃</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Button Process Modal-->
    <div class="modal fade" id="commonModal" tabindex="-1" role="dialog" aria-labelledby="commonModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="commonModalLabel"></h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body" id="commonModalBody">
                    
                    <div id="id1"></div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
                    <form action="#" method="post">
                        <input type="hidden" id="menuName" name="menuName" value="">
                        <button type="submit" class="btn btn-warning" id="checkBtn"></button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Back Button Modal-->
    <div class="modal fade" id="backModal" tabindex="-1" role="dialog" aria-labelledby="backModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body" id="commonModalBody">
                    작성중인 내용이 모두 사라집니다. <br>이전 페이지로 이동하시겠습니까?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                    <button type="button" class="btn btn-warning" onclick="history.back()">확인</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

        <!-- Bootstrap core JavaScript-->
        <!-- <script src="resources/vendor/jquery/jquery.js"></script>
        <script src="resources/vendor/bootstrap/js/bootstrap.bundle.js"></script> -->
    
        <!-- Core plugin JavaScript-->
        <!-- <script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script> -->
    
        <!-- Custom scripts for all pages-->
        <!-- <script src="/resources/js/admin/sb-admin-2.js"></script> -->
    
        <!-- Page level plugins -->
        <!-- <script src="resources/vendor/datatables/jquery.dataTables.min.js"></script>
        <script src="resources/vendor/datatables/dataTables.bootstrap4.min.js"></script> -->
    
         <!-- Page level custom scripts -->
         <!-- <script src="../../resources/js/admin/datatables.js"></script> -->

</body>

</html>