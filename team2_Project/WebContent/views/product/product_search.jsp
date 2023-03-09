<%@page import="java.text.DecimalFormat"%>
<%@page import="com.kh.product.model.vo.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int value = 0;
	ArrayList<Product> list = (ArrayList<Product>)request.getAttribute("list");
	String product = (String)request.getAttribute("product");
	int pCount = (int)request.getAttribute("pCount");
	if(request.getAttribute("value") != null){
		value =(int)request.getAttribute("value");
	}
	DecimalFormat df = new DecimalFormat("###,###");
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
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

        .product_link {
            text-decoration: none;
            color: black;
        }

        .product_link:hover {
            text-decoration: underline
        }
        
         a#MOVE_TOP_BTN {
	    position: fixed;
	    right: 2%;
	    bottom: 50px;
	    display: none;
	    z-index: 999;
		}
    </style>
</head>

<body>
    <%@ include file = "../common/menubar.jsp" %>

    <div class="container text-center">
        <div class="row">
            <div class="col">
                <div style="margin-top: 30px; margin-bottom: 60px;"><span style="font-weight:800;"><%= product %></span> <br>
                    에 대한 검색 결과 입니다.</div>

                <div style="text-align: left; margin-bottom: 20px;">상품
                    <span style="color: plum;"><%= pCount %></span>
                </div>
                <div class="col-2">
                    <select id="productSorting" class="form-select form-select-lg mb-3" aria-label=".form-select-lg example" onchange="selectboxChange(this.value);">
                        <option selected>상품 정렬</option>
                        <option value="1">조회순</option>
                        <option value="2">가격 낮은순</option>
                        <option value="3">가격 높은순</option>
                    </select>
                </div>

				
				 <script>
               function selectboxChange(value){
            	   console.log(value);
            	   if(value == "1"){
            		   location.href='<%= contextPath %>/search.pr?product=<%= product %>&val=1';
            	   }else if(value == "2"){
            		   location.href='<%= contextPath %>/search.pr?product=<%= product %>&val=2';
            	   }else if(value == "3"){
            		   location.href='<%= contextPath %>/search.pr?product=<%= product %>&val=3';
            	   }
               }
                
               $(function(){
             	  $("#productSorting option").each(function(){
             		  if($(this).val()==<%= value %>){
             			  $(this).prop("selected",true);
             		  }
             	  })
               })
                </script>
                
                <div class="row" id="product-list">
                      <% for(Product p : list) { %>
                    <div class="col" style="margin-bottom: 30px;">
                        <div class="card" style="width: 18rem;">
                            <a href="<%= contextPath %>/product.pr?pno=<%= p.getProductNo()%>"><img
                                    src="<%=contextPath +'/'+ p.getFilePath() + p.getChangeName() %>"
                                    class="card-img-top" alt="..."></a>
                            <div class="card-body">
                                <a href="<%= contextPath %>/product.pr?pno=<%= p.getProductNo()%>" class="product_link">
                                    <h5 class="card-title" style="text-align: left; font-weight: 600; font-size: 18px;">
                                        <%=p.getBrandName() %></h5>
                                </a>
                              <a href="<%= contextPath %>/product.pr?pno=<%= p.getProductNo()%>"><div style="text-align: left; color: gray;"><%=p.getProductName() %></div></a>  
                               <div style='color:gray; text-decoration:line-through; text-align: left; font-weight: 600;'><%=df.format(p.getProductPrice())%></div>
                                <div style="text-align: left; font-weight: 600; color: plum;"><%=p.getProductDiscount() %>%
                                    <span><%= df.format(p.getProductPrice()*(((100-p.getProductDiscount())*0.01))) %></span>
                                </div>
                            </div>
                        </div>
                    </div>
					<% } %>
					 <div>
                     <a id="MOVE_TOP_BTN" href="#" class="btn btn-dark" style="border-radius: 50px;">TOP</a>
                    </div>
                </div>

            </div>
        </div>
    </div>
    
    <script type="text/javascript">
    
    $(function() {
        $(window).scroll(function() {
            if ($(this).scrollTop() > 500) {
                $('#MOVE_TOP_BTN').fadeIn();
            } else {
                $('#MOVE_TOP_BTN').fadeOut();
            }
        });
        
        $("#MOVE_TOP_BTN").click(function() {
            $('html, body').animate({
                scrollTop : 0
            }, 50);
            return false;
        });
    });
  
    var page = 1;
	$(window).scroll(function() {
    if ($(window).scrollTop() == $(document).height() - $(window).height()) {
    	page += 1;
  	  console.log(page)
     $.ajax({
    	 url:"ajaxProduct.pr",
    	 data : {'page' : page,
    		 	'product' :"<%= product %>",
    		 	'val' : $("#productSorting option:selected").val()},
    	 type : "get",
    	 success:function(result){	
    		 console.log('성공');
    		 console.log(result);
    		 let length = result.length;
    		 for(var i = 1 ;i<length;i++) {
    			 $("#product-list").append(
    					 "<div class='col' style='margin-bottom: 30px;'>"+
    	                 "<div class='card' style='width: 18rem;'>"+
    	                     "<a href='<%= contextPath %>/product.pr?pno=" + result[i].productNo +" ' >"+
    	                     "<img src= " +
    	                    "<%= contextPath %>" + 
    	                     '/'+
    	                     result[i].filePath + 
    	                     result[i].changeName + 
    	                     " class='card-img-top'>"+
    	                     "</a>" +
    	                     "<div class='card-body'>"+
    	                        "<a href='<%= contextPath %>/product.pr?pno=" + result[i].productNo +"' class='product_link'>" +
    	                             "<h5 class='card-title' style='text-align: left; font-weight: 600; font-size: 18px;'>"+
    	                                 result[i].brandName +
    	                                 "</h5>"+
    	                         "</a>"+
    	                        "<a href='<%= contextPath %>/product.pr?pno=" + result[i].productNo +"'>"+ 
    	                        "<div style='text-align: left; color: gray;'>"+
    	                        result[i].productName+
    	                        "</div>"+
    	                        "</a>"+
    	                        "<div class='test1' style='color:gray; text-decoration:line-through; text-align: left; font-weight: 600;'>" +
   	                       		  result[i].productPrice +' ' +
   	                         	"</div>" +
    	                         "<div style='text-align: left; font-weight: 600; color: plum;'>"+
    	                         "<div class='test1';'>" +
    	                         result[i].productDiscount +'% ' +
    	                         "<span class='test1 style='display:inline;'>"+
	                             result[i].productPrice*(100-result[i].productDiscount)*0.01 + 
	                             "</span>"+
    	                         "</div>" +
    	                         "</div>"+
    	                         
    	                     "</div>"+
    	                 "</div>"+
    	                 "</div>"	 
    			);
    		  };
 
    		  $(".test1").each(function(){
    			  let test2 = ($(this).text()+'').replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    			  $(this).text(test2);
    		  })
 		},
 		error:function(){
			console.log("ajax 통신 실패");
		}
     })
    }
});
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
</body>

</html>