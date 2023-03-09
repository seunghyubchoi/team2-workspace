<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>상품추가</title>

</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper" style="display: flex;">

        <!-- include common element  -->
        <%@ include file="adminCommon.jsp" %>

        <script>
            $(function(){
                sidebarActiveDelete();
                sidebarActive("#product");
            })
        </script>
        
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <div class="input-group" style="padding-top: 10px;">
                        <h2 class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100">상품추가</h2>
                    </div>
                    <div class="input-group" style="padding-top: 10px;">
                        <a class="d-none d-sm-inline-block form-inline ml-auto my-2 mr-3 my-md-0 mw-100" href="#" data-toggle="modal" data-target="#logoutModal" id="logoutBtn">로그아웃</a>
                    </div>

                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
            
                <div class="container-fluid mb-5">

                    <div class="content-wrapper">
                        <form action="<%= contextPath %>/insert.pd" method="post" enctype="multipart/form-data">
                            <div id="productInfo">
                                <input type="hidden" name="allOption" id="optionFiled">
                                <input type="hidden" name="allStock" id="stockFiled">
                                <table class="table table-primary table-bordered">
                                    <tr>
                                        <th>상품명</th>
                                        <td colspan="3"><input type="text" class="input content" name="productName" placeholder="상품명을 입력해주세요" required></td>
                                    </tr>
                                    <tr>
                                        <th>브랜드</th>
                                        <td>
                                            <select name="brand" class="custom-select" required>
                                                <option value="1">나이키</option>
                                                <option value="2">무아무아</option>
                                                <option value="3">아디다스</option>
                                                <option value="4">키르시</option>
                                                <option value="5">OiOi</option>
                                            </select>
                                        </td>
                                        <th>카테고리</th>
                                        <td>
                                            <select name="category" class="custom-select" required>
                                                <option value="1">아우터</option>
                                                <option value="2">상의</option>
                                                <option value="3">하의</option>
                                                <option value="4">신발</option>
                                                <option value="5">악세사리</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>가격</th>
                                        <td><input type="number" class="input content" name="productPrice" min="0" placeholder="가격을 입력해주세요" required></td>
                                        <th>할인율</th>
                                        <td><input type="number" class="input content" name="productDiscount" min="0" placeholder="할인율을 입력해주세요"></td>
                                    </tr>
                                </table>
                            </div>
                            <hr class="hr-3">
                            <div class="display-flex">
                                <div id="productImg">
                                    <table>
                                        <tr>
                                            <td><img id="titleImg" src="resources/img/admin/W4T_crop.svg" onclick="chooseFile(1);"></td>
                                            <td><img id="subImg1" onclick="chooseFile(2);"></td>
                                        </tr>
                                        <tr>
                                            <td><img id="subImg2" onclick="chooseFile(3);"></td>
                                            <td><img id="subImg3" onclick="chooseFile(4);"></td>
                                        </tr>
                                    </table>
                                    <div id="file-area" style="display: none;">
                                        <input type="file" name="file1" id="file1" onchange="loadImg(this, 1);" required>
                                        <input type="file" name="file2" id="file2" onchange="loadImg(this, 2);">
                                        <input type="file" name="file3" id="file3" onchange="loadImg(this, 3);">
                                        <input type="file" name="file4" id="file4" onchange="loadImg(this, 4);">
                                    </div>
                                </div>
                                <div id="product-option" class="ml-auto">
                                    <div id="option-btn" class="display-flex mr-0">
                                        <button type="button" class="btn btn-secondary btn-sm m-2" onclick="addOption();">옵션추가</button><br>
                                        <button type="button" class="btn btn-secondary btn-sm m-2" onclick="deleteOption();">옵션삭제</button>
                                    </div>
                                    <div id="option-content" class="">
                                        <table class="table table-primary table-bordered">
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <hr class="hr-3">
                            <div class="mb-3">
                                <textarea class="form-control" id="productDescript" name="productDescript" required></textarea>
                
                                <script type="text/javascript">
                                    CKEDITOR.replace('productDescript'
                                        , {
                                            height: 350, width: "100%",
                                            filebrowserImageUploadUrl: 'addImg.pd'
                                        });
                                </script>
                            </div>
                            <div class="table-buttons mr-0 ml-auto" align="right">
                                <button type="button" class="btn btn-secondary" data-toggle="modal"
                                    data-target="#backModal">뒤로가기</button>
                                <button type="button" class="btn btn-primary" onclick="productAdd();">추가</button>
                                <button type="submit" style="display: none;" id="submitBtn"></button>
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

    <script>
        let count = 0;

        function addOption(){
            count++
            $("#option-content table").append("<tr id='option'" + count + ">" 
                                               + "<th>사이즈</th>"
                                               + "<td><input type='text' name='option'></td>"
                                               + "<th>재고</th>"
                                               + "<td><input type='number' name='stock' min='0'></td>"
                                               + "</tr>");
            console.log(count);
        }

        function deleteOption(){
            $("#option-content tr").last().remove();
            if(count > 0){
                count--;
            }else{
                count = 0;
            }
            console.log(count);

        }
    </script>

</body>

</html>