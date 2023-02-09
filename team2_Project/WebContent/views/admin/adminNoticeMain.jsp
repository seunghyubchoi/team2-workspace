<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>
    <head>
    <meta charset="UTF-8">
    <title>공지사항 관리</title>
    <style>
        div{border: 1px solid red;}
        div{box-sizing: border-box; margin: 0;}
        .wrap{
            width: 1200px;
            height: 600px;
        }
    
        .wrap>div, #right_bottom_top>div{
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
    
        #left>div, #right>div, #right_bottom>div, #right_bottom_bottom{
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
            padding: 50px;
        }
        #right_bottom_top1, #right_bottom_top3, #right_bottom_top4{
            width: 15%;
        }
        #right_bottom_top2{
            width: 55%;
        }
        h1{
            margin: 0;
            padding-top: 1%;
            padding-left: 1%;
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
            border: 1px solid #000;
            width: 100%;
            height: 10%;
        }
        #navi a{
            border: 1px solid orange;
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
            width: 80%;
            height: 80%;
        }
    
    
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
                            <input type="text" id="search">
                        </div>
                        <div id="right_bottom_top3">
                            <button>삭제</button>
                        </div>
                        <div id="right_bottom_top4">
                            <button>추가</button>
                        </div>
                    </div>
                    <div id="right_bottom_middle">
                        <table border="1" id="content">
                            <thead>
                                <td><input type="checkbox"></td>
                                <td>번호</td>
                                <td>제목</td>
                                <td>작성일</td>
                            </thead>
                            <tbody>
                                <tr>
                                    <th><input type="checkbox"></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                </tr>
                                <tr>
                                    <th><input type="checkbox"></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                </tr>
                                <tr>
                                    <th><input type="checkbox"></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                </tr>
                                <tr>
                                    <th><input type="checkbox"></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                </tr>
                                <tr>
                                    <th><input type="checkbox"></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                </tr>
                                <tr>
                                    <th><input type="checkbox"></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                </tr>
                                <tr>
                                    <th><input type="checkbox"></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                </tr>
                                <tr>
                                    <th><input type="checkbox"></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                </tr>
                                <tr>
                                    <th><input type="checkbox"></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                </tr>
                                <tr>
                                    <th><input type="checkbox"></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                </tr>
                            </tbody>
    
                        </table>
                    </div>
                    <div id="right_bottom_bottom"></div>
                </div>
            </div>
        </div>
        
    
    </body>
    </html>