<%@page import="com.kh.community.model.vo.InstaImage" %>
<%@page import="com.kh.community.model.vo.Instagram" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% 
	Instagram insta=(Instagram)request.getAttribute("insta"); 
	InstaImage img=(InstaImage)request.getAttribute("img"); 
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="../../resources/js/jquery-3.6.3.min.js"></script>
    <script src="https://kit.fontawesome.com/65b9d5555c.js" crossorigin="anonymous"></script>
    <style>
        div {
            /* border: 1px solid black; */
        }

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

        .fa {
            font-size: 25px;
            float: left;
            padding: 5px;
        }

        .btn {
            width: 90px;
            height: 35px;
            float: left;
            margin-right: 10px;
        }
        
        .liked {
		  	color: red;
		}
    </style>
</head>

<body>
    <%@include file="../common/menubar.jsp" %>

        <div class="container text-center">
            <div class="row row-cols-2" style="padding-top: 55px;">
                <div class="col">
                    <img src="<%= img.getInstaImgChange()%><%= img.getInstaImgSrc() %>" 
                    	alt="..." class="img-fluid" style="width: 500px; height: 600px;">
                </div>
                <div class="col">
                    <div class="row justify-content-end" style="height: 60%;">
                        <a href="<%= contextPath %>/list.co" class="btn btn-sm"
                            style="background-color: #e2bbe7">목록가기</a>

                        <% if (loginUser !=null && insta.getMemNo().equals(loginUser.getMemId())) { %>
                            <a href="<%= contextPath %>/updateForm.co?cno=<%= insta.getComNo() %>"
                                class="btn btn-sm btn-warning">수정하기</a> <a
                                href="<%= contextPath %>/delete.co?cno=<%= insta.getComNo() %>"
                                class="btn btn-sm btn-danger">삭제하기</a>
                            <% } %>

                                <!-- 로그인한 사용자가 게시글 작성자일 경우만 보이게 -->
                                <%-- <% if (loginUser !=null &&
                                    String.valueOf(loginUser.getMemNo()).equals(insta.getMemNo())) { %>
                                    <a href="<%= contextPath %>/update.co?cno=<%= insta.getComNo() %>"
                                        class="btn btn-sm btn-warning">수정하기</a>
                                    <a href="#" class="btn btn-sm btn-danger">삭제하기</a>
                                    <% } %> --%>

                    </div>
                    <div class="row" style="height: 40%;">
                        <table border="0">
                            <tr>
                                <td style="width: 10%;"><b style="font-size: 25px;">
                                        <%= insta.getInstaId() %></b></td>
                                <td>
                                    <ul class="icon" style="list-style: none;">
                                        <li><i class="fa fa-solid fa-user-plus follow-btn"></i></li>
                                        <li><i class="fa fa-solid fa-share-nodes"></i></li>
                                        <li><i class="fa fa-brands fa-instagram"></i></li>
                                        <li><i class="fa fa-regular fa-heart like-button" id="like-btn" data-post-id="1234"></i></li>
                                        <li><span class="fa like-count" id="like-count" style="font-size: 1px;">0</span></li>
                                    </ul>
                                </td>
                            </tr>

                            <tr>
                                <td colspan="2" style="text-align: left;">
                                	<span><b><%= insta.getComContent() %></b></span>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <% String[] arrTag=(String[])request.getAttribute("arrTag");
                                        System.out.println(arrTag); %>
                                        <% for (int i=0; i < arrTag.length; i++) { %>
                                            <button type="button" class="btn btn-secondary"><%= arrTag[i] %></button>
                                        <% } %> 
                                            <%-- <button type="button" class="btn btn-secondary"><%= insta.getComTag() %></button> --%>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>

                <div id="answer-area" class="col-8" style="height: 100px; padding: 40px;">
                    <table>
                        <thead>
                            <tr>
                                <td><i class="fa-regular fa-circle-user" style="font-size: 30px; padding: 5px;"></i>
                                </td>
                                <% if (loginUser !=null) { %>
                                    <td><textarea id="answerContent" rows="2" cols="60" style="resize: none"></textarea></td>
                                    <td> <button onclick="insertAnswer();" style="width: 75px; height: 55px; margin-top: -5px; 
                                    		border: 1px solid lightslategrey;">작성</button>
                                    </td>
                                    <% } else { %>
                                        <td><textarea rows="2" cols="60" style="resize: none">로그인 후 이용 가능한 서비스입니다.</textarea>
                                        </td>
                                        <td>
                                            <button style="width: 75px; height: 55px; margin-top: -5px;" disabled="disabled">작성</button>
                                        </td>
                                    <% } %>
                            </tr>
                        </thead>
                        <tbody></tbody>
                    </table>

                    
                </div>
                <div class="col-4"></div>
            </div>
        </div>
					<script>
                        $(function () {
                            selectAnswerList();

                            setInterval(selectAnswerList, 1000);
                        })

                        function insertAnswer() {
                            $.ajax({
                                url: "answerInsert.co",
                                data: {
                                    content: $("#answerContent").val(),
                                    cno: <%= insta.getComNo() %>
								},
                                type: "post",
                                success: function (result) {
                                    if (result > 0) {
                                        selectAnswerList();
                                        $("#answerContent").val("");
                                    }
                                },
                                error: function () {
                                    console.log("댓글 작성 ajax 통신 실패")
                                }
                            })
                        }

                        function selectAnswerList() {
                            $.ajax({
                                url: "answerList.co",
                                data: { cno: <%= insta.getComNo() %>},
                                success: function (list) {
                                    /* console.log(list); */
                                    let value = "";
                                    for (let i = 0; i < list.length; i++) {
                                        value += "<tr>"
                                            + "<td>" + list[i].memNo + "</td>"
                                            + "<td>" + list[i].ansContent + "</td>"
                                            + "<td>" + list[i].ansDate + "</td>"
                                            + "</tr>"
                                    }
                                    $("#answer-area tbody").html(value);
                                },
                                error: function () {
                                    console.log("댓글 목록 ajax 통신 실패")
                                }
                            })
                        }
                    </script>
 
                    <script>
                        $(document).ready(function () {
                            $('.like-button').click(function () {
                                let cNo = <%= insta.getComNo() %>;
                                
                                // 로그인한 회원만 누를 수 있도록
                                if (<%= loginUser == null %>) {
                                    alert("로그인 후 이용 가능합니다.");
                                    return false;
                                }
                                
                                // 중복 클릭 방지
                                if ($(this).hasClass('active')) {
									return false;
								}
                                
                                var btn = $(this);
                                var post_id = btn.data('post-id');
                                btn.addClass('active');
                                
                                $.ajax({
                                    url: 'like.co',
                                    type: 'POST',
                                    data: {
                                        comNo: cNo,
                                        memNo: <%= loginUser.getMemNo() %>
				    	  			},
                                    success: function (result) {
                                        // 좋아요 수 업데이트
                                    	let like_count = parseInt($('.like-count').text());
                                        if (btn.hasClass('liked')) {
                                          $('.like-count').text(like_count - 1);
                                        } else {
                                          $('.like-count').text(like_count + 1);
                                        }

                                        // 좋아요 버튼 색깔 변경
                                        btn.toggleClass('liked');
                                      },
                                    error: function () {
                                        console.log(error);
                                    },
                                    complete: function() {
                                      // 좋아요 버튼 active 클래스 제거
                                      btn.removeClass('active');
                                    }
                                });
                            });
                        });
                    </script>
                    <script></script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous">
            </script>
</body>

</html>