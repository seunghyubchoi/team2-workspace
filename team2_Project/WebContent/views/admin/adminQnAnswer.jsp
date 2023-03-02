<%@page import="com.kh.inquire.model.vo.Inquire"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%
	Inquire i = (Inquire)request.getAttribute("i");
%>
<!DOCTYPE html>
<html lang="ko">

<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>답변하기</title>

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
                        <h2 class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100">답변하기</h2>
                    </div>
                    <div class="input-group" style="padding-top: 10px;">
                        <a class="d-none d-sm-inline-block form-inline ml-auto my-2 mr-3 my-md-0 mw-100" href="#" data-toggle="modal" data-target="#logoutModal" id="logoutBtn">로그아웃</a>
                    </div>

                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
            
                <div class="container-fluid mb-5">

                    <div class="content-wrapper">
                        <div id="question">
                            <table class="table table-primary">
                                <tr>
                                    <td class="w-120px text-right"><h5>작성일</h5></td>
                                    <td><%= i.getQnaDate() %></td>
                                    <td class="w-120px text-right"><h5>답변일</h5></td>
                                    <td class="pr-4">
                                    <% if(i.getAnsDate() != null){ %>
	                                    <%= i.getAnsDate() %>
                                    <%} %>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="text-right"><h5>작성자</h5></td>
                                    <td><%= i.getMemNo() %></td>
                                    <td class="text-right"><h5>상태</h5></td>
                                    <td class="pr-4">
                                    	<% if(i.getAnsYn().equals("N")){ %>
                                    	진행중
                                    	<%}else{ %>
                                    	답변완료
                                    	<%} %>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="text-right"><h5>제목</h5></td>
                                    <td><b><%= i.getQnaTitle() %></b></td>
                                    <td class="text-right"><h5>카테고리</h5></td>
                                    <td class="pr-4"><%= i.getHeaderNo() %></td>
                                </tr>
                                <tr>
                                    <td class="text-right align-top"><h5>내용</h5></td>
                                    <td colspan="3" class="pr-4"><%= i.getQnaContent() %></td>
                                </tr>
                            </table>
                        </div>

                        <hr class="hr-3">

                        <div>
                            <form action="<%= contextPath %>/answer.qa">
                            	<input type="hidden" name="qnaNo" value="<%= i.getQnaNo()%>">
                            	<input type="hidden" name="managerNo" value="<%= loginManager.getManagerNo()%>">
                            	<input type="hidden" name="ansYn" value="Y">
                                <div class="mb-3">
                                    <textarea class="form-control" id="answer" name="ansContent">
                                    <% if(i.getAnsDate() != null){ %>
	                                    <%= i.getAnsContent() %>
                                    <%} %>
                                    </textarea>
                    
                                    <script type="text/javascript">
                                        CKEDITOR.replace('answer'
                                            , {
                                                height: 350, width: "100%"
                                            });
                                    </script>
                                </div>
                                <div class="mb-3 display-flex">
                                    <div class="table-buttons mr-0 ml-auto" align="right">
                                        <button type="button" class="btn btn-secondary" data-toggle="modal"
                                            data-target="#backModal">뒤로가기</button>
                                        <button type="button" class="btn btn-warning" data-toggle="modal"
                                        data-target="#notComModal">미완료</button>
                                        <button type="submit" class="btn btn-primary" id="comBtn">답변완료</button>
                                    </div>
                                </div>
                            </form>
                            
                        </div>

                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Not Complete Process Modal-->
    <div class="modal fade" id="notComModal" tabindex="-1" role="dialog" aria-labelledby="notComModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="notComModalLabel">답변 미완료</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    답변은 등록되나 상태가 작성중으로 유지됩니다 <br>
                    답변을 등록하시겠습니까?
                </div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
                    <button type="button" class="btn btn-primary" id="checkBtn" onclick="notCom();">등록</button>
                </div>
            </div>
        </div>
    </div> 

</body>

</html>