<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addNotice</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="row">
<div class="col"></div>
<div class="col-6">
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<h1>modifyNotice</h1>
	<div>
		<form method="post" action="/admin/addNotice">
			<table border="1">
					<tr>
						<th>notice_title</th>
						<td><input type="text" name="noticeTitle" class="form-control"></td>
					</tr>
					<tr>
						<th>notice_content</th>
						<td><textarea name="noticeContent" class="form-control"></textarea></td>
					</tr>
			</table>
			<button type="submit" class="btn btn-primary">추가하기</button>
		</form>
	</div>
</div>
<div class="col"></div>
</div>
</body>
</html>