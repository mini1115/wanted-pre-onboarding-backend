<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>

<body>
<div class="container" style="padding: 40px 20px 40px 20px ">
		<h3>${board.writer }의글수정하기</h3>
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

	<%@include file="../include/footer.jsp"%>