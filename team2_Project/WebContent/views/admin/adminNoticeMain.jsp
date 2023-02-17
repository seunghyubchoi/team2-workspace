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
<body>
    <div class="wrap">
        <div id="left">
            <div id="left_top">
            <a href="<%= contextPath%>/logout.ma">로그아웃</a>
            </div>
            <div id="left_bottom"></div>
        </div>
        <div id="right">
            <div id="right_top"></div>
            <div id="right_bottom">
                <div id="right_bottom_top">
                    <div id="right_bottom_top1"></div>
                    <div id="right_bottom_top2"></div>
                    <div id="right_bottom_top3"></div>
                    <div id="right_bottom_top4"></div>
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