<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>


<div class="container" style="padding: 40px 20px 40px 20px ">
	<h3 style="padding: 0px 0px 40px 0px ">게시글 작성</h3>
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
<%@include file="../include/footer.jsp"%>
