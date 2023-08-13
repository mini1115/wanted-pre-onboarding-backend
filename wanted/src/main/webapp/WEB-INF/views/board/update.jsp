<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal" />
</sec:authorize>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<html>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal" />
</sec:authorize>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<h3>${board.writer }의글 수정하기</h3>
		<input type="hidden" name="num" id="num" value="${board.num }" />
		<div class="form-group">
			<label for="title">제목:</label> <input type="text"
				class="form-control" id="title" name="title" value="${board.title }">
		</div>
		<div class="form-group">
			<label for="pwd">글쓴이:</label> <input type="text" class="form-control"
				id="writer" name="writer" value="${board.writer }"
				readonly="readonly">
		</div>
		<div class="form-group">
			<label for="content">내용</label>
			<textarea class="form-control" rows="5" id="content" name="content">${board.content }</textarea>
		</div>
		<div class="form-group text-right">
			<button type="button" class="btn btn-secondary btn-sm" id="btnUpdate">수정하기</button>
		</div>
	</div>
</body>
<script>
	//수정
	$("#btnUpdate").click(function() {
		data = {
			"num" : $("#num").val(),
			"title" : $("#title").val(),
			"content" : $("#content").val()
		}
		$.ajax({
			type : "put",
			url : "/board/update",
			contentType : "application/json;charset=utf-8",
			data : JSON.stringify(data),
			success : function(resp) {
				if (resp == "success") {
					alert("수정성공")
					location.href = "/board/list";
				}
			},
			error : function(e) {
				alert("수정실패 : " + e);
			}

		})//ajax
	})//btnfunction
</script>
</html>