<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<div class="container">
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
</body>
</html>