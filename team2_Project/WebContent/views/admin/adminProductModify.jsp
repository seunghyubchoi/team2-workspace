<%@page import="com.kh.product.model.vo.Option"%>
<%@page import="com.kh.product.model.vo.Attachment"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.product.model.vo.ProductA"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%
	ProductA p = (ProductA)request.getAttribute("p");
	ArrayList<Attachment> atList = (ArrayList<Attachment>)request.getAttribute("atList");
	ArrayList<Option> opList = (ArrayList<Option>)request.getAttribute("opList");

	int count = 1;
%>
<!DOCTYPE html>
<html lang="ko">

<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>상품수정</title>

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
                        <h2 class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100">&lt;<%= p.getProductNo() %>번&gt;상품수정</h2>
                    </div>
                    <div class="input-group" style="padding-top: 10px;">
                        <a class="d-none d-sm-inline-block form-inline ml-auto my-2 mr-3 my-md-0 mw-100" href="#" data-toggle="modal" data-target="#logoutModal" id="logoutBtn">로그아웃</a>
                    </div>

                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
            
                <div class="container-fluid mb-5">

                    <div class="content-wrapper">
                        <form action="<%= contextPath %>/update.pd" method="post" enctype="multipart/form-data">
                            <div id="productInfo">
                            	<input type="hidden" name="productNo" value="<%= p.getProductNo() %>">
                            	<input type="hidden" name="allOption" id="optionFiled">
                                <input type="hidden" name="allStock" id="stockFiled">
                                <input type="hidden" name="allNo" id="noFiled">
                                <table class="table table-primary table-bordered">
                                    <tr>
                                        <th>상품명</th>
                                        <td colspan="3"><input type="text" class="input content" name="productName" placeholder="상품명을 입력해주세요" value="<%= p.getProductName()%>" required></td>
                                    </tr>
                                    <tr>
                                        <th>브랜드</th>
                                        <td>
                                            <select id="brand" name="brand" required>
                                                <option value="1">나이키</option>
                                                <option value="2">무아무아</option>
                                                <option value="3">아디다스</option>
                                                <option value="4">키르시</option>
                                                <option value="5">OiOi</option>
                                            </select>
                                        </td>
                                        <th>카테고리</th>
                                        <td>
               							    <select id="category" name="category" required>
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
                                        <td><input type="number" class="input content" name="productPrice" placeholder="가격을 입력해주세요" value="<%= p.getProductPrice()%>" required></td>
                                        <th>할인율</th>
                                        <td><input type="number" class="input content" name="productDiscount" placeholder="할인율을 입력해주세요" value="<%= p.getProductDiscount()%>"></td>
                                    </tr>
                                </table>
                            </div>
                            <hr class="hr-3">
                            <div class="display-flex">
                                <div id="productImg">
                                    <table>
                                        <tr>
                                            <td><img id="titleImg" src="<%= contextPath %>/<%= atList.get(0).getFilePath() + atList.get(0).getChangeName()%>" onclick="chooseFile(1);"></td>
                                            <input type="hidden" name="originFileNo1" value="<%= atList.get(0).getFileNo() %>">
                                            <% for(int i = 1; i < atList.size(); i++){ %>
                                                <% if(i == 3){ %>
                                                </tr><tr>
                                                <%} %>
                                                <td>
                                                	<img id="subImg<%= i %>" src="<%= contextPath %>/<%= atList.get(i).getFilePath() + atList.get(i).getChangeName()%>" onclick="chooseFile(<%= i + 1%>);">
                                                	<input type="hidden" name="originFileNo<%= i + 1 %>" value="<%= atList.get(i).getFileNo() %>">
                                               	</td>
                                           		
                                            <%} %>
                                            <% for(int i = 1 + atList.size(); i < 5; i++){ %>
                                                <% if(i == 3){ %>
                                                </tr><tr>
                                                <%} %>
                                                <td><img id="subImg<%= i - 1 %>" onclick="chooseFile(<%= i%>);"></td>
                                            <%} %>
                                        </tr>
                                    </table>
                                    <div id="file-area" style="display: none;">
                                        <input type="file" name="file1" id="file1" onchange="loadImg(this, 1);">
                                        <input type="file" name="file2" id="file2" onchange="loadImg(this, 2);">
                                        <input type="file" name="file3" id="file3" onchange="loadImg(this, 3);">
                                        <input type="file" name="file4" id="file4" onchange="loadImg(this, 4);">
                                    </div>
                                </div>
                                <div id="product-option" class="ml-auto">
                                    <div id="option-btn" class="display-flex mr-0">
                                        <button type="button" class="btn btn-secondary btn-sm m-2" onclick="addOption();">옵션추가</button><br>
                                        <button type="button" class="btn btn-secondary btn-sm m-2" id="optionDelete" onclick="deleteOption();">옵션삭제</button>
                                    </div>
                                    <div id="option-content" class="">
                                        <table id="option-table" class="table table-primary table-bordered">
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <hr class="hr-3">
                            <div class="mb-3">
                                <textarea class="form-control" id="productDescript" name="productDescript"><%= p.getProductDesc()%></textarea>
                
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
                                <button type="button" class="btn btn-primary" onclick="productAdd();">수정</button>
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
        
        $(function() {
        	selectOptionList();

            const category = "<%= p.getCategoryNo()%>";
            $("#category").children().each(function () {
                if ($(this).text() == category) {
                    $(this).prop("selected", true);
                }
            });

            const brand = "<%= p.getBrandNo()%>";
            $("#brand").children().each(function () {
                if ($(this).text() == brand) {
                    $(this).prop("selected", true);
                }
            });
		})

        function addOption(){
            $("#option-content table").append("<tr id='option'" + count + ">" 
                                               + "<th>사이즈</th>"
                                               + "<td><input type='text' name='option'></td>"
                                               + "<th>재고</th>"
                                               + "<td><input type='number' name='stock' min='0'></td>"
                                               + "</tr>");
            count++
            console.log(count);
        }
        
        function selectOptionList(){
        	$.ajax({
	        	url:"select.op",
	        	data:{
	        		pno:<%= p.getProductNo()%>
	        	},
	        	success:function(opList){
	        		let value = "";
	        		for(let i = 0; i < opList.length; i++){
	        			value += "<tr>" 
	        					+ "<input type='hidden' name='optionNo' value='" + opList[i].optionNo + "'>"
	                    		+ "<th>사이즈</th>"
	                    		+ "<td><input type='text' name='option' value='" + opList[i].optionSize + "'></td>"
	                    		+ "<th>재고</th>"
	                    		+ "<td><input type='number' name='stock' min='0'value='" + opList[i].stock + "'></td>"
	                    		+ "</tr>";
	        		}
	        		
	        		$("#option-table").html(value);
	        		if(!(opList.length > 0) || !(count > 0)){
	        			$("#optionDelete").attr("disabled");
	        		}
	        	},
	        	error:function(){
	        		console.log("ajax통신실패,,,");
	        	}
        	});
        }

        function deleteOption(){
        	if(count > 0){
	            $("#option-content tr").last().remove();
	            count--;
	            console.log(count);
        	}else{
        		const optionNo = $("#option-table tr:last-child input[name=optionNo]").val();
        		if(optionNo != undefined){
	        		$.ajax({
	        			url:"delete.op",
	        			data:{
	        				ono:$("#option-table tr:last-child input[name=optionNo]").val()
	        			},
	        			success:function(result){
	        				if(result > 0){
		    	        		selectOptionList();
		    	        		console.log("성공");
	        				}
	    	        	},
	    	        	error:function(){
	    	        		console.log("ajax통신실패,,,");
	    	        	}
	        		});
        		}else{
        			alert("삭제할 옵션이 없습니다.");
        		}
        	}
        }
    </script>
    
</body>

</html>