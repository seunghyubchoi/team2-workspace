<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
      div{box-sizing: border-box;}
      .wrap{
        width: 1500px;
        height: 2000px;
        margin: auto;
    }
    .wrap>div{
        width: 100%;
    }
    #navigator{
        height: 18%;
    }
    #content{
        height:69%
    }
    #footer{
        height: 13%;
    }
    <!----------------header-------->

    /* 메인로고 */
    #logo1{
        overflow: hidden;
        width: 100%;
        height: 330px;
        
    }
    /*검색바*/
   #search{
        width: 100%;
        height: 100%;
    }

    #searchbar{
        width: 700px;
        height: 55px;
        margin-top: 115px;
        margin-left: 60px;
        border-radius: 20px;
        border-color: #a68bac;
        border-style: solid;
        
    }
    

    <!--메뉴-->
{padding:0; margin:0;}
li{list-style:none}
a{text-decoration:none;font-size:14px}
.menu {
  width: 1500px;
  margin: 10px;
  padding: 10px;
  
}
.menu > li {
  width: 20%; /*20*5=100%*/
  float: left;
  text-align: center;
  line-height: 40px;
  margin: 15px 20px 0px 0px;
  border-radius: 10px;
  background-color: #e2bbe7;
	box-shadow: 0 0 0 1px #cb98df inset,
		  0 0 0 3px rgba(206, 121, 223, 0.534) inset,
		  0 8px 0 0 rgba(254, 253, 255, 0.863),
		  0 8px 0 2px rgba(0, 0, 0, 0.151),
		  0 8px 8px 1px rgba(242, 184, 253, 0.5);
 
}
.menu a {

  color: #fff;
  text-align: center;
  font-size: 20px;
  font-family: sans-serif;
  display: block;
  
}
.submenu > li {
  line-height: 70px;
  text-align: center;
  background-color: #fd98ba;
}
.submenu {
  height: 0; 
  overflow: hidden;
  list-style-type: none;
  display: block;
  width: 230px;
 
}
.menu > li:hover {
  background-color: #fd98ba;
  text-align: center;
}
.menu > li:hover .submenu{
  height: 350px;
  transition-duration: 1.5s;
  text-align: center;

}
  /*navigator*/
    #navigator>div{
        height: 100%;
    }
    #navigator{
        width: 1500px;
       
    }
    #navi1{
        width: 80%;
        height: 100%;
        float: left;
       
    }
    #navi2{
        width: 20%;
        height: 100%;
        float: left;
       border: solid 4px #E0BFE6;
        border-radius: 20px;
       
    }
    #navi2>#login2{
        width: 100%;
        height: 30%;
    }
    #navi2>#login3{
        width: 100%;
        height: 70%;
    }
    
    #logininfo{
        height: 130px;
        width: 250px;
        margin: 20px;
    border-radius: 10px;
    color:rgb(151, 92, 172);
    align-items: center;
    background-color: #f4f4f4;
	box-shadow: 0 0 0 4px #E0BFE6 inset,
		  0 0 0 3px rgba(181, 119, 220, 0.534) inset,
		  0 8px 8px 1px rgba(228, 223, 224, 0.5);
    }


    /*메인이벤트배너*/
    

    /*footer*/
    #footer>div {
            height:100%;
            text-align: center;
            font-size: 20px;
        }
        .ft {
            border: 1px solid rgb(182, 169, 169);
            width: 25%;
            float: left;
            padding: 5px;
            border-bottom: white;
            border-top: white;
        }
        
        #f1 {
            width: 1500px;
            border: 7px solid #E0BFE6;
            border-bottom: white;
            border-left: white;
            border-right: white;
            padding-bottom: 10px;
        }
/*메뉴바오류수정코드*/
#header {position:relative;z-index:2}
#body {overflow: hidden;zoom: 1;position:relative;z-index:1} 

/*네비1*/
[name="slide"] {display:none;}
.slidelist{margin:0;padding:0;box-sizing:border-box;}

#navi1>.slidebox{height:100%;}

.slidebox img {max-width:100%;}
.slidebox {max-width:1700px;width:99%;}

.slidebox .slidelist {
	white-space:nowrap;
	font-size:0;
	overflow:hidden;
	border-radius: 20px;
}

.slideitem img{height: 353px; width: 100%;}

.slidebox .slideitem {
	position:relative;
	display:inline-block;
	vertical-align:middle;
	width:100%;
	transition:all .80s;
}
.slidebox .slideitem label {
	position:absolute;
	z-index:1;
	top:50%;
	transform:translateY(-50%);
	padding:20px;
	border-radius:50%;
	cursor:pointer;
}


.paginglist {text-align:center;padding:30px 0;}
.paginglist > li {display:inline-block;vertical-align:middle;margin:0 10px;}
.paginglist > li > label {display:block;padding:10px 30px;border-radius:10px;background:#ccc;cursor:pointer;}
.paginglist > li:hover > label {background:#333;}

[id="slide01"]:checked ~ .slidelist .slideitem {transform:translateX(0);animation:slide01 20s infinite;}
[id="slide02"]:checked ~ .slidelist .slideitem {transform:translateX(-100%);animation:slide02 20s infinite;}
[id="slide03"]:checked ~ .slidelist .slideitem {transform:translateX(-200%);animation:slide03 20s infinite;}
[id="slide04"]:checked ~ .slidelist .slideitem {transform:translateX(-300%);animation:slide04 20s infinite;}

@keyframes slide01 {
	0% {left:0%;}
	23% {left:0%;}
	25% {left:-100%;}
	48% {left:-100%;}
	50% {left:-200%;}
	73% {left:-200%;}
	75% {left:-300%;}
	98% {left:-300%;}
	100% {left:0%;}
}
@keyframes slide02 {
	0% {left:0%;}
	23% {left:0%;}
	25% {left:-100%;}
	48% {left:-100%;}
	50% {left:-200%;}
	73% {left:-200%;}
	75% {left:100%;}
	98% {left:100%;}
	100% {left:0%;}
}
@keyframes slide03 {
	0% {left:0%;}
	23% {left:0%;}
	25% {left:-100%;}
	48% {left:-100%;}
	50% {left:200%;}
	73% {left:200%;}
	75% {left:100%;}
	98% {left:100%;}
	100% {left:0%;}
}
@keyframes slide04 {
	0% {left:0%;}
	23% {left:0%;}
	25% {left:300%;}
	48% {left:300%;}
	50% {left:200%;}
	73% {left:200%;}
	75% {left:100%;}
	98% {left:100%;}
	100% {left:0%;}
}
label.left {
	left:20px;
	background-color:#ffffff;
	background-image:url('https://cdn-icons-png.flaticon.com/512/6993/6993301.png');
	background-position:center center;
	background-size:50%;
	background-repeat:no-repeat;
}
label.right {
	right:20px;
	background-color:#ffffff;
	background-image:url('https://cdn-icons-png.flaticon.com/512/6993/6993298.png');
	background-position:center center;
	background-size:50%;
	background-repeat:no-repeat;
}



  /*로그인버튼*/
  .btn-3d-1 {
	position: relative;
	display: inline-block;
	font-size: 20px;
	padding: 8px 30px;
	color: white;
	margin: 30px 0px 10px 60px;
	border-radius: 10px;
	text-align: center;
	transition: top .01s linear;
	text-shadow: 0 1px 0 rgba(0,0,0,0.15);
	background-color: #e2bbe7;
	box-shadow: 0 0 0 1px #cb98df inset,
		  0 0 0 3px rgba(206, 121, 223, 0.534) inset,
		  0 8px 0 0 rgba(254, 253, 255, 0.863),
		  0 8px 0 2px rgba(0, 0, 0, 0.151),
		  0 8px 8px 1px rgba(242, 184, 253, 0.5);
  }
  .btn-3d-1:hover,.btn-3d-2:hover,.btn-3d-3:active,.btn-3d-4:active {background-color: #fd98ba; color: rgb(70, 69, 69);}
  .btn-3d-1:active,.btn-3d-2:active,.btn-3d-3:active,.btn-3d-4:active {
	top: 3px;
  }
  .btn-3d-2 {
	position: relative;
	display: inline-block;
	font-size: 20px;
	padding: 8px 30px;
	color: white;
	margin: -10px 0px 10px 70px;
	border-radius: 10px;
	text-align: center;
	transition: top .01s linear;
	text-shadow: 0 1px 0 rgba(0,0,0,0.15);
	background-color: #e2bbe7;
	box-shadow: 0 0 0 1px #cb98df inset,
		  0 0 0 3px rgba(206, 121, 223, 0.534) inset,
		  0 8px 0 0 rgba(254, 253, 255, 0.863),
		  0 8px 0 2px rgba(0, 0, 0, 0.151),
		  0 8px 8px 1px rgba(242, 184, 253, 0.5);
  }
  .btn-3d-4 {
	position: relative;
	display: inline-block;
	font-size: 20px;
	padding: 8px 30px;
	color: white;
	margin: 10px 0px 30px 70px;
	border-radius: 10px;
	text-align: center;
	transition: top .01s linear;
	text-shadow: 0 1px 0 rgba(0,0,0,0.15);
	background-color: #e2bbe7;
	box-shadow: 0 0 0 1px #cb98df inset,
		  0 0 0 3px rgba(206, 121, 223, 0.534) inset,
		  0 8px 0 0 rgba(254, 253, 255, 0.863),
		  0 8px 0 2px rgba(0, 0, 0, 0.151),
		  0 8px 8px 1px rgba(242, 184, 253, 0.5);
  }
  .btn-3d-3 {
	position: relative;
	display: inline-block;
	font-size: 20px;
	padding: 6px 30px;
	color: white;
	align-self: left;
	border-radius: 6px;
	text-align: center;
	transition: top .01s linear;
	text-shadow: 0 1px 0 rgba(0,0,0,0.15);
	background-color: #d49de2;
	box-shadow: 0 0 0 1px #cb98df inset,
		  0 0 0 2px rgba(255,255,255,0.15) inset,
		  0 8px 0 0 rgba(219, 155, 245, 0.7),
		  0 8px 0 1px rgba(0,0,0,.4),
		  0 8px 8px 1px rgba(0,0,0,0.5);
	margin-left: 1320px;
	margin-top: 10px;
	margin-bottom: 10px;
  }

  /*메인 컨텐트 상품사진*/
  .slidebox1 {max-width:1400px;margin:0 auto;position:relative; margin-top: 50px;}
  .slidebox1 .slidelist1 {position:relative;white-space:nowrap;font-size:0;overflow:hidden;}
  .slidebox1 .slidelist1 .slideitem1 {position:relative;display:inline-block;vertical-align:middle;width:100%;transition:all 1s;}
  .slidebox1 .slidelist1 .slideitem1 > a {display:contents;}
  .slidebox1 .slidelist1 .slideitem1 > a img {width: 300px; height: 370px; margin: 2px; margin-top: 10px; margin-left: 20px; border-radius: 10px;}
  
  .slidebox1 .slide-control1 [class*="control"] label {position:absolute;z-index:10;top:50%;transform:translateY(-50%);padding:20px;border-radius:50%;cursor:pointer;}
  .slidebox1 .slide-control1 [class*="control"] label.prev {left:-50px;background:#d082e4 url('./img/left-arrow.png') center center / 50% no-repeat;}
  .slidebox1 .slide-control1 [class*="control"] label.next {right:-50px;background:#d082e4 url('./img/right-arrow.png') center center / 50% no-repeat;}
  
  [name="slide1"] {display:none;}
  #slide05:checked ~ .slidelist1 .slideitem1 {left:0;}
  #slide06:checked ~ .slidelist1 .slideitem1 {left:-100%;}
  #slide07:checked ~ .slidelist1 .slideitem1 {left:-200%;}
  #slide08:checked ~ .slidelist1 .slideitem1 {left:-300%;}
  
  .slide-control1 [class*="control"] {display:none;}
  #slide05:checked ~ .slide-control1 .control01 {display:block;}
  #slide06:checked ~ .slide-control1 .control02 {display:block;}
  #slide07:checked ~ .slide-control1 .control03 {display:block;}
  #slide08:checked ~ .slide-control1 .control04 {display:block;}

  #line1{
	border: #E0BFE6 solid 5px;
	margin-top: 10px;
	margin-bottom: 10px;
  }
  
  /*메인로그인프로필*/

    </style>
</head>
<body>
    <div class="wrap">
	<%@include file="../common/menubar.jsp" %>
        <div id="line1"></div> 
        <!--navigator-->
        <div id="navigator">
            <div id="navi1">
                <div class="slidebox">
                    <input type="radio" name="slide" id="slide01">
                    <input type="radio" name="slide" id="slide02"checked>
                    <input type="radio" name="slide" id="slide03">
                    <input type="radio" name="slide" id="slide04">
                    <ul class="slidelist" >
                        <li class="slideitem" >
                            <div>
                                <label for="slide04" class="left"></label>
                                <label for="slide02" class="right"></label>
                                <a><img src="resources/img/메인배너1.PNG"></a>
                            </div>
                        </li>
                        <li class="slideitem">
                            <div>
                                <label for="slide01" class="left"></label>
                                <label for="slide03" class="right"></label>
                                <a><img src="resources/img/메인배너2.png"></a>
                            </div>
                        </li>
                        <li class="slideitem">
                            <div>
                                <label for="slide02" class="left"></label>
                                <label for="slide04" class="right"></label>
                                <a><img src="resources/img/메인배너3.PNG"></a>
                            </div>
                        </li>
                        <li class="slideitem">
                            <div>
                                <label for="slide03" class="left"></label>
                                <label for="slide01" class="right"></label>
                                <a><img src="resources/img/메인배너4.PNG"></a>
                            </div>
                        </li>
                    </ul>
                </div>   
            </div>
            <div id="navi2">
                <div id="login2">
                	<% if(loginUser ==null) { %>
                    <img src="img/아이콘4.png" height="230px" width="100%">
                    <%} else { %>
                    <div id=logininfo align="center">
                        <a id="logmem" style="font-size:30px;"><%= loginUser.getMemName()%></a><a style="font-size:20px;">님 <br> 내일 뭐입지 이용중 디자인 수정하기ㅠㅠ</a>
                    </div>
                    </div>
                    <div id="login3">
                    <a href="#" class="btn-3d-1">마이페이지</a>
                    <a href="#" class="btn-3d-4">장바구니</a>
                    <a href="<%= contextPath %>/logout.me" class="btn-3d-2">로그아웃</a>
                </div> 
                <%} %>
            </div>
        </div>

        <!--content-->
        <div id="content">
            <div id="line1"></div> 
            <a href="#" class="btn-3d-3">STYLE UP</a>
            <div class="slidebox1">
                <input type="radio" name="slide1" id="slide05" checked>
                <input type="radio" name="slide1" id="slide06">
                <input type="radio" name="slide1" id="slide07">
                <input type="radio" name="slide1" id="slide08">
                <ul class="slidelist1">
                    <li class="slideitem1">
                        <a>
                            <a><img src="resources/img/아이콘1.png"></a>
                            <a><img src="resources/img/아이콘1.png"></a>
                            <a><img src="resources/img/아이콘1.png"></a>
                            <a><img src="resources/img/아이콘1.png"></a>
                        </a><br>
                            <a><img src="resources/img/아이콘1.png"></a>
                            <a><img src="resources/img/아이콘1.png"></a>
                            <a><img src="resources/img/아이콘1.png"></a>
                            <a><img src="resources/img/아이콘1.png"></a>
                        </a><br>
                            <a><img src="resources/img/아이콘1.png"></a>
                            <a><img src="resources/img/아이콘1.png"></a>
                            <a><img src="resources/img/아이콘1.png"></a>
                            <a><img src="resources/img/아이콘1.png"></a>
                        </a>
                    </li>
                    <li class="slideitem1">
                        <a>
                            <a><img src="resources/img/아이콘3.png"></a>
                            <a><img src="resources/img/아이콘3.png"></a>
                            <a><img src="resources/img/아이콘3.png"></a>
                            <a><img src="resources/img/아이콘3.png"></a>
                        </a><br>
                            <a><img src="resources/img/아이콘3.png"></a>
                            <a><img src="resources/img/아이콘3.png"></a>
                            <a><img src="resources/img/아이콘3.png"></a>
                            <a><img src="resources/img/아이콘3.png"></a>
                        </a><br>
                            <a><img src="resources/img/아이콘3.png"></a>
                            <a><img src="resources/img/아이콘3.png"></a>
                            <a><img src="resources/img/아이콘3.png"></a>
                            <a><img src="resources/img/아이콘3.png"></a>
                        </a>
                    </li>
                    <li class="slideitem1">
                        <a>
                            <a><img src="resources/img/이미지1.png"></a>
                            <a><img src="resources/img/이미지1.png"></a>
                            <a><img src="resources/img/이미지1.png"></a>
                            <a><img src="resources/img/이미지1.png"></a>
                        </a><br>
                            <a><img src="resources/img/이미지1.png"></a>
                            <a><img src="resources/img/이미지1.png"></a>
                            <a><img src="resources/img/이미지1.png"></a>
                            <a><img src="resources/img/이미지1.png"></a>
                        </a><br>
                            <a><img src="resources/img/이미지1.png"></a>
                            <a><img src="resources/img/이미지1.png"></a>
                            <a><img src="resources/img/이미지1.png"></a>
                            <a><img src="resources/img/이미지1.png"></a>
                        </a>
                    </li>
                    <li class="slideitem1">
                        <a>
                            <a><img src="resources/img/이미지2.png"></a>
                            <a><img src="resources/img/이미지2.png"></a>
                            <a><img src="resources/img/이미지2.png"></a>
                            <a><img src="resources/img/이미지2.png"></a>
                        </a><br>
                           <a><img src="resources/img/이미지2.png"></a>
                            <a><img src="resources/img/이미지2.png"></a>
                            <a><img src="resources/img/이미지2.png"></a>
                            <a><img src="resources/img/이미지2.png"></a>
                        </a><br>
                           <a><img src="resources/img/이미지2.png"></a>
                            <a><img src="resources/img/이미지2.png"></a>
                            <a><img src="resources/img/이미지2.png"></a>
                            <a><img src="resources/img/이미지2.png"></a>
                        </a>
                    </li>
                    
                </ul>
                <div class="slide-control1">
                    <div class="control01">
                        <label for="slide08" class="prev"></label>
                        <label for="slide06" class="next"></label>
                    </div>
                    <div class="control02">
                        <label for="slide05" class="prev"></label>
                        <label for="slide07" class="next"></label>
                    </div>
                    <div class="control03">
                        <label for="slide06" class="prev"></label>
                        <label for="slide08" class="next"></label>
                    </div>
                    <div class="control04">
                        <label for="slide07" class="prev"></label>
                        <label for="slide05" class="next"></label>
                    </div>
                </div>
            </div>
               
        </div>
        <!--footer-->
        <div id="f1"></div>
        <div id="footer">
        <div class="ft" style="border-left: white;">
        <h4>전화 문의(9시~16시)</h4>
        <h4 style="font-weight: lighter;">
            1588-1588
        </h4>
        </div>
        <div class="ft">
        <h4>고객센터 미운영시간 안내 </h4>
        <h4 style="font-weight: lighter;">
            점심시간(12시~13시) <br>
            (토/일, 공휴일은 휴무)
        </h4>
        </div>
        <div class="ft">
        <h4>약관 및 정책 안내 </h4>    
        <h4 style="font-weight: lighter;"> 
            개인정보처리방침 <br>
            이용약관 <br>
            사업자 정보 확인
        </h4>
    </div>
    <div class="ft" style="border-right: white;">
        <img src="resources/img/로고1.png" alt=".." width="100%" height=100% style="padding:5% 0%;" margin="5px" >        
    </div>
</div>
    
    </div>
</body>
</html>