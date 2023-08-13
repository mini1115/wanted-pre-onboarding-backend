<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
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
<head>
</head>
<meta charset="UTF-8">
<body>
	<div>
		<h3>게시판(${count})</h3>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
			</thead>
			<c:forEach items="${lists.content}" var="board">
				<tr>
					<td>${board.num}</td>
					<td><a href="/board/detail/${board.num}">${board.title}</a></td>
					<td>${board.writer}</td>
					<td><fmt:formatDate value="${board.regdate}"
							pattern="yyyy-MM-dd" /></td>
				</tr>
			</c:forEach>
			<tbody>
			</tbody>
		</table>
		<div class="d-flex justify-content-between mt-5 mr-auto">
			<ul class="pagination">
				<c:if test="${lists.first==false }">
					<li class="page-item"><a class="page-link"
						href="?page=${lists.number-1 }">이전</a></li>
				</c:if>
				<c:if test="${lists.last==false }">
					<li class="page-item"><a class="page-link"
						href="?page=${lists.number+1 }">다음</a></li>

				</c:if>

			</ul>
		</div>
	</div>
</body>
</html>