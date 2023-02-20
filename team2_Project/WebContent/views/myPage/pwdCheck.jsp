<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<style>
#pwd_box {
	/* border: 1px rgb(51, 51, 51) solid; */
	/* border-radius: 20%; */
	font-size: 1.5rem;
	font-weight: bold;
}

#pwd_box form {
	padding-left: 350px;
	padding-top:50px;	
}
#pwd_box
</style>
</head>

<body>
	<%@include file="../common/menu.jsp"%>
	<%@include file="../common/leftList.jsp"%>



	<div id="content_title">
		<p>비밀번호 확인</p>
	</div>
	<div id="pwd_box">
		<p>
			회원님의 개인정보를 안전하게 보호하기 위해<br> 비밀번호를 입력해주세요
		</p>
		<form class="form-inline" action="<%=contextPath%>/pwdCheck.mp"
			method="post">

			<input type="hidden" name="memId" value="<%=loginUser.getMemId()%>">

			<input type="password" class="form-control mb-2 mr-sm-2"
				placeholder="비밀번호를 입력해주세요" id="pwd" name="pwdCheck">

			<button type="submit" class="btn btn-primary mb-2">확인하기</button>
		</form>
	</div>

	<%@include file="../common/footer.jsp"%>


</body>

</html>