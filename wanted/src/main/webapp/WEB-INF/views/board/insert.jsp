<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal" />
</sec:authorize>
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
	<h3>Board Insert</h3>
	<form action="insert" method="post">
		<div class="form-group">
			<label for="title">제목:</label> <input type="text"
				class="form-control" id="title" name="title"
				placeholder="Enter title">
		</div>

		<div class="form-group">
			<label for="writer">작성자:</label> <input type="text"
				class="form-control" id="writer" name="writer"
				value="${principal.member.username}" readonly="readonly"
				name="subject">
		</div>

		<div class="form-group">
			<label for="content">내용:</label>
			<textarea class="form-control" rows="5" name="content" id="content"></textarea>
		</div>
		<div class="form-group text-right">
			<button type="submit" id="insert" class="btn btn-primary btn-sm">글쓰기</button>
		</div>
	</form>
</div>