<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="row">
<div class="col"></div>
<div class="col-10">
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<h1>index</h1>
	<div><h2>공지</h2><a href="${pageContext.request.contextPath}/admin/">more</a></div>
	<div>
		<!-- 공지 -->
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
	</div>
	<h2>월별 수입/지출</h2>
	<div>
		<!-- 수입/지출/합계 -->
		<table border="1" class="table table-hover table-striped">
			<thead>
				<tr>
					<th>날짜</th>
					<th>수입</th>
					<th>지출</th>
					<th>합계</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="io" items="${inOutList}">
					<tr>
						<td>${io["날짜"]}</td>
						<td>${io["수입"]}원</td>
						<td>${io["지출"]}원</td>
						<td>${io["합계"]}원</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<h2>사용기술</h2>
		자바스크립트, 모델2 방식
</div>
<div class="col"></div>
</div>
</body>
</html>