<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <title>Insert title here</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
            integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <script src="../../resources/js/jquery-3.6.3.min.js"></script>
        <style>
            div {
                box-sizing: border-box;
                /* border: 1px solid rgb(168, 168, 168); */
            }

            #content {
                padding-left: 300px;
                padding-top: 50px;
            }

            button {
                width: 80px;
                height: 30px;
            }

            #brandBtn>button {
                height: 50px;
                width: 50px;
                border: 0px;
                border-radius: 50%;
            }

            img {
                width: 35px;
                height: 35px;
            }

            td {
                width: 160px;
                height: 50px;
                padding: 10px;
            }

            .container {
                width: 800px;
                height: 600px;
                /* border: 1px solid black; */
            }

            button {
                border: 1px solid black;
            }
            
			.tag {
			  display: inline-block;
			  background-color: #ccc;
			  padding: 2px 6px;
			  margin: 4px;
			  border-radius: 4px;
			}
        </style>
    </head>

    <body>
        <%@ include file="../common/menubar.jsp"%>

            <!--content-->
            <div id="content">
                <h1>스타일 업로드</h1>
                <br>
                <form action="<%=contextPath%>/insert.co" method="post" enctype="multipart/form-data">

					<input type="hidden" name="memNo" value="<%= loginUser.getMemNo() %>">
					
                    <h3>사진</h3>
                    <img id="preview" name="upfile" style="width: 200px; height: 200px;" data-bs-toggle="modal"
                        data-bs-target="#exampleModal"> <input type="file" onchange="readURL(this);" data-width="300"
                        data-height="450" required> <br> <br>

                    <script>
                        /* function readURL(input) {
                            if (input.files && input.files[0]) {
                                var reader = new FileReader();
                                reader.onload = function (e) {
                                    document.getElementById('preview').src = e.target.result;
                                };
                                reader.readAsDataURL(input.files[0]);
                            } else {
                                document.getElementById('preview').src = "";
                            }
                        } */
                        
                        function readURL(input) {
                        	  if (input.files && input.files[0]) {
                        	    const reader = new FileReader();
                        	    reader.onload = function(e) {
                        	      const previewImg = document.getElementById('preview');
                        	      previewImg.setAttribute('src', e.target.result);
                        	    }
                        	    reader.readAsDataURL(input.files[0]);
                        	  }
                        	}
                    </script>

                    <!-- Modal -->
                    <div class="modal fade modal-dialog modal-xl" id="exampleModal" tabindex="-1"
                        aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="exampleModalLabel">내일뭐입지</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <div class="container">
                                        <div class="row">
                                            <div class="col">
                                                <table border="1">
                                                    <tr>
                                                        <td colspan="2">
                                                            <h5>브랜드 선택</h5>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2" id="brandBtn">
                                                            <button>
                                                                <img src="resources/img/insta/나이키 (2).png" alt="">
                                                            </button>
                                                            <button>
                                                                <img src="resources/img/insta/무아무아 (2).png" alt="">
                                                            </button>
                                                            <button>
                                                                <img src="resources/img/insta/아디다스 (2).png" alt="">
                                                            </button>
                                                            <button>
                                                                <img src="resources/img/insta/oioi.png" alt="">
                                                            </button>
                                                            <button>
                                                                <img src="resources/img/insta/키르시 (2).png" alt="">
                                                            </button>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            <h5>상품명</h5>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2"><input type="text" placeholder="상품명"
                                                                style="width: 250px; height: 35px;"></td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <h5>사이즈</h5>
                                                        </td>
                                                        <td>
                                                            <h5>카테고리</h5>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td><select name="" id="" style="width: 100px; height: 35px;">
                                                                <option value="">Free</option>
                                                                <option value="">S</option>
                                                                <option value="">M</option>
                                                                <option value="">L</option>
                                                                <option value="">XL</option>
                                                            </select></td>
                                                        <td><select name="" id="" style="width: 100px; height: 35px;">
                                                                <option value="">아우터</option>
                                                                <option value="">상의</option>
                                                                <option value="">하의</option>
                                                                <option value="">슈즈</option>
                                                            </select></td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            <h5>가격 입력</h5>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2"><input type="text"
                                                                style="width: 250px; height: 35px;"></td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            <h5>링크입력</h5>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2"><input type="url"
                                                                style="width: 250px; height: 35px;"></td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2" style="text-align: center;">
                                                            <button>취소</button>
                                                            <button>확인</button>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                            <div class="col">
                                                <div class="row" style="height: 85%;">
                                                    <img id="modalImg" src="resources/6.jpg" alt=""
                                                        style="height: 600px; width: 550px;">
                                                </div>
                                                <div class="row"></div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                                    <button type="button" class="btn btn-primary">확인</button>
                                </div>
                            </div>
                        </div>
                    </div>
					
					<script>
					function readURL(input) {
						  if (input.files && input.files[0]) {
						    const reader = new FileReader();
						    reader.onload = function(e) {
						      const previewImg = document.getElementById('preview');
						      previewImg.setAttribute('src', e.target.result);

						      const modalImg = document.getElementById('modalImg');
						      modalImg.setAttribute('src', e.target.result);
						    }
						    reader.readAsDataURL(input.files[0]);
						  }
						}
					</script>
					
                    <script>
                        const previewImage = document.querySelector("#preview");
                        const modal = document.querySelector("#exampleModal");

                        brandButtons.forEach((button) => {
                            previewImage.addEventListener("click", () => {
                                $(modal).modal("show");
                            });
                        });  	
                    </script>
                    <!-- <script>
							const brandButtons = document.querySelectorAll("#brandBtn button");

							const modal = document.querySelector("#exampleModal");

							brandButtons.forEach((button) => {
								button.addEventListener("click", () => {
									
										$(modal).modal("show");
									}
								});
							});
						</script> -->

					<% String instaId = (loginUser.getInstaId() == null ? "" : loginUser.getInstaId()); %>

                    <h3>설명</h3>
                    <h5>스타일을 소개해주세요.</h5>
                    <textarea name="content" id="" cols="100" rows="10" maxlength="300"></textarea>
                    <br> <br>
                    <h3>인스타 아이디</h3>
                    <h5>입력하신 인스타 아이디는 회원 정보에 자동 저장됩니다.</h5>
                    <input type="text" name="instaId" value="<%= instaId %>"> <br> <br>
                    <h3>태그 추가</h3>

                    <input id="tag-input"placeholder="태그를 입력하세용">
                    <input type="hidden" name="tags">
					<div id="tag-container" ></div>

					<script>
					const tagInput = document.getElementById('tag-input');
					const tagContainer = document.getElementById('tag-container');
					// const tags = []; // 태그 저장할 배열

					tagInput.addEventListener('keydown', function(event) {
					  if (event.keyCode === 13) {
					    event.preventDefault();
					    const tag = this.value.trim();
					    if (tag !== '') {
					      const tagEl = document.createElement('span');
					      tagEl.classList.add('tag');
					      
					      //input value() 값을 넣어주는 .add()
					      
					      tagEl.textContent = '#' + tag;
					      tagContainer.appendChild(tagEl);
					      this.value = '';
					      // tags.push(tag); // 생성된 태그 배열에 추가
					      
					      
					    }
					  }
					});
					
					const hiddenInput = document.querySelector('input[name=tags]');
					
					setInterval(() => {
					  hiddenInput.value = Array.from(tagContainer.children).map(el => el.textContent).join(',');
					}, 1000);
					</script>

                    <br> <br> <br> <br> <input type="checkbox" required> 콘텐츠 활동 동의 (필수)
                    <h5>
                        - 게시물은 1일 1회만 업로드할 수 있습니다. <br> - 비방성이나 광고성 글, 또는 본 게시판의 성격과 맞지
                        않은 글은 본인의 동의 없이 관리자가 임의대로 삭제할 수 있습니다.
                    </h5>
                    <br> <br>
                    <button>취소</button>
                    <button>업로드</button>


                </form>
            </div>
            <script src="resources/js/dist/tag.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
                crossorigin="anonymous"></script>
    </body>

    </html>