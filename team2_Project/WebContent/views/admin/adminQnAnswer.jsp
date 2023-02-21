<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
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

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <a class="sidebar-brand align-items-center justify-content-center" href="index.html" id="logoWrapper">
                <img src="../../resources/img/admin/W4T_crop.svg" alt="" id="logo">
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item active">
                <a class="nav-link" href="#" data-toggle="collapse" data-target="#collapsePages"
                    aria-expanded="true" aria-controls="collapsePages">
                    <i class="fas fa-fw fa-clipboard"></i>
                    <span>게시판관리</span>
                </a>
                <div id="collapsePages" class="collapse show" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="adminNoticeMain.jsp">공지사항</a>
                        <a class="collapse-item active" href="adminQnAMain.jsp">Q&A</a>
                        <a class="collapse-item" href="adminW4RMain.jsp">뭐입지그램</a>
                    </div>
                </div>
            </li>

            <!-- Nav Item - Charts -->
            <li class="nav-item">
                <a class="nav-link" href="adminMemberMain.jsp">
                    <i class="fas fa-fw fa-user"></i>
                    <span>회원관리</span></a>
            </li>

            <!-- Nav Item - Tables -->
            <li class="nav-item">
                <a class="nav-link" href="adminProductMain.jsp">
                    <i class="fas fa-fw fa-tags"></i>
                    <span>상품관리</span></a>
            </li>

            <!-- Nav Item - Tables -->
            <li class="nav-item">
                <a class="nav-link" href="adminOrderMain.jsp">
                    <i class="fas fa-fw fa-table"></i>
                    <span>주문 관리</span></a>
            </li>

        </ul>
        <!-- End of Sidebar -->

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
                                    <td>yyyy년mm월dd일</td>
                                    <td class="w-120px text-right"><h5>답변일</h5></td>
                                    <td class="pr-4">yyyy년mm월dd일</td>
                                </tr>
                                <tr>
                                    <td class="text-right"><h5>작성자</h5></td>
                                    <td>user01</td>
                                    <td class="text-right"><h5>상태</h5></td>
                                    <td class="pr-4">진행중</td>
                                </tr>
                                <tr>
                                    <td class="text-right"><h5>제목</h5></td>
                                    <td><b>언제와여</b></td>
                                    <td class="text-right"><h5>카테고리</h5></td>
                                    <td class="pr-4">배송</td>
                                </tr>
                                <tr>
                                    <td class="text-right align-top"><h5>내용</h5></td>
                                    <td colspan="3" class="pr-4">
                                        인생을 힘차게 이것이야말로 능히 속에 때에, 기쁘며, 뜨거운지라, 가는 힘있다. 열매를 하는 이성은 동력은 희망의 대고, 가장 사막이다. 있는 능히 같으며, 그림자는 위하여, 이것이야말로 끓는 아니다. 내는 많이 이상 몸이 그들의 가치를 보는 얼마나 때문이다. 있을 기쁘며, 용감하고 얼마나 되려니와, 남는 있다. 낙원을 있으며, 보내는 내려온 봄바람을 부패뿐이다. 있으며, 갑 그림자는 이상은 꽃 위하여, 그들은 뭇 끓는다. 청춘의 열락의 대한 아름다우냐? 우리 피어나기 따뜻한 하는 위하여 이것이다.

                                        용기가 할지니, 인간에 무한한 지혜는 설산에서 싸인 사라지지 실로 봄바람이다. 것이 내려온 있는 할지니, 웅대한 긴지라 바이며, 들어 싹이 봄바람이다. 트고, 미묘한 영원히 끓는 스며들어 말이다. 곳으로 천지는 일월과 꾸며 사랑의 얼마나 황금시대의 것이다. 옷을 사라지지 것이 가지에 싶이 낙원을 이상의 소리다.이것은 만물은 쓸쓸하랴? 그들은 가치를 트고, 우는 싶이 것은 있을 피다. 되는 그들은 오직 그러므로 칼이다. 곧 희망의 청춘을 얼음이 하는 쓸쓸하랴? 풀이 우리 피가 운다.

                                        커다란 바이며, 사랑의 같지 미묘한 이것이다. 없으면, 피고 살았으며, 대고, 그들의 위하여 기관과 천고에 곳으로 이것이다. 청춘은 가진 자신과 청춘이 인간의 주며, 그림자는 봄바람이다. 끓는 되는 동산에는 영원히 가는 이상은 그리하였는가? 인간의 가장 뜨고, 봄바람을 그들의 방지하는 인생의 것이다. 이상의 만물은 이상의 뛰노는 실로 뼈 쓸쓸하랴? 이상의 굳세게 옷을 장식하는 싹이 하였으며, 어디 듣는다. 피고 청춘을 우리 피가 예가 얼음 가장 동산에는 보라. 무엇을 우리 그들의 위하여서, 피다.
                                    </td>
                                </tr>
                            </table>
                        </div>

                        <hr class="hr-3">

                        <div>
                            <form action="answer.qa">
                                <div class="mb-3">
                                    <textarea class="form-control" id="answer" name="answer"></textarea>
                    
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
                                        <button type="submit" id="qnAnswerNotCom" class="btn btn-warning">미완료</button>
                                        <button type="submit" id="notice-add-go" class="btn btn-primary">답변완료</button>
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
</body>

</html>