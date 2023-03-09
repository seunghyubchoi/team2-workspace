<%@page import="com.kh.payment.model.vo.ReturnA"%>
<%@page import="com.kh.payment.model.vo.OrderA"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%
	OrderA o = (OrderA)request.getAttribute("o");

	if(o.getRcpMsg() == null){
		o.setRcpMsg("");
	}
	
	if(o.getRcpAddressName() == null){
		o.setRcpAddressName("");
	}
	
	ReturnA r = (ReturnA)request.getAttribute("r");
%>
<!DOCTYPE html>
<html lang="ko">

<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>주문수정</title>

    <!-- 다음 우편번호 API를 사용하기 위한 script -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</head>

<body id="page-top">
            
    <!-- Page Wrapper -->
    <div id="wrapper" style="display: flex;">

        <!-- include common element  -->
        <%@ include file="adminCommon.jsp" %>

        <script>
            $(function(){
                sidebarActiveDelete();
                sidebarActive("#order");
            })
        </script>

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <div class="input-group" style="padding-top: 10px;">
                        <h2 class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100">주문관리</h2>
                    </div>
                    <div class="input-group" style="padding-top: 10px;">
                        <a class="d-none d-sm-inline-block form-inline ml-auto my-2 mr-3 my-md-0 mw-100" href="#" data-toggle="modal" data-target="#logoutModal" id="logoutBtn">로그아웃</a>
                    </div>

                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
            
                <div class="container-fluid mb-5">

                    <div class="content-wrapper">
                        <form action="update.od" method="post">
                            <input type="hidden" name="memNo" value="<%= o.getMemNo()%>"> 
                            <h6 style="color: #635566;"><b>주문정보</b></h6>
                            <div id="orderInfo" class="display-flex">
                                <table class="table table-primary table-bordered input-w-100">
                                    <tr>
                                        <td>주문번호</td>
                                        <td><%= o.getOrderNo() %></td>
                                        <input type="hidden" name="orderNo" value="<%= o.getOrderNo() %>">
                                        <td>주문자성함</td>
                                        <td><%= o.getMemName() %></td>
                                    </tr>
                                    <tr>
                                        <td>주문날짜</td>
                                        <td><%= o.getOrderDate() %></td>
                                        <td>이메일주소</td>
                                        <td><%= o.getEmail() %></td>
                                    </tr>
                                    <tr>
                                        <td>주문상태</td>
                                        <td>
                                            <select name="orderStatus" id="orderStatus">
                                            <option>상품준비중</option>
                                            <option>배송중</option>
                                            <option>배송완료</option>
                                            <option>취소완료</option>
                                            <option>교환요청</option>
                                            <option>교환중</option>
                                            <option>교환완료</option>
                                            <option>환불요청</option>
                                            <option>환불중</option>
                                            <option>환불완료</option>
                                            </select>
                                        </td>
                                        <td>전화번호</td>
                                        <td><%= o.getPhone() %></td>
                                </table>
                            </div>
                            <hr class="hr-3">
                            
                            <div id="orderProductInfo">
                                <h6 style="color: #635566;"><b>주문상품정보</b></h6>
                                <div id="orderProductList">
    
                                </div>
                            </div>
    
                            <hr class="hr-3">
    
                            <div id="returnProductInfo">
                                <h6 style="color: #635566;"><b>취소/환불 상품정보</b></h6>
                                <div id="returnProductList">
                                    
                                </div>
                            </div>
                            
                            <hr class="hr-3">
    
                            <div id="orderLocationInfo" class="display-flex input-w-100">
                                <div style="width: 15%;">
                                    <h6 style="color: #635566;"><b>배송정보</b></h6>
                                </div>
                                <div style="width: 70%;">
                                    <table class="table table-primary table-bordered input-w-100">
                                        <tr>
                                            <td><input type="text" class="input" name="locationAddressName" value="<%= o.getRcpAddressName()%>"></td>
                                        </tr>
                                        <tr>
                                            <td><input type="text" class="input" name="locationName" value="<%= o.getRcpName()%>"></td>
                                        </tr>
                                        <tr>
                                            <td><input type="text" class="input" name="locationPhone" value="<%= o.getRcpPhone()%>"></td>
                                        </tr>
                                        <tr>
                                            <td><input type="text" id="sample6_address" name="rcpAddress" value="<%= o.getRcpAddress() %>" readonly></td>
                                            <td><button type="button" class="btn btn-secondary btn-sm" onclick="sample6_execDaumPostcode();">주소변경</button></td>
                                        </tr>
                                        <tr>
                                            <td><input type="text" id="sample6_detailAddress" name="rcpAddressDtl" value="<%= o.getRcpAddressDtl() %>"></td>
                                        </tr>
                                        <tr>
                                            <td><input type="text" id="sample6_postcode" name="rcpPostCode" value="<%= o.getRcpPostCode() %>" readonly></td>
                                        </tr>
                                        <tr>
                                            <td><input type="text" class="input"  name="locationMsg" value="<%= o.getRcpMsg() %>"></td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
    
                            <hr class="hr-3">
    
                            <div id="orderPayInfo" class="display-flex">
                                <div style="width: 15%;">
                                    <h6 style="color: #635566;"><b>결제정보</b></h6>
                                </div>
                                <div style="width: 85%;">
                                    <table class="table table-primary table-bordered">
                                        <tr>
                                            <td>주문상품 수량</td>
                                            <td class="text-right" id="orderStock"></td>
                                            <input type="hidden" name="orderQnt" id="orderStock">
                                        </tr>
                                        <tr>
                                            <td>주문금액</td>
                                            <td class="text-right" id="originPrice"></td>
                                        </tr>
                                        <tr>
                                            <td>환불금액</td>
                                            <td class="text-right" id="returnPrice"></td>
                                        </tr>
                                        <tr>
                                            <td>할인금액</td>
                                            <td class="text-right" id="discountPrice" style="color: red;"></td>
                                        </tr>
                                        <tr>
                                            <td>적립금할인</td>
                                            <td class="text-right">- <%= o.getUseMileage() %> 원</td>
                                        </tr>
                                        <tr>
                                            <td>적립포인트</td>
                                            <td class="text-right" id="saveMilegae"></td>
                                            <input type="hidden" name="saveMileage">
                                        </tr>
                                        <tr>
                                            <td>최종결제금액</td>
                                            <td class="text-right" id="totalPrice"></td>
                                        </tr>
                                    </table>
                                </div>
                            </div>

                            <hr class="hr-3">
							<% if(r != null){ %>
	                            <div id="returnInfo" class="display-flex">
	                                <div style="width: 15%;">
	                                    <h6 style="color: #635566;"><b>교환/반품정보</b></h6>
	                                </div>
	                                <div style="width: 85%;">
	                                    <table class="table table-primary table-bordered">
	                                        <tr>
	                                            <td>구분</td>
	                                            <td class="text-right"><%= r.getReturnStatus() %></td>
	                                        </tr>
	                                        <tr>
	                                            <td>상품</td>
	                                            <td class="text-right"><%= r.getDtlOrderNo() %></td>
	                                        </tr>
	                                        <tr>
	                                            <td>사유</td>
	                                            <td class="text-right"><%= r.getReturnReason() %></td>
	                                        </tr>
	                                    </table>
	                                </div>
							<%} %>
                            </div>
                            <div class="table-buttons mr-0 ml-auto" align="right">
                                <button type="button" class="btn btn-secondary" data-toggle="modal"
                                    data-target="#backModal">뒤로가기</button>
                                <button type="submit" class="btn btn-primary">수정</button>
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
        let options = new Array();

        $(function(){
            selectOrderDetailList();

            const status = "<%= o.getOrderStatus()%>";
            $("#orderStatus").children().each(function () {
                if ($(this).text() == status) {
                    $(this).prop("selected", true);
                }
            });
            
            if(status == '교환요청' || status == '환불요청'){

            }
        });

        function selectOrderDetailList(){
        	$.ajax({
	        	url:"selectDtlList.od",
	        	data:{
	        		ono:<%= o.getOrderNo() %>
	        	},
                type:"post",
                async:false,
	        	success:function(odList){
                    options = [];
	        		let odProduct = "";
	        		let reProduct = "";
	        		for(let i = 0; i < odList.length; i++){
                        var product = selectProduct(odList[i].productNo);
                        var optionList = selectOptionList(odList[i].productNo);
                        options.push(odList[i].dtlSize);
                        if(odList[i].delYn == 'N'){
                            odProduct += '<table class="table table-primary table-bordered">'
                                  +       '<tr>'
                                  +             '<td>브랜드</td>'
                                  +             '<td>' + product.brandNo + '</td>'
                                  +             '<td>수량</td>'
                                  +             '<td><input type="number" class="stock orderStock" name="dtlQnt' + i + '" value="' + odList[i].dtlQnt + '"></td>'
                                  +             '<td><button type="button" class="btn btn-primary" onclick="updateOrderDtl(' + i + ');">수정하기</button></td>'
                                  +         '</tr>'
                                  +         '<tr>'
                                  +             '<td>상품명</td>'
                                  +             '<td> ' + product.productName + '</td>'
                                  +             '<td>옵션</td>'
                                  +             '<td>'
                                  +                 '<select name="dtlSize' + i + '" id="option' + i + '">'
                                  +                     selectOptionList(odList[i].productNo)
                                  +                 '</select>'
                                  +             '</td>'
                                  +             '<td><button type="button" class="btn btn-warning" onclick="deleteOrderDtl(' + i + ');">부분환불</button></td>'
                                  +             '<input type="hidden" name="orderDtlNo' + i + '" value="' + odList[i].orderDtlNo + '">'
                                  +             '<input type="hidden" class="orderPrice originPrice" id="originPrice' + i + '"value="' + (Number(product.productPrice) * Number(odList[i].dtlQnt)) + '">'
                                  +             '<input type="hidden" class="orderDiscount" id="discountPrice' + i + '"value="' + (Number(product.productPrice) * Number(product.productDiscount) / 100) + '">'
                                  +         '</tr>'
                                  +     '</table>';
                        }else{
                            reProduct += '<table class="table table-primary table-bordered">'
                                  +       '<tr>'
                                  +             '<td>브랜드</td>'
                                  +             '<td>' + product.brandNo + '</td>'
                                  +             '<td>수량</td>'
                                  +             '<td><input type="number" class="stock returnStock" name="dtlQnt' + i + '" value="' + odList[i].dtlQnt + '"></td>'
                                  +             '<td><button type="button" class="btn btn-primary" disabled>수정하기</button></td>'
                                  +         '</tr>'
                                  +         '<tr>'
                                  +             '<td>상품명</td>'
                                  +             '<td> ' + product.productName + '</td>'
                                  +             '<td>옵션</td>'
                                  +             '<td>'
                                  +                 '<select name="dtlSize' + i + '" id="option' + i + '">'
                                  +                     selectOptionList(odList[i].productNo)
                                  +                 '</select>'
                                  +             '</td>'
                                  +             '<td><button class="btn btn-warning" disabled>취소완료</button></td>'
                                  +             '<input type="hidden" name="orderDtlNo' + i + '" value="' + odList[i].orderDtlNo + '">'
                                  +             '<input type="hidden" class="returnPrice originPrice" id="originPrice' + i + '"value="' + (Number(product.productPrice) * Number(odList[i].dtlQnt)) + '">'
                                  +             '<input type="hidden" class="returnDiscount" id="discountPrice' + i + '"value="' + (Number(product.productPrice) * Number(product.productDiscount) / 100) + '">'
                                  +         '</tr>'
                                  +     '</table>';
                        }
                    }

                    $("#orderProductList").html(odProduct);
                    $("#returnProductList").html(reProduct);

                    for(let i = 0 ; i < options.length; i++){
                        const op = options[i];
                        $("#option" + i).children().each(function () {
                            if ($(this).val() == op) {
                                $(this).prop("selected", true);
                            }
                        });
                    }
                    
                    calPrice(odList.length);
                                
	        	},
	        	error:function(){
	        		console.log("ajax통신실패1,,,");
	        	}
        	});
        }

        function selectOptionList(productNo){
            var resultO = "";

            $.ajax({
                url:"select.op",
                data:{
                    pno:productNo
                },
                type:"post",
                async:false,
                success:function(opList){
                    let value = "";
                    for(let i = 0; i < opList.length; i++){
                        value += '<option value="' + opList[i].optionSize + '">' + opList[i].optionSize + '&nbsp(재고' + opList[i].stock + ')' + '</option>'
                    }

                    resultO += value;
                },
                error:function(){
                    console.log("ajax통신실패2,,,");
                }
            });
            return resultO;
        }

        function selectProduct(productNo){
            var resultP;

            $.ajax({
                url:"selectOrdered.pd",
                data:{
                    pno:productNo
                },
                type:"post",
                async:false,
                success:function(p){
                    resultP = p;
                },
                error:function(){
                    console.log("ajax통신실패3,,,");
                }
            });

            return resultP;
        }

        function updateOrderDtl(num){
            $.ajax({
                url:"updateOrderDtl.od",
                data:{
                    dtlQnt:$("input[name=dtlQnt" + num +"]").val(),
                    dtlSize:$("select[name=dtlSize" + num +"]").val(),
                    orderDtlNo:$("input[name=orderDtlNo" + num +"]").val()
                },
                type:"post",
                success:function(result){
                    if(result > 0){ 
                        selectOrderDetailList();
                        alert("주문한 상품 수정에 성공했습니다.");
                    }
                },
                error:function(){
                    console.log("ajax통신실패4,,,");
                }
            });
        }
        
        function deleteOrderDtl(num){
            $.ajax({
                url:"deleteOrderDtl.od",
                data:{
                    orderDtlNo:$("input[name=orderDtlNo" + num +"]").val()
                },
                type:"post",
                success:function(result){
                    if(result > 0){ 
                        selectOrderDetailList();
                        alert("상품을 환불처리했습니다.");
                    }
                },
                error:function(){
                    console.log("ajax통신실패5,,,");
                }
            });
        }
        
        function calPrice(count){
            
            let orderStock = 0;
        	let originPrice = 0;
        	let discountPrice = 0;
            let useMileage = Number(<%= o.getUseMileage() %>);
            let orderPrice = 0;
            let returnPrice = 0;
            
        	for(let i = 0; i < count; i++){
                //allStock += Number($("input[name=dtlQnt" + i +"]").val());
        		//originPrice += Number($("#originPrice" + i).val());
        		discountPrice += Number($("#discountPrice" + i).val());
        	}

            $(".orderStock").each(function(){
                orderStock += Number($(this).val());
            });

            $(".orderPrice").each(function(){
                orderPrice += Number($(this).val());
            });

            $(".returnPrice").each(function(){
                returnPrice += Number($(this).val());
            })

            $(".orderDiscount").each(function(){
                discountPrice += Number($(this).val());
            });
        	
        	$("#orderStock").text(orderStock + " 개");
            $("#orderStock").next().val(orderStock);
        	$("#originPrice").text((orderPrice + returnPrice) + " 원");
            $("#returnPrice").text(returnPrice + " 원");
        	$("#discountPrice").text("-" + discountPrice + " 원");
            $("#saveMilegae").text("+" + (orderPrice / 100) + " 원");
            $("#saveMilegae").next().val(orderPrice / 100);
        	$("#totalPrice").text((orderPrice - discountPrice - useMileage) + "원");
        	
        }
    </script>

</body>

</html>