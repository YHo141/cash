<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<div class="row">
<div class="col"></div>
<div class="col-6">
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<h1>modifyNotice</h1>
	<div>
		<form id="updateForm" method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath}/admin/modifyNotice/${notice.noticeId}">
			<table border="1">
	
					<tr>
						<th>notice_id</th>
						<td>${notice.noticeId}</td>
					</tr>
					<tr>
						<th>notice_title</th>
						<td><input type="text" name="noticeTitle" value="${notice.noticeTitle}"></td>
					</tr>
					<tr>
						<th>notice_content</th>
						<td><textarea name="noticeContent">${notice.noticeContent}</textarea></td>
					</tr>
					
					<tr>
						<th>notice_file</th>
						<td>
							<div>
								<button type = "button" id = "addBtn">파일추가</button>
								<button type = "button" id = "delBtn">파일삭제</button>
							</div>
							<div id="fileinput">
								<c:forEach var="nf" items="${notice.noticefile}">
									${nf.noticefileName}
								</c:forEach>
							</div>
						</td>
					</tr>
			</table>
			<button id="submitBtn" type="button">수정하기</button>
		</form>
	</div>
</div>
<div class="col"></div>
</div>
</body>
<script>
	$('#addBtn').click(function(){
		var html = '<div><input type="file" name="noticefile" class="noticefile"></div>';
		$('#fileinput').append(html);
	});
	
	$('#delBtn').click(function(){
		$('#fileinput').children().last().remove();
	})
	
	$('#submitBtn').click(function(){
		var ck = true;
		$('.noticefile').each(function(index, item){
			console.log($(item).val());
			if($(item).val() == '') {
				ck = false;
			}
		})
		if(ck == false) { // if(ck)
			alert('선택하지 않은 파일이 1개 이상 있습니다');
		} else {
			$('#updateForm').submit();
		}
	});
</script>
</html>