<%@page import="java.text.DecimalFormat"%>
<%@page import="com.kh.product.model.vo.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<Product> list = (ArrayList<Product>)request.getAttribute("list");
	String cname = (String)request.getAttribute("cname");
    DecimalFormat df = new DecimalFormat("###,###");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <style>
        .input-box {
            display: flex;
            margin: 15px;
            width: 400px;
            padding: 6px;
            border-radius: 15px;
            border: 1px solid #e2e2e2;
        }

        .input-box i {
            flex: 1;
        }

        .input-box input {
            flex: 7;
            border: none;
            outline: none;
        }

        .product_container {

            font-size: 18px;
            font-weight: 700;
            line-height: 1.5;
            padding-top: 30px;
            padding-bottom: 30px;
        }

        #searchBar {
            padding-top: 50px;
        }

        #category_link {
            text-align: left;
            padding-left: 40px;
            padding-top: 30px;
            color: gray;
            font-size: 20px;
            font-weight: 570;
        }

        #category_link div {
            padding-top: 15px;
        }

        #category_link a {
            text-decoration: none;
            color: gray
        }

        .product_link {
            text-decoration: none;
            color: black;
        }

        .product_link:hover {
            text-decoration: underline
        }
        #category_link div{
        	cursor:pointer
        }
    </style>
</head>

<body>
    <%@ include file = "../common/menubar.jsp" %>

    <div class="container text-center">
        <div class="row">
            <div class="col-3">
                <div id="category_link">
                        <div>아우터</div>
                    
                        <div>상의</div>
    
                   
                        <div>하의</div>
                  
                    
                        <div>신발</div>
                    
                    
                        <div>악세사리</div>
               
                </div>
				<script>
				$(function(){
					$("#category_link div").click(function(){
						location.href='<%= contextPath %>/category.pr?cname=' + $(this).text();
					})
				})
				
				</script>
            </div>
            <div class="col-9">
                <div class="col-2">
                    <div style="padding-top: 35px;">
                        <select class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">
                            <option selected>상품 정렬</option>
                            <option value="1">조회순</option>
                            <option value="2">가격 낮은순</option>
                            <option value="3">가격 높은순</option>
                        </select>
                    </div>
                </div>
                <div class="row">
                <% for(Product p : list) { %>
                    <div class="col" style="margin-bottom: 30px;">
                        <div class="card" style="width: 18rem;">
                            <a href="#"><img
                                    src="<%=p.getProductImgSrc() %>"
                                    class="card-img-top" alt="..."></a>
                            <div class="card-body">
                                <a href="#" class="product_link">
                                    <h5 class="card-title" style="text-align: left; font-weight: 600; font-size: 18px;">
                                        <%=p.getBrandName() %></h5>
                                </a>
                                <div style="text-align: left; color: gray;"><%=p.getProductName() %></div>
                                <div style="text-align: left; font-weight: 600; color: plum;"><%=p.getProductDiscount() %>%
                                    <span><%= df.format(p.getProductPrice()*(((100-p.getProductDiscount())*0.01))) %></span>
                                    <span style="color: gray;"><%=df.format(p.getProductPrice())%></span>
                                </div>
                            </div>
                        </div>
                    </div>
					<% } %>
                </div>
            </div>
        </div>
    </div>
	<script>
	$(function(){
		$("#category_link div").each(function(){
			if($(this).text() == "<%= cname %>" ){
				$(this).css({"color":"black","font-size":"25px","font-weight" : "900"});
			}
		})
	})
	</script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
</body>
</html>