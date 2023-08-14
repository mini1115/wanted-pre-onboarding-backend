<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp"%>


<div class="jumbotron jumbotron-fluid">
	<div class="container">
		<h1>회원가입</h1>
	</div>
</div>

<div class="container" style="padding: 40px 20px 40px 20px ">
	<div class="form-group">
		<label for="username">이름:</label> <input type="text"
			class="form-control" id="username" placeholder="Enter UserID"
			name="username">
	</div>
	<div class="form-group">
		<label for="email">이메일:</label> <input type="text"
			class="form-control" id="email" placeholder="Enter email"
			name="email">
	</div>
	<div class="form-group">
		<label for="password">비밀번호:</label> <input type="password"
			class="form-control" id="password" placeholder="Enter password"
			name="password">
	</div>

	<button class="btn btn-secondary" id="btnJoin">회원가입</button>
</div>
<script>
	$("#btnJoin")
			.click(
					function() {

						var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/
						if ($("#username").val() == "") {
							alert("아이디를 입력하세요")
							$("#username").focus();
							return false;
						}
						if ($("#password").val() == "") {
							alert("아이디를 입력하세요")
							$("#password").focus();
							return false;
						}
						if ($("#email").val() == "") {
							alert("아이디를 입력하세요")
							$("#email").focus();
							return false;
						}
						if (!$("#email").val().match(regEmail)) {
							alert("이메일 양식이 아닙니다");
							$("#email").focus();
							return false;
						}
						var dataParam = {
							"username" : $("#username").val(),
							"email" : $("#email").val(),
							"password" : $("#password").val()
						}
						$.ajax({
							type : "post",
							url : "/register",
							contentType : "application/json;charset=utf-8",
							data : JSON.stringify(dataParam)
						}).done(function(resp) {
							if (resp == "success") {
								alert("회원가입성공")
								location.href = "/login";
							} else if (resp == "fail") {
								alert("아이디 중복")
								$("#username").val("")
							}
						}).fail(function() {
							alert("회원가입실패")
						})
					})//btnJoin
</script>
<%@include file="../include/footer.jsp"%>

