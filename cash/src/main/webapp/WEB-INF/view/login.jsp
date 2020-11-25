<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
	
	<div class="row">
		<!-- 공지 -->
		<div class="col"></div>
		<div class="col-6">
		<h1>공지사항</h1>
		<table border="1" class="table table-hover table-striped">
			<thead>
				<tr>
					<th>notice_id</th>
					<th>notice_title</th>
					<th>notice_date</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="n" items="${noticeList}">
					<tr>
						<td>${n.noticeId}</td>
						<td>${n.noticeTitle}</td>
						<td>${n.noticeDate}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	
	<h1>로그인</h1>
	<form method="post" action="${pageContext.request.contextPath}/login" class="was-validated">
		<div class="form-group">
			<div>
				ID<input type="text" name="id" class="form-control" placeholder="아이디를 입력해주세요" required>
			</div>
			
			<div>
				PW<input type="password" name="pw" class="form-control" placeholder="비밀번호를 입력해주세요" required>
			</div>
			&nbsp;
			<div>
				<button type="submit" class="btn btn-primary">로그인</button>
			</div>
		</div>
	</form>
	</div>
	<div class="col"></div>
	</div>
	</div>
</body>
</html>