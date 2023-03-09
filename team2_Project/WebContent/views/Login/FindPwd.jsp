<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
*{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    
}

body{
    display: flex;
    align-items: center;
    justify-content: center;
    min-height: 100vh;
    background: rgb(245, 245, 245);
}
.container{
    position: relative;
    width: 70vw;
    height: 80vh;
    background-color: #ffffff;
    border-radius: 15px;
    box-shadow: 0 4px 20px 0 rgba(0,0,0,0.3),0 6px 20px 0 rgba(0,0,0,0.3);
    overflow: hidden;
}

.container::before{
    
        content: "";
        position: absolute;
        top: 0;
        width: 100%;
        height: 100%; 
        background: linear-gradient(-45deg,rgb(155, 123, 212),rgb(255, 228, 228));
        z-index: 6;
        left: 50%;
        
        
}

.signin-signup{
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height:100%;
    display: flex;
    align-items: center;
    justify-content: space-around;
    z-index: 6;
}



.title{
    font-size: 35px;
    color: rgb(105, 72, 143);
    margin-bottom: 10px;
}
.input-field{
    width: 100%;
    height: 50px;
    background: rgb(255, 255, 255);
    margin: 10px 0;
    border: 2px solid rgb(206, 205, 205);
    border-radius: 50px;
    display: flex;
}


.input-field input{
    flex: 6;
    background: none;
    border: none;
    outline: none;
    width: 100%;
    font-size: 18px;
    color: black;
    font-weight: 600px;
    color: #444;
}
.btn{
    width: 150px;
    height: 50px;
    border: none;
    border-radius: 50px;
    background-color: rgb(161, 99, 212);
    font-weight: 600px;
    font-size: 18px;
    margin: 10px 0;
    text-transform: uppercase;
    cursor: pointer;
    color: #ffffff;
}
.btn1{
    width: 150px;
    height: 50px;
    border: none;
    border-radius: 50px;
    background-color: rgba(248, 112, 146, 0.959);
    font-weight: 600px;
    font-size: 13px;
    margin: 10px 0;
    text-transform: uppercase;
    cursor: pointer;
    color: #ffffff;
    
}
.btn:hover{
    background-color: rgb(178, 119, 233);
}
</style>
</head>
<body>
    <div class="container">


            <form action="findPassword" class="sign-up-form" style="margin-top: 300px; margin-left: 50px;">
                <h2 style="font-size: 30px; color: plum;">비밀번호 찾기</h2>
                <br>
                <form action="findPassword" method="post">
                    <label for="username" style="font-size: 20px; font-weight: 600; color: rgb(0, 0, 0);">아이디:</label>
                    <input type="text" id="username" name="username" required style="width: 150px; height: 30px; border:solid 3px plum; border-radius: 6px;">
                    <br><br>
                    <label for="email" style="font-size: 20px; font-weight: 600; color: rgb(0, 0, 0);">이메일 주소:</label>
                    <input type="email" id="email" name="email" required style="width: 250px; height: 30px; border:solid 3px plum; border-radius: 6px;"><br>
                    <input type="submit" value="인증 이메일 전송" style="border-radius: 5px; width: 200px; height: 30px; border:solid 3px plum; margin-top: 10px; margin-left: 30px;">
                  </form>
                  




</body>
</html>