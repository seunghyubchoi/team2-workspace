<%@page import="com.kh.payment.model.vo.Location"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%
	Member m = (Member)request.getAttribute("m");
	ArrayList<Location> lList = (ArrayList<Location>)request.getAttribute("lList");
	
	m.setGender(m.getGender() == null ? "" : m.getGender());
	m.setBirthday(m.getBirthday() == null ? "" : m.getBirthday());
	m.setEmail(m.getEmail() == null ? "" : m.getEmail());
	m.setAdCheck(m.getAdCheck() == null ? "" : m.getAdCheck());
	m.setInstaId(m.getInstaId() == null ? "" : m.getInstaId());
	
	int count = 1;
    boolean flag = false;

    int index = 0;

    String locYn = lList.isEmpty() ? "Y" : "";
%>
<!DOCTYPE html>
<html lang="ko">

<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- 다음 우편번호 API를 사용하기 위한 script -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

    <title>회원 관리</title>

</head>

<body id="page-top">
    
    <!-- Page Wrapper -->
    <div id="wrapper" style="display: flex;">

        <!-- include common element  -->
        <%@ include file="adminCommon.jsp" %>

        <script>
            $(function(){
                sidebarActiveDelete();
                sidebarActive("#member");
            })
        </script>

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <div class="input-group" style="padding-top: 10px;">
                        <h2 class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100">&lt;<%= m.getMemName() %>&gt; 님의 회원정보</h2>
                    </div>
                    <div class="input-group" style="padding-top: 10px;">
                        <a class="d-none d-sm-inline-block form-inline ml-auto my-2 mr-3 my-md-0 mw-100" href="#" data-toggle="modal" data-target="#logoutModal" id="logoutBtn">로그아웃</a>
                    </div>

                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
            
                <div class="container-fluid mb-5">
                    <div class="content-wrapper">

                        <form action="adminModify.me">
                        <input type="hidden" name="memNo" value="<%= m.getMemNo() %>">
                        <input type="hidden" name="memId" value="<%= m.getMemId() %>">
                            <table class="table table-primary table-bordered">
                                <tr>
                                    <td class="text-right w-120px"><h5>아이디</h5></td>
                                    <td colspan="2"><%= m.getMemId() %></td>
                                    <td class="text-right w-120px"><h5>성별</h5></td>
                                    <td colspan="2">
                                        <div>
                                            <select id="gender" name="gender">
                                                <option value="">입력안함</option>
                                                <option value="남">남자</option>
                                                <option value="여">여자</option>
                                            </select>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="text-right w-120px"><h5>이름</h5></td>
                                    <td colspan="2"><%= m.getMemName() %></td>
                                    <td class="text-right w-120px"><h5>생년월일</h5></td>
                                    <td colspan="2"><input type="date" name="birthday" value="<%= m.getBirthday() %>"></td>
                                </tr>
                                <tr>
                                    <td class="text-right w-120px"><h5>이메일주소</h5></td>
                                    <td colspan="2"><input type="email" name="email" value="<%= m.getEmail() %>"></td>
                                    <td class="text-right w-120px"><h5>전화번호</h5></td>
                                    <td colspan="2"><input type="phone" name="phone" value="<%= m.getPhone() %>" required></td>
                                </tr>
                                <tr>
                                    <td class="text-right w-120px"><h5>sns아이디</h5></td>
                                    <td colspan="2">@<input type="text" name="instaId" value="<%= m.getInstaId() %>"></td>
                                    <td class="text-right w-120px"><h5>적립금</h5></td>
                                    <td colspan="2">
                                        <input type="number" value="<%= m.getMileage() %>" readonly>
                                        <button type="button" class="btn btn-sm btn-secondary" data-toggle="modal"
                                            data-target="#Mileage" >적립</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" class="text-left"><h5>마케팅 선택 동의 사항</h5></td>
                                    <td colspan="4">
                                        <div>
                                            <input type="checkbox" name="adCheck" id="email" value="이메일" class="scale-120">
                                            <label for="email" class="mb-0 mr-2">이메일</label>
    
                                            <input type="checkbox" name="adCheck" id="sms" value="문자" class="scale-120">
                                            <label for="sms" class="mb-0">문자</label>
                                        </div>
                                    </td>
                                </tr>
                                
                                <% if(lList != null){ %>
                                	<%for(Location l : lList){ %>
		                                <tr>
		                                    <td rowspan="2" class="text-center w-120px">
		                                        <h5>배송지<%= count %></h5>
                                                <% if(l.getLocYn().equals("Y")){ %>
                                                    기본배송지
                                                <%}%>
		                                    </td>
		                                    <td colspan="4" rowspan="2">
                                                <input type="hidden" name="locNo<%= count %>" value="<%= l.getLocNo()%>"><br>
		                                        <input type="text" name="locAddressName<%= count %>" value="<%= l.getLocAddressName()%>"><br>
		                                        <input type="text" name="locName<%= count %>" value="<%= l.getLocName()%>"><br>
		                                        <input type="phone" name="locAddressPhone<%= count %>" value="<%= l.getLocPhone()%>"><br>
		                                        <input type="text" name="locAddress<%= count %>" value="<%= l.getLocAddress() %>" readonly><br>
		                                        <input type="text" name="locAddressDetail<%= count %>" value="<%= l.getLocAddressDtl() %>" readonly><br>
		                                        <input type="text" name="locPostNumber<%= count %>" value="<%= l.getLocPostCode() %>" readonly><br>
		                                        <input type="hidden" name="locYn<%= count %>" value="<%= l.getLocYn() %>"><br>

		                                    </td>
		                                    <td>
		                                    	<button type="button" class="btn btn-secondary" data-toggle="modal"
                                                data-target="#Location" onclick="modifyLocation(<%= count%>);">수정</button>
                                            </td>
		                                </tr>
		                                <tr>
		                                    <td>
		                                    	<button type="button"class="btn btn-secondary" data-toggle="modal"
                                                data-target="#locationDeleteModal" onclick="deleteLocation(<%= count%>);">삭제</button>
	                                    	</td>
		                                </tr>
		                                <% count++; %>
                                	<%} %>
                                <%} %>
                                <%if(lList.size() < 2){ %>
	                                <tr>
	                                    <td colspan="6"><button type="button" class="btn btn-secondary" data-toggle="modal"
                                            data-target="#Location" onclick="addLocation('<%= locYn%>');">배송지추가</button>
										</td>
	                                </tr>
                                <%} %>
                            </table>
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

    <!-- Location Modal -->
	<div class="modal" id="Location">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
                    <h4 class="modal-title" id="modal-title"></h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<!-- Modal body -->
				<div class="modal-body" align="center">
				<form action="" method="post">
						<input type="hidden" name="memNo" value="<%= m.getMemNo()%>">
						<table>
                            <input type="hidden" name="locNo">
							<tr>
								<th>배송지 이름</th>
							</tr>
							<tr>
								<td><input type="text" class="form-control mb-2 mr-sm-2"
									value="" name="locAddressName" placeholder="배송지 이름을 입력해주세요"
									required></td>
							</tr>
							<tr>
								<th>받으시는 분</th>
							</tr>

							<tr>
								<td><input type="text" class="form-control mb-2 mr-sm-2"
									value="" name="locName" placeholder="받으시는 분 이름을 입력해주세요"
									required></td>
							</tr>
							<tr>
								<th>전화번호</th>
							</tr>
							<tr>
								<td><input type="text" class="form-control mb-2 mr-sm-2"
									value="" name="locPhone" placeholder="전화번호를 입력해주세요" required></td>
							</tr>
							<tr>
								<th>주소</th>
							</tr>
							<tr>
								<td>
									<div class="input-group mb-3">
										<input type="text" class="form-control" placeholder="우편번호"
											name="locPostCode" id="sample6_postcode" required readonly>
										<div class="input-group-append">
											<button class="btn btn-primary" type="button"
												onclick="sample6_execDaumPostcode()">우편번호 검색</button>
										</div>
									</div>

								</td>
							</tr>
							<tr>
								<td><input type="text" class="form-control mb-2 mr-sm-2"
									id="sample6_address" value="" name="locAddress"
									placeholder="주소" required readonly></td>
							</tr>
							<tr>
								<td><input type="text" class="form-control mb-2 mr-sm-2"
									id="sample6_extraAddress" placeholder="주소2" required readonly></td>
							</tr>
							<tr>
								<td><input type="text" class="form-control mb-2 mr-sm-2"
									id="sample6_detailAddress" value="" name="locAddressDtl"
									placeholder="상세주소를 입력해주세요" required></td>
							</tr>
                            <tr>
                                <td align="right">
                                    <label for="locYnBox" class="mb-0">기본배송지 여부</label>
                                    <input type="checkbox" id="locYnBox" class="scale-120" onchange="changeLocYnBox();">
                                    <input type="hidden" name="locYn" id="locYn" class="scale-120" value="N">
                                </td>
                            </tr>
							<tr>
								<td align="center">
									<button type="button" class="btn btn-primary mb-2" data-dismiss="modal">뒤로가기</button>
									<button type="submit" class="btn btn-primary mb-2">저장하기</button>
								</td>
							</tr>

						</table>

					</form>
				</div>
			</div>
		</div>
	</div>
    <!-- Location Modal -->

    <!-- Mileage Modal -->
	<div class="modal" id="Mileage">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
                    <h4 class="modal-title" id="modal-title"><%= m.getMemName() %>님의 적립금</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<!-- Modal body -->
				<div class="modal-body" align="center">
				<form action="<%= contextPath%>/insert.mi" method="post">
						<input type="hidden" name="memNo" value="<%= m.getMemNo()%>">
						<table>
							<tr>
								<th>현재 적립금</th>
							</tr>
							<tr>
								<td><input type="text" class="form-control mb-2 mr-sm-2"
									value="<%= m.getMileage() %>" readonly>
                                </td>
							</tr>
							<tr>
								<th>추가할 적립금</th>
							</tr>
							<tr>
								<td><input type="number" class="form-control mb-2 mr-sm-2"
									value="" name="mileage" placeholder="숫자 값만 입력하세요"
									required>
                                </td>
							</tr>
							<tr>
								<td align="center">
									<button type="button" class="btn btn-primary mb-2" data-dismiss="modal">뒤로가기</button>
									<button type="submit" class="btn btn-primary mb-2">적립하기</button>
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
    <!-- Mileage Modal -->
    
	<!-- deleteLocation Process Modal-->
	<div class="modal fade" id="locationDeleteModal" tabindex="-1" role="dialog" aria-labelledby="locationDeleteModal"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="locationDeleteModal">삭제하기</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    배송지를 정말 삭제하시겠습니까?
                </div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
                    <form action="<%= contextPath %>/adminDelete.lo" method="post">
                        <input type="hidden" id="deleteNo" name="deleteNo">
                        <input type="hidden" name="memNo" value="<%= m.getMemNo()%>">
                        <button type="submit" class="btn btn-warning" id="checkBtn">삭제</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script>
        $(function(){
            const gender = "<%=m.getGender()%>";
            $("#gender").children().each(function () {
                if ($(this).val() == gender) {
                    $(this).prop("selected", "selected");
                }
            });

            const adCheck = "<%= m.getAdCheck()%>";
            $("input[type=checkbox]").each(function () {
                if (adCheck.search($(this).val()) != -1) {
                $(this).attr("checked", true); 
                }
            });
        });
		
		let now_utc = Date.now() // 지금 날짜를 밀리초로
		let timeOff = new Date().getTimezoneOffset()*60000; // 분단위를 밀리초로 변환
		let today = new Date(now_utc-timeOff).toISOString().substring(0, 10); // 오늘 날짜
		
		$("input[name='birthday']").attr("max", today);
    </script>

</body>

</html>