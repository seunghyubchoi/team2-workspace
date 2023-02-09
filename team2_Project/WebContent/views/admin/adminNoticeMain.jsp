<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>
    <head>
    <meta charset="UTF-8">
    <title>공지사항 관리</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/e7b3da7de3.js" crossorigin="anonymous"></script>
    <style>
        /* div{border: 1px solid red;} */
        div{box-sizing: border-box; margin: 0;}
        .wrap{
            width: 1200px;
            height: 600px;
        }
    
        .wrap>div, #right_bottom_top>div, #searchNotice>div{
            height: 100%;
            float: left;
        }
    
        #left{
            width: 20%;
            background-color: #E0BFE6;
        }
        #right{
            width: 80%;
        }
    
        #left>div, #right>div, #right_bottom_middle, #right_bottom_top{
            width: 100%;
        }
    
        #left_top, #right_top, #right_bottom_top, #left_bottom>div{
            height: 10%;
        }
    
        #left_bottom, #right_bottom{
            height: 90%;
        }
    
        #right_bottom_middle{
            height: 80%;
            padding: 20px;
        }
        #right_bottom_top1, #right_bottom_top3, #right_bottom_top4{
            width: 10%;
        }
        #right_bottom_top2{
            width: 70%;
        }

        h1{
            margin: 0;
            padding-top: 1%;
            padding-left: 2%;
            color: #E0BFE6;
        }
    
        #navi{
            list-style-type: none;
            padding: 0;
            margin: 0;
            height: 100%;
        }
        #navi>li{
            text-align: center;
            width: 100%;
            height: 10%;
        }
        #navi a{
            text-decoration: none;
            color: white;
            font-size: 18px;
            font-weight: bolder;
            width: 100%;
            height: 100%;
            display: block;
            line-height: 50px;
        }
    
        #navi a:hover{
            color: #E0BFE6;
            background-color: white;
        }
    
        #navi>li>ul{
            list-style: none;
            padding: 0;
            margin: 0;
            display: none; /* 일단은 안보여지게 함 */
        }
    
        #navi>li>ul a{font-size: 15px;}
    
        #navi>li>a:hover+ul{display: block;}
        #navi>li>ul:hover{display: block;}
    
        #content{
            width: 100%;
            height: 80%;
        }

        #content *{
            font-weight: bold;
            text-align: center;
        }

        #check{width: 5%;}
        #no{width: 7%;}
        #date{width: 20%;}
        
        body{line-height: 18px;}
        thead{background-color: #E0BFE6; color: white;}

        .pagination{justify-content: center;}

        #right_bottom_bottom{width: 93%;}

        input[type="checkbox"] {
        transform : scale(1.2);
        cursor: pointer;
        }

        #right_bottom_top2{position: relative;}

        #search_form{
            width: 30%;
            height: 70%;
            margin: auto; 
            position: absolute;
        }
        #search_form>div{height: 100%; float: left;}
        #search_text{width: 80%;}
        #search_btn{width: 20%; height: 100%;}

        #search_form input{width: 100%; height: 100%;} 

        #right_bottom_top>div{padding-top: 15px;}
        #right_bottom_top1{padding-left: 15px;}
        #right_bottom_top3, #right_bottom_top4{text-align: center;}

    </style>
    </head>
    <body>
        <div class="wrap">
            <div id="left">
                <div id="left_top"><img src="" alt="내일뭐입지 로고"></div>
                <div id="left_bottom">
                    <ul id="navi">
                        <li>
                            <a href="#">게시판관리</a>
                            <ul>
                                <li><a href="#">공지사항</a></li>
                                <li><a href="#">Q&A</a></li>
                            </ul>
                        </li>
                        <li><a href="#">회원관리</a></li>
                        <li><a href="#">상품관리</a></li>
                        <li><a href="#">주문관리</a></li>
                    </ul>
                </div>
            </div>
            <div id="right">
                <div id="right_top"><h1>공지사항 관리</h1></div>
                <div id="right_bottom">
                    <div id="right_bottom_top">
                        <div id="right_bottom_top1">
                            <select name="selectSearch" id="selectSearch">
                                <option value="">제목</option>
                                <option value="">내용</option>
                            </select>
                        </div>
                        <div id="right_bottom_top2">
                            <form action="search.no" id="search_form">
                                <div id="search_btn">
                                    <button><i class="fa-sharp fa-solid fa-magnifying-glass fa-xl"></i></button>
                                </div>
                                <div id="search_text">
                                    <input type="text">
                                </div>
                            </form>
                        </div>
                        <div id="right_bottom_top3">
                            <button class="btn btn-danger">삭제</button>
                        </div>
                        <div id="right_bottom_top4">
                            <button class="btn btn-warning">추가</button>
                        </div>
                    </div>
                    <div id="right_bottom_middle">
                        <table border="1" id="content" class="table table-bordered">
                            <thead>
                                <td id="check"><input type="checkbox"></td>
                                <td id="no">번호</td>
                                <td id="title">제목</td>
                                <td id="date">작성일</td>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><input type="checkbox"></td>
                                    <th>x</th>
                                    <th><a href="#">xxxxxxxxxxxxxxxxxx</a></th>
                                    <th>xx-xx-xx</th>
                                </tr>
                                <tr>
                                    <td><input type="checkbox"></td>
                                    <th>x</th>
                                    <th><a href="#">xxxxxxxxxxxxxxxxxx</a></th>
                                    <th>xx-xx-xx</th>
                                </tr><tr>
                                    <td><input type="checkbox"></td>
                                    <th>x</th>
                                    <th><a href="#">xxxxxxxxxxxxxxxxxx</a></th>
                                    <th>xx-xx-xx</th>
                                </tr><tr>
                                    <td><input type="checkbox"></td>
                                    <th>x</th>
                                    <th><a href="#">xxxxxxxxxxxxxxxxxx</a></th>
                                    <th>xx-xx-xx</th>
                                </tr><tr>
                                    <td><input type="checkbox"></td>
                                    <th>x</th>
                                    <th><a href="#">xxxxxxxxxxxxxxxxxx</a></th>
                                    <th>xx-xx-xx</th>
                                </tr><tr>
                                    <td><input type="checkbox"></td>
                                    <th>x</th>
                                    <th><a href="#">xxxxxxxxxxxxxxxxxx</a></th>
                                    <th>xx-xx-xx</th>
                                </tr><tr>
                                    <td><input type="checkbox"></td>
                                    <th>x</th>
                                    <th><a href="#">xxxxxxxxxxxxxxxxxx</a></th>
                                    <th>xx-xx-xx</th>
                                </tr><tr>
                                    <td><input type="checkbox"></td>
                                    <th>x</th>
                                    <th><a href="#">xxxxxxxxxxxxxxxxxx</a></th>
                                    <th>xx-xx-xx</th>
                                </tr><tr>
                                    <td><input type="checkbox"></td>
                                    <th>x</th>
                                    <th><a href="#">xxxxxxxxxxxxxxxxxx</a></th>
                                    <th>xx-xx-xx</th>
                                </tr><tr>
                                    <td><input type="checkbox"></td>
                                    <th>x</th>
                                    <th><a href="#">xxxxxxxxxxxxxxxxxx</a></th>
                                    <th>xx-xx-xx</th>
                                </tr>
                            </tbody>
    
                        </table>
                    </div>
                    <div id="right_bottom_bottom">
                        <ul class="pagination">
                            <li class="page-item disabled"><a class="page-link" href="#">이전</a></li>
                            <li class="page-item"><a class="page-link" href="#">1</a></li>
                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item"><a class="page-link" href="#">다음</a></li>
                          </ul>
                    </div>
                </div>
            </div>
        </div>
        
    
    </body>
    </html>