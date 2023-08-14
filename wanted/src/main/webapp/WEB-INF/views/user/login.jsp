<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>

<div class="container" style="padding: 40px 20px 40px 20px ">
	<c:if test="${not empty errorMsg}">
	${errorMsg}
</c:if>
	<form action="/login" method="post">
		<div class="form-group">
			<label for="username">아이디:</label> <input type="text"
				class="form-control" id="username" placeholder="Enter emailid"
				name="username">
		</div>
		<div class="form-group">
			<label for="password">비밀번호:</label> <input type="password"
				class="form-control" id="password" placeholder="Enter password"
				name="password">
		</div>
		<button class="btn btn-secondary">LOGIN</button>
	</form>
</div>

<%@include file="../include/footer.jsp"%>
