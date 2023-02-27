<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>공지사항 추가</title>

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
                        <h2 class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100">공지사항 추가</h2>
                    </div>
                    <div class="input-group">
                        <a class="d-none d-sm-inline-block form-inline ml-auto my-2 mr-3 my-md-0 mw-100" href="#" data-toggle="modal" data-target="#logoutModal" id="logoutBtn">로그아웃</a>
                    </div>

                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
            
                <div class="container-fluid mb-5">
                
                    <div class="content-wrapper" align="center">
                        <form action="<%= contextPath %>/add.nt" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="managerNo" value="<%= loginManager.getManagerNo()%>">
                            <div id="notice-add-top" class="mb-3">
                                <input type="text" name="noticeTitle" class="input form-control bg-light border-0 small"
                                    placeholder="제목을 입력해주세요" required>
                            </div>
                            <div id="notice-add-middle" class="mb-3">
                                <textarea class="form-control" id="noticeContent" name="noticeContent" required></textarea>
                
                                <script type="text/javascript">
                                    CKEDITOR.replace('noticeContent'
                                        , {
                                            height: 350, width: "100%",
                                            filebrowserImageUploadUrl: 'addImg.nt'
                                        });
                                </script>
                            </div>
                            <div id="notice-add-bottom" class="mb-3 display-flex">
                                <div id="notice-add-file" style="display: flex;">
                                    <!-- <input type="file" name="noticeFile" id="noticeFile" class="btn btn-sm"> -->
                                    <label className="input-file-button" class="btn btn-secondary" for="notice-file">
                                        파일추가
                                      </label>
                                      <input type="file" name="notice-file" id="notice-file" style="display: none;" onchange="changeValue(this)">
                                      <span class="file-name" >파일없음</span>
                                </div>
                                <div id="notice-add-btns" class="table-buttons mr-0 ml-auto" align="right">
                                    <button type="button" id="notice-add-back" class="btn btn-secondary" data-toggle="modal"
                                        data-target="#backModal">뒤로가기</button>
                                    <button type="submit" id="notice-add-go" class="btn btn-primary">추가</button>
                                </div>
                            </div>
                        </form>
                
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