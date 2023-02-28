<%@page import="java.text.DecimalFormat"%>
<%@page import="com.kh.payment.model.vo.Location"%>
<%@page import="com.kh.product.model.vo.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<Product> pList = (ArrayList<Product>)request.getAttribute("pList");
	ArrayList<Location> lList = (ArrayList<Location>)request.getAttribute("lList");
	DecimalFormat df = new DecimalFormat("###,###");
	int discountPrice = 0;
	int totalQnt = 0;
	int totalPrice = 0;
	for(Product p : pList){
		discountPrice += (p.getProductPrice()*(((100-p.getProductDiscount())*0.01))*p.getCartQnt());
		totalQnt += p.getCartQnt();
		totalPrice += p.getProductPrice()*p.getCartQnt();
	}
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

    #product_detail>div {
      text-align: left;
    }

    input.img-button {
      background: url("/team2_Project/resources/img/icons8-expand-arrow-26.png") no-repeat;
      border: none;
      width: 32px;
      height: 32px;
      cursor: pointer;
    }

    .estmtPyamn th {
      text-align: left;
    }

    .estmtPyamn td {
      text-align: right;
    }

    .topLine {
      border-top: 2px solid rgb(186, 185, 185);
      margin-top: 25px;
    }

    #orderInfo tr {
      text-align: left;
    }

    #delivery th {
      text-align: left;
    }

    #delivery td {
      text-align: left;
    }

    option {
      font-size: 12px;
    }

    input::-webkit-outer-spin-button,
    input::-webkit-inner-spin-button {
      -webkit-appearance: none;
      margin: 0;
    }

    /* Firefox  */
    input[type='number'] {
      -moz-appearance: textfield;
    }

    #payment {
      background-color: rgb(241, 241, 241);
      margin-top: 20px;
    }

    #payment>div {
      padding-top: 10px;
      padding-bottom: 10px;
      font-weight: 600;
    }

    #payment table {
      font-size: 14px;
      text-align: left;
      padding-left: 5px;
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
        결제
      </div>
    </div>
    <div class="row" style="padding-top: 40px;">
      <div class="col-1">

      </div>
      <div class="col-6">
        <div class="row">
          <div class="col-4" style="text-align: left; font-weight: 800;">
            주문상품정보
          </div>
          <div class="col-7">
            총<span><%= totalQnt %>개</span>/<span><%= df.format(discountPrice)%>원</span>
          </div>
          <div class="col-1">
            <input type="button" id="slide-button" class="img-button" onclick="slide();">
          </div>
        </div>
          <form>
        <div class="row" id="orderInformation" style="display: none">
         <% for(Product p : pList){ %>
         <input type="hidden" name="pno" value="<%=p.getProductNo() %>">
         <input type="hidden" name="psize" value="<%=p.getCartSize() %>">
         <input type="hidden" name="pqnt" value="<%=p.getCartQnt() %>">
          <div class="col-4">
            <div style="text-align: center;">
              <img src="<%=p.getProductImgSrc() %>" width="60%"
                height="100px" alt="">
            </div>
          </div>
          <div class="col-8" id="product_detail">
            <div style="margin-top: 10px; font-weight: 700;"><%= p.getBrandName() %></div>
            <div><%= p.getProductName() %></div>
            <table style="margin-top: 10px; margin-left: 5px;">
              <tr>
                <th width="102px" style="text-align: left; font-size: 16px;">size</th>
                <td style="font-size: 16px;"><%= p.getCartSize() %></td>
              </tr>
            </table>
            <div class="topLine">
              <table style="margin-top: 10px; margin-left: 5px;">
                <tr>
                  <th width="102px" style="text-align: left; font-size: 16px;">수량</th>
                  <td style="font-size: 16px;"><%= p.getCartQnt() %></td>
                </tr>
              </table>
            </div>
          </div>
          <br>
           <% } %>
        </div>
        <div class="topLine"></div>

        <div class="topLine" style="margin-top: 50px;"></div>
        <table id="orderInfo" style="margin-top: 20px; margin-left: 10px;">
          <tr>
            <th width="180" style="font-weight: 900; text-align: left; font-size: 20px;">주문자 정보</th>
          </tr>
          <tr>
            <th>이름</th>
            <td><input type="text" value="" name="order-name" placeholder="수취인 이름"></td>
          </tr>
          <tr>
            <th>이메일</th>
            <td> <input type="email" value=""></td>
          </tr>
          <tr>
            <th>전화번호</td>
            <td><input type="tel" name="order-phone" value=""></td>
          </tr>
        </table>
        <div class="topLine"></div>
        <table id="orderInfo" style="margin-top: 20px; margin-left: 10px;">
          <tr>
            <th width="180" style="font-weight: 900; text-align: left; font-size: 20px;">배송 정보</th>
            <td width="450" style="text-align: right;">
              <button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#exampleModal">배송지
                목록</button>
            </td>
          </tr>
        </table>
        <table id="delivery" style="margin-left: 100px;">
           <tr>
            <th height="40" width="50%"><input type="text" id="sample6_postcode" name="Lcode" placeholder="우편번호"></th>
            <td style="text-align: left;"><input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"></td>
          </tr>
          <tr>
            <td colspan="2" width="400" height="35"><input type="text" id="sample6_address" name="Laddress" placeholder="주소" style="width: 80%;"></td>
          </tr>
          <tr>
            <td width="400" height="35"><input type="text" id="sample6_detailAddress" name="Daddress" placeholder="상세주소" style="width: 100%;"></td>
            <td><input type="text" id="sample6_extraAddress" placeholder="참고항목"></td>
          </tr>
          <tr style="padding-top: 10px;">
            <td colspan="2" width="100" height="35" style="text-align: left;">
              <select id="delivery_select" class="form-select" aria-label="Default select example">
                <option selected>배송 시 요청사항을 적어주세요</option>
                <option value="1">부재 시 경비실에 맡겨주세요</option>
                <option value="2">부재 시 집앞에 놔주세요</option>
                <option value="3" onclick="directInput();">직접입력</option>
              </select>
            </td>
          </tr>
          <tr>
            <td colspan="2"><textarea name="" id="direct_input" cols="60" rows="4" style="display: none;"></textarea></td>
          </tr>
        </table>
        <div class="topLine"></div>
        <table id="orderInfo" style="margin-top: 20px; margin-left: 10px;">
          <tr>
            <th width="180" style="font-weight: 900; text-align: left; font-size: 20px; resize:none;">마일리지 사용</th>
          </tr>
          <tr>
            <td></td>
            <td><span>보유 마일리지</span> <span id="max-mileage"><%= loginUser.getMileage() %></span>원</td>
          </tr>
          <tr>
            <td></td>
            <td>
              <input type="number" id="input-mileage" name="amount" min="0" max="">
            </td>
          </tr>
          <tr>
            <td></td>
            <td>
              <div class="form-check">
                <input class="form-check-input" type="checkbox" value="" id="check-mileage" onclick="mileage();">
                <label class="form-check-label" for="check-mileage">
                  전액 사용하기
                </label>
              </div>
            </td>
          </tr>
        </table>
        <div class="topLine" style="margin-bottom: 100px;"></div>
      </div>
      <div class="col-3" style="margin-left: 20px;">
        <div style="font-weight: 600; padding-bottom: 20px; text-align: left;">최종 결제금액</div>
        <table class="estmtPyamn">
          <tr>
            <th>주문 상품 수</th>
            <td width="170" height="40"><%= totalQnt %>개</td>
          </tr>
          <tr>
            <th>주문금액</th>
            <td id="order-price" height="40"><%= df.format(discountPrice)%>원</td>
          </tr>
          <tr>
            <th>배송비</th>
            <td height="40">무료</td>
          </tr>
          <tr>
            <th>할인금액</th>
            <td height="40"><%= df.format(totalPrice-discountPrice)%>원</td>
          </tr>
        </table>
        <div class="topLine"></div>
        <table class="estmtPyamn" style="margin-top: 15px;">
          <tr>
            <th>적립금 할인</th>
            <td id="discount-mileage" width="170" height="40">0원</td>
          </tr>
          <tr>
            <th>적립 마일리지</th>
            <td height="40"><%= df.format(discountPrice/100)%>원</td>
          </tr>
        </table>
        <div class="topLine"></div>
        <table class="estmtPyamn" style="margin-top: 15px;">
          <tr>
            <th>최종 결제금액</th>
            <td id=final-payment width="170" height="40"><%= df.format(discountPrice)%>원</td>
          </tr>
        </table>
        <div class="topLine"></div>
        <div style="font-size: 23px; text-align: left; margin-top: 20px; font-weight: 549;">결제수단</div>
        <div class="topLine"></div>
        <div id="payment" class="row">
          <div>결제수단 안내</div>
          <table id="payment2">
            <tr>
              <td width="100" height="30"> <span><img src="https://www.seoulstore.com/images/n_logo@3x.png" width="15%"
                    height="60%" alt=""></span> pay</td>
              <td>결제 시 네이버페이 포인트 적립</td>
            </tr>
            <tr>
              <td height="30">
                <div> <img src="	https://www.seoulstore.com/images/kakaopay.png" width="40%" height="80%" alt=""></div>
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
        <div style="margin-top: 15px;">
          <div class="form-check">
            <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
            <label class="form-check-label" for="flexCheckDefault">
              주문내용 확인 및 결제 동의(전체 동의)
            </label>
          </div>
        </div>
        <div class="d-grid gap-2 col-6 mx-auto" style="margin-top: 20px; margin-bottom: 50px;">
          <button class="btn btn-primary" type="submit"
            style="background-color: pink; border-color: pink;">결제하기</button>
        </div>
      </div>
      </form> 
      <div class="col-2">

      </div>
    </div>
  </div>

  <!-- Modal -->
  <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h1 class="modal-title fs-5" id="exampleModalLabel">배송지 목록</h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
			
			<div>
			 
			 <table class="table">
  			<thead class="table-light">
  			<tr>
  			 <th>수령인</th>
  			 <th>우편번호</th>
  			 <th>주소</th>
  			 <th>전화번호</th>
  			 <th></th>
  			 </tr>
 			 </thead>
 			 <tbody>
 			 <% for(Location l : lList){ %>
 			 <label for="radio1">
 			 <tr>
   				 <td>
   				 <div class="loc-name" style="font-weight: 600;"><%=l.getLocName()%></div>
   				 </td>
   				  <td>
   				  <div class="post-code"><%=l.getLocPostCode() %> </div>
   				  </td>
   				   <td>
   				     <div class="nomal-address"><%=l.getLocAddress() %></div>
                     <div class="detail-address"><%=l.getLocAddressDtl() %></div>
   				   </td>
   				    <td>
   				    <div class="loc-phone"><%=l.getLocPhone() %> </div>
   				    </td>
   				     <td>  <input type="radio" name="address" value="<%= l.getLocNo() %>"></td>
   				     <tr>
   				     <% } %>
  			</tbody>
			</table>
          </label>
			</div>
         
			

        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-primary" id="location-btn" data-bs-dismiss="modal" aria-label="Close">선택하기</button>
        </div>
      </div>
    </div>
  </div>
  <script>
  let finalPrice = 0;
    function slide() {
      if ($("#orderInformation").css("display") == "none") {
        $("#orderInformation").slideDown(200);
        $("#orderInformation").show();
      } else {
        $("#orderInformation").slideUp(200);
      }
    }
    $(document).ready(function () {
      $('#delivery_select').change(function () {
        var result = $('#delivery_select option:selected').val();
        if (result == '3') {
          $('#direct_input').show();
        } else {
          $('#direct_input').hide();
        }
      });
    });

    function mileage() {
      if (!$('#check-mileage').is(':checked')) {
        $('#input-mileage').val('');
        $("#discount-mileage").text("0원");
        $("#final-payment").text($("#order-price").text());
      } else {
        let mileage = $('#max-mileage').html();
        $('#input-mileage').val(mileage);
        $("#discount-mileage").text($("#input-mileage").val()+"원");
        finalPrice = ((<%=discountPrice%>-$("#input-mileage").val())+'').replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        $("#final-payment").text(finalPrice+"원");
      }
    }

    $("#input-mileage").change(function(){
    	if($("#input-mileage").val()><%=loginUser.getMileage() %>){
    		 $('#input-mileage').val('');
    	        $("#discount-mileage").text("0원");
    	        $("#final-payment").text($("#order-price").text());
    	}else{
    	console.log($("#input-mileage").val());
    	$("#discount-mileage").text($("#input-mileage").val()+"원");
    	finalPrice = ((<%=discountPrice%>-$("#input-mileage").val())+'').replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    	$("input:checkbox[id='check-mileage']").prop("checked", false); 
    	$("#final-payment").text(finalPrice+"원");
    }
    })
    
    $("#location-btn").click(function(){
    	$("input[name=address]").each(function(){
    		if($(this).is(":checked") == true){
    			$("#sample6_postcode").val($(this).parents('tr').find($(".post-code")).text())
    			$("#sample6_address").val($(this).parents('tr').find($(".nomal-address")).text())
    			$("#sample6_detailAddress").val($(this).parents('tr').find($(".detail-address")).text())
    			$("input[name=order-name]").val($(this).parents('tr').find($(".loc-name")).text())
    			$("input[name=order-phone]").val($(this).parents('tr').find($(".loc-phone")).text())
    		}
    	})
    })
  </script>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
    crossorigin="anonymous"></script>
</body>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>

</html>