<%@page import="com.kh.myPage.model.vo.Cart"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.kh.product.model.vo.Review"%>
<%@page import="com.kh.product.model.vo.Option"%>
<%@page import="com.kh.product.model.vo.Product"%>
<%@page import="com.kh.product.model.vo.ProductImage"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<Cart> caList = (ArrayList<Cart>)request.getAttribute("caList");
	ArrayList<ProductImage>imgList = (ArrayList<ProductImage>)request.getAttribute("imgList");
	Product p = (Product)request.getAttribute("product");
	ArrayList<Option> opList = (ArrayList<Option>)request.getAttribute("opList");
	ArrayList<Review> reviewList = (ArrayList<Review>)request.getAttribute("reviewList");
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

    #product_discount {
      color: pink;
      font-size: 25px;
      text-align: left;
    }

    #originalPrice {
      font-size: 25px;
      color: gray;
      text-decoration: line-through;
      padding-left: 30px;
      padding-right: 0px;
      padding-top: 5px;
      padding-bottom: 30px;
      text-align: right;

    }

    #discountPrice {
      font-size: 30px;
      font-weight: 900;
      padding-left: 15px;
      text-align: right;
    }

    #topLine {
      border-top: 1px solid gray;

    }

    #max_discount {
      font-size: 20px;
      font-weight: 700;
      text-align: left;
      padding-top: 20px;
      padding-bottom: 30px;
    }

    #max_price {
      font-size: 25px;
      font-weight: 800;
      color: pink;
      text-align: right;
      padding-top: 20px;
    }

    #max_mileage {
      font-size: 14px;
      color: gray;
      padding-bottom: 20px;
    }

    #mileage_price {
      font-size: 14px;
      text-align: right;
      color: gray;
    }

    #delivery_price {
      font-size: 14px;
      color: gray;
      padding-top: 10px;
      padding-bottom: 20px;
    }

    #freeShipping {
      font-size: 14px;
      color: gray;
      padding-top: 10px;
      text-align: right;
    }

    #payment {
      background-color: rgb(241, 241, 241);
    }

    #payment>div {
      padding-top: 10px;
      padding-bottom: 10px;
      font-weight: 600;
    }

    #payment table {
      font-size: 14px;
      text-align: left;
    }

    #photo-size>div {
      width: 90%;
      height: 50%;
      padding-right: 10px;
      padding-top: 40px;
      padding-bottom: 40px;
    }

    #input_logo {
      width: 90%;
      height: 10%;
    }

    #searchBar {
      padding-top: 50px;
    }

    #pay_button>div>button {
      width: 90%;
      height: 100%;
      background-color: pink;
      color: white;
      border: none;
    }

    .topLine2 {
      border-top: 1px solid rgb(169, 168, 168);
      margin-top: 20px;
    }

    .page-link {
      color: #000;
      background-color: #fff;
      border: 1px solid #ccc;
    }

    .page-item.active .page-link {
      z-index: 1;
      color: #555;
      font-weight: bold;
      background-color: #f1f1f1;
      border-color: #ccc;

    }

    .page-link:focus,
    .page-link:hover {
      color: #000;
      background-color: #fafafa;
      border-color: #ccc;
    }

    #star>span {
      color: palevioletred;
    }

    #modal_button>button {
      background-color: pink;
      color: white;
      border: none;
    }
   #photo-select>div{
    margin-top: 10px;
   
   }
   #photo-select div:hover{
   	cursor:pointer;
   	opacity:0.8;
   }
  </style>
</head>

<body>
	 <%@ include file = "../common/menubar.jsp" %>
  
  <div>
    <hr>
  </div>
  <div class="row">
    <div class="col-2">
      <div id="photo-select" style="text-align: right; margin-top: 20px;">
        <div>
          <img class="photo-s" src="<%=p.getProductImgSrc() %>" width="40%" height="40%" alt="">
        </div>
        <% for(ProductImage pi : imgList) { %>
        	<% if(pi.getImgType() == 2) {%>
        <div>
          <img class="photo-s" src="<%= pi.getProductImgSrc() %>" width="40%" height="40%" alt="">
        </div>
        	<% } %>
     	<% } %>
      </div>
      
    </div>
    <div class="col-5">
      
       
        <div id="photo-size">
          <div class="shadow p-3 mb-5 bg-body rounded">
            <img id="main-photo" src="<%= p.getProductImgSrc() %>" width="100%" height="80%"
              alt="...">
          </div>
         
        </div>
       
     
    </div>
    <div class="col-3">
      <div class="product_container"><%= p.getProductName() %></div>
      <div class="row">
        <div id="product_discount" class="col-2">
          <%= p.getProductDiscount() %>%
        </div>
        <div id="originalPrice" class="col-5">
         <%= df.format(p.getProductPrice()) %>원
        </div>
        <div id="discountPrice" class="col-5">
          <%= df.format(p.getProductPrice()*(((100-p.getProductDiscount())*0.01)))%>원
        </div>
        <div id="topLine"></div>
      </div>
      <div class="row">
        <div id="max_discount" class="col-6">
          최대할인가
        </div>
       
        <div id="max_price" class="col-6">
         <% if(p.getProductPrice()*(((100-p.getProductDiscount())*0.01))>loginUser.getMileage()){ %>
          <%= df.format(p.getProductPrice()*(((100-p.getProductDiscount())*0.01))-loginUser.getMileage())%>원
          <% } else { %>
          0원
          <% } %>
        </div>
      </div>
      <div class="row">
        <div id="max_mileage" class="col-6">
          보유 마일리지
        </div>
        <div id="mileage_price" class="col-6">
         <%= loginUser.getMileage()%>원
        </div>
        <div id="topLine"></div>
      </div>
      <div class="row">
        <div id="delivery_price" class="col-6">
          배송비
        </div>
        <div id="freeShipping" class="col-6">
          무료배송
        </div>
        <div id="payment" class="row">
          <div>결제수단 안내</div>
          <table id="payment2">
            <tr>
              <td height="30"> <span><img src="https://www.seoulstore.com/images/n_logo@3x.png" width="13%" height="60%"
                    alt=""></span>pay</td>
              <td>결제 시 네이버페이 포인트 적립</td>
            </tr>
            <tr>
              <td height="30">
                <div> <img src="https://www.seoulstore.com/images/kakaopay.png" width="30%" height="75%" alt=""></div>
              </td>
              <td>등록 된 모든 카드로 결제 가능</td>
            </tr>
            <tr>
              <td height="30">카드결제</td>
              <td>결제 시 최대 2~6개월 무이자 할부</td>
            </tr>
            <tr>
              <td height="30">무통장 입금</td>
              <td>신한,우리,국민 등 13개 은행 지원</td>
            </tr>
          </table>
        </div>
        <div class="row" id="pay_button" style="margin-top: 80px;">
          <div class="col">
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal"
              data-bs-whatever="@mdo">주문하기</button>
          </div>
        </div>
      </div>

    </div>
    <div class="col-2"></div>
    <div id="topLine"></div>
    <div class="row">
      <div class="col-2">
      </div>
      <div class="col-7" style="padding-top: 20px;">
        <nav>
          <div class="nav nav-tabs" id="nav-tab" role="tablist">
            <button class="nav-link active" id="nav-home-tab" data-bs-toggle="tab" data-bs-target="#nav-home"
              type="button" role="tab" aria-controls="nav-home" aria-selected="true" style="color : black">상품
              상세설명</button>
            <button class="nav-link" id="nav-profile-tab" data-bs-toggle="tab" data-bs-target="#nav-profile"
              type="button" role="tab" aria-controls="nav-profile" aria-selected="false"
              style="color : black">리뷰</button>

          </div>
        </nav>
        <div class="tab-content" id="nav-tabContent">
          <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab"
            tabindex="0">
            <% for(ProductImage pi : imgList){ %>
            <% if(pi.getImgType()==3){ %>
            <%=pi.getProductImgSrc()%>
            <% } %>
            <% } %>
          </div>
          <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab" tabindex="0">
           <% if(reviewList != null) { %>
            <% for(Review r : reviewList) { %>
            <div style="margin: 20px;" style="text-align: left;"><%= r.getMemname() %></div>
            <div style="font-size: 14px;"><%=r.getReviewDate() %></div>
            <div id="star">
            <% for(int i =0; i< r.getReviewStar() ;i++) {%>
            <span>★</span>
            <% } %>
            </div>
            <div class="topLine2"></div>
            <div style="margin-bottom: 30px; margin-top: 20px;"><%= r.getReviewContent() %>
           </div>
           <% if(r.getReviewImgSrc() != null) { %>
              <div> 
                <img src="<%= r.getReviewImgSrc() %>"  width="10%" height="10%" alt="">
              </div>
              <% } %>
              <% if(r.getReiviewAnsContent() != null) { %>
            <div style="margin: 20px;" style="text-align: left; font-weight: 800;"><span><img src="<%= contextPath%>/resources/img/logo1.png" width="4%" height="4%" alt=""></span> 내일뭐입지</div>
            <div style="font-size: 14px; margin-left: 20px;"><%= r.getReviewAnsDate() %></div>
            <div style="margin-bottom: 30px; margin-top: 20px; margin-left: 20px;">
             <%= r.getReiviewAnsContent() %></div>
        
              <% } %>
            <div class="topLine2"></div>
            <% } %>
            <nav id="page" aria-label="Page navigation example" style="color: plum; padding-top: 40px;">
              <ul class="pagination" style="justify-content: center;">
                <li class="page-item">
                  <a class="page-link" href="#" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                  </a>
                </li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item">
                  <a class="page-link" href="#" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                  </a>
                </li>
              </ul>
            </nav>
          
          <% } %>
        </div>
      </div>
      <div class="col-3">
      </div>
    </div>

      <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <div class="row">
                <div class="col-md-4">
                  <img src="<%= p.getProductImgSrc() %>" width="80%"
                    height="80%" alt="">
                </div>
                <div class="col-md-7" style="font-weight: 700; text-align: left;"><%=p.getProductName() %>
                  <div class="row">
                    <div class="col-md-4" style="text-align: left;"><%= df.format(p.getProductPrice()*(((100-p.getProductDiscount())*0.01)))%>원</div>
                  </div>
                </div>
                <div class="col-md-1"><button type="button" class="btn-close" data-bs-dismiss="modal"
                    aria-label="Close"></button></div>
              </div>
            </div>
            <div class="modal-body">
              <form action="<%=contextPath %>/insert.ca" method="post">
              <input type = "hidden" name = "mno" value="<%=loginUser.getMemNo()%>">
              <input type = "hidden" name = "pno" value="<%=p.getProductNo()%>">
                <div class="mb-3">
                  <select id="productSize" class="form-select" aria-label="Default select example" name="size" onchange="selectboxChange(this.value);">
                    <label for="message-text" class="col-form-label">사이즈(옵션)</label>
                   <% for(Option o : opList) { %>
                    <option value="<%= o.getOptionSize() %>"><%= o.getOptionSize() %></option>
                    <% } %>
                  </select>
                </div>
                <div class="mb-3">
                  <label for="message-text" class="col-form-label">수량</label>
                  <input type="number" id="productAmount" name="amount" min="0" max="20" step="1" value="1">
                </div>

            </div>
            <div class="modal-footer" id="modal_button">
              <button type="submit" class="btn btn-primary">장바구니 담기</button>
               </form>
              <button type="button" class="btn btn-primary" onclick="directPayment();">결제하기</button>
            </div>
          </div>
        </div>
      </div>
    <script>
      $(document).ready(function(){
        $(".photo-s").click(function(){
        let photo = $(this).attr("src")
        $('#main-photo').attr("src",photo);
      });
      });
     
     
       function selectboxChange(value){
    	  console.log(value);
    	  <% for(Option o: opList) { %>
		  if(value=="<%= o.getOptionSize() %>"){
			  $("#productAmount").attr("max","<%=o.getStock() %>");
		  }
		  <% } %>
		  $("#productAmount").val("1");
               }
       
       function directPayment(){
    	   let size = $("input[name=size]").val();
    	   location.href="<%= contextPath %>/list.pa?pno=<%= p.getProductNo() %>&size="+$("select[name=size]").val()+"&qnt="+$("input[name=amount]").val();
       }
       
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
      crossorigin="anonymous"></script>
</body>

</html>