<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@include file="../include/header.jsp"%>
<div class="container" style="padding: 40px 20px 40px 20px ">
	<h3>${board.writer }의글보기</h3>
	<div class="form-group">
		<label for="num">글번호:</label> <input type="text" class="form-control"
			id="num" name="num" value="${board.num }" readonly="readonly">
	</div>
	<div class="form-group">
		<label for="title">제목:</label> <input type="text" class="form-control"
			id="title" name="title" value="${board.title }" readonly="readonly">
	</div>
	<div class="form-group">
		<label for="pwd">글쓴이:</label> <input type="text" class="form-control"
			id="writer" name="writer" value="${board.writer }"
			readonly="readonly">
	</div>
	<div class="form-group">
		<label for="content">내용</label>
		<textarea class="form-control" rows="5" id="content" name="content"
			readonly="readonly">${board.content }</textarea>
	</div>
	<c:if test="${principal.member.username==board.writer}">
		<div class="form-group text-right">
			<button type="button" class="btn btn-secondary btn-sm" id="btnUpdate">수정</button>
			<button type="button" class="btn btn-danger btn-sm" id="btnDelete">삭제</button>
		</div>
	</c:if>
	<script>
		$("#btnDelete").click(function(){
			if(!confirm("정말 삭제할까요?")) return
			$.ajax({
				type:"delete",
				url:"/board/delete/${board.num}",
				success: function(resp){
					if(resp=="success"){
						alert("삭제성공")
						location.href="/board/list"
					}
				},
				error :function(e){
					alert("삭제실패:"+e)
				}
			})//ajax
		})//btndelete
		
		$("#btnUpdate").click(function(){
			if(!confirm("정말 수정할까요?")) return
			location.href="/board/update/${board.num}"	
		})
</script>
</div>
<%@include file="../include/footer.jsp"%>

