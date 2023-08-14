<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../include/header.jsp"%>

<div class="container" style="padding: 40px 20px 40px 20px ">
	<h3 style="padding-bottom: 40px ">게시판 (${count}건의 게시글)</h3>
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
		<div>
			<form class="form-inline" action="/board/list" method="get">
				<select name='field' class="form-control mr-sm-1">
					<option value="title">제목</option>
					<option value="content">내용</option>

				</select> <input type="text" name="word" class="form-control"
					placeholder="Search">
				<button class="btn btn-secondary">Search</button>
			</form>
		</div>
	</div>
</div>

<%@include file="../include/footer.jsp"%>
