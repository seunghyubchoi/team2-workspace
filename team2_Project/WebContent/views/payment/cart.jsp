<%@page import="java.text.DecimalFormat"%>
<%@page import="com.kh.myPage.model.vo.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<Cart> list =(ArrayList<Cart>)request.getAttribute("list");
	DecimalFormat df = new DecimalFormat("###,###");
	int count = 1;
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

    #product_detail {
      text-align: left;
    }

    .estmtPyamn th {
      text-align: left;
    }

    .estmtPyamn td {
      text-align: right;
    }
  </style>
</head>

<body>
   <%@ include file = "../common/menubar.jsp" %>

  <div class="container text-center">
    <div class="row">
      <div class="col-1">
      </div>
      <div class="col-11" style="text-align: left; padding-top: 20px; font-size: 25px; font-weight: 800;">
        장바구니
      </div>
    </div>
    <div class="row" style="padding-top: 40px;">
      <div class="col-1">
      </div>
      <div class="col-8">
        <table class="table">
          <thead>
            <tr>
              <th scope="col">전체 <%= list.size() %>개 </th>
              <th scope="col">
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" value="" id="cbx_chkAll">
                </div>
              </th>
              <th scope="col">상품명(옵션)</th>
              <th scope="col">판매가</th>
              <th scope="col" width="20">수량</th>
              <th scope="col" width="100">적립금액</th>
              <th scope="col" width="90">배송비</th>
            </tr>
          </thead>
          <tbody>
          <form action="<%=contextPath %>/delete.ca" method="post">
          <input type="hidden" name="mno" value="<%=loginUser.getMemNo() %>">
          <% for(Cart c : list){ %>
            <tr>
              <th scope="row"><%= count %></th>
              <td>
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" name="chk" value="<%= c.getCartNo() %>" id="flexCheckDefault">
                </div>
              </td>
              <td>
                <div class="row">
                  <div class="col-5">
                    <div style="text-align: left;">
                      <img src="<%= c.getProductImgSrc() %>"
                        width="100%" height="90px" alt="">
                    </div>
                  </div>
                  <div class="col-7" id="product_detail">
                    <div style="font-weight: 600;">[<%= c.getBrandName() %>] <%= c.getProductName() %></div>
                    <div style="font-size: 14px; color: gray;">사이즈 : <%= c.getCartSize() %></div>
                  </div>

                </div>
              </td>
              <td> <%= df.format(c.getProductPrice()*(((100-c.getProductDiscount())*0.01))*c.getCartQnt())%>원</td>
              <td>
                <div class="count-wrap _count">
                <input type="number" id="productAmount" name="amount" min="1" max="" step="1" value="<%=c.getCartQnt()%>" onchange="changeQnt(this.value,cartNo)">
                </div>
              </td>
              <td><%= df.format(c.getProductPrice()*(((100-c.getProductDiscount())*0.01))/100*c.getCartQnt()) %>원</td>
              <td> 무료</td>
            </tr>
            <% count++; %>
            <% } %>
          </tbody>
        </table>
        <div style="text-align: left;">
          <button type="submit" class="btn btn-secondary" onclick="return  alertMsg();">선택 삭제</button>
        </div>
        </form>
      </div>
      <div class="col-3">
        <div style="font-weight: 600; padding-bottom: 10px; text-align: left;">최종 결제금액</div>
        <table class="estmtPyamn" style="color: grey;">
          <tr>
            <th>주문 상품 수</th>
            <td width="170" height="40">1개</td>
          </tr>
          <tr>
            <th>주문금액</th>
            <td height="40">49,000원</td>
          </tr>
          <tr>
            <th>배송비</th>
            <td height="40">무료</td>
          </tr>
          <tr>
            <th>적립 마일리지</th>
            <td height="40">0원</td>
          </tr>
        </table>
        <div class="d-grid gap-2" style="margin-top: 20px;">
          <button class="btn btn-primary" type="button" style="background-color: pink; border-color: pink;">결제하러
            가기</button>
        </div>
      </div>
    </div>
  </div>

  <script>

    $(document).ready(function () {
      $("#cbx_chkAll").click(function () {
        if ($("#cbx_chkAll").is(":checked")) $("input[name=chk]").prop("checked", true);
        else $("input[name=chk]").prop("checked", false);
      });

      $("input[name=chk]").click(function () {
        var total = $("input[name=chk]").length;
        var checked = $("input[name=chk]:checked").length;

        if (total != checked) $("#cbx_chkAll").prop("checked", false);
        else $("#cbx_chkAll").prop("checked", true);
      });
    });
    
    function alertMsg(){
    	if(confirm("정말 삭제하시겠습니까?")){
    		
    	}else{
    		return false;
    	}
    }
    
    function changeQnt(value,cartNo){
    	$.ajax({
    		url:"update.ca",
    		data:{qnt : value
    			cno : cartNo
    		},
    		type : "get",
    		success:function(a){
    			
    		},
    		error:function(){
    			console.log("ajax 통신 실패");
    		}
    		
    	})
    }
  </script>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
    crossorigin="anonymous"></script>
</body>

</html>