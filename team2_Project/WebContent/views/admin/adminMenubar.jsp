<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>
    <head>
    <meta charset="UTF-8">
    <title>공지사항 관리</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/e7b3da7de3.js" crossorigin="anonymous"></script>
    <style>
        div{box-sizing: border-box; margin: 0;}
        .wrap{
            width: 1200px;
            height: 600px;
        }
    
        .wrap>div{
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
    
        #left>div, #right>div{
            width: 100%;
        }
    
        #logo, #title, #navigator>div{
            height: 10%;
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

    </style>
    </head>
    <body>
        <div class="wrap">
            <div id="left">
                <div id="logo"><img src="" alt="내일뭐입지 로고"></div>
                <div id="navigator">
                    <ul id="navi">
                        <li class="menuli">
                            <a href="#">게시판관리</a>
                            <ul>
                                <li class="menuli2"><a href="#">공지사항</a></li>
                                <li class="menuli2"><a href="#">Q&A</a></li>
                            </ul>
                        </li>
                        <li class="menuli"><a href="#">회원관리</a></li>
                        <li class="menuli"><a href="#">상품관리</a></li>
                        <li class="menuli"><a href="#">주문관리</a></li>
                    </ul>
                </div>
            </div>
            <div id="right">
                <div id="title"><h1>공지사항 관리</h1></div>
            </div>
        </div>

        <script>
            $(function(){
                $(".menuli").click(function(){
                    const $a = $(this).children();

                    console.log($a.css("color"));

                    if($a.css("color") != "white"){
                        $(this).siblings().children().css({"color":"white", "background-color":"#E0BFE6"});

                        $(this).children().css({"color":"#E0BFE6", "background-color":"white"});
                    }
                });

                $(".menuli").click(function(){
                    const $a = $(this).children();

                    console.log($a.css("color"));

                    if($a.css("color") != "white"){
                        $(this).siblings().children().css({"color":"white", "background-color":"#E0BFE6"});

                        $(this).children().css({"color":"#E0BFE6", "background-color":"white"});
                    }
                });

                $(".menuli>a").hover(function(){
                    $(this).css({"color":"#E0BFE6", "background-color":"white"});
                }, function(){
                    $(this).css({"color":"white", "background-color":"#E0BFE6"});
                })
            })
        </script>

    </body>
    </html>