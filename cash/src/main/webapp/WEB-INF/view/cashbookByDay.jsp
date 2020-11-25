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
	<h1>cashbookListByDay</h1>
		
	<div>
		<a href="${pageContext.request.contextPath}/admin/cashbookByDay/pre/${currentYear}/${currentMonth}/${currentDay}">이전</a>
			${currentYear}년 ${currentMonth}월 ${currentDay}일
		<a href="${pageContext.request.contextPath}/admin/cashbookByDay/next/${currentYear}/${currentMonth}/${currentDay}">다음</a>
	</div>
	
	<a href="/admin/addCashbook/add/${currentYear}/${currentMonth}/${currentDay}">수입/지출 입력</a>
	<table border="1" class="table table-hover table-striped">
		<thead>
			<tr>
				<th>cashbookId</th>
				<th>cashbookKind</th>
				<th>categoryName</th>
				<th>cashbookPrice</th>
				<th>cashbookContent</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach var="c" items="${cashbookList}">
				<tr>
					<td>${c.cashbookId}</td>
					<td>${c.cashbookKind}</td>
					<td>${c.categoryName}</td>
					<td>${c.cashbookPrice}</td>
					<td>${c.cashbookContent}</td>
					<td><a href="${pageContext.request.contextPath}/admin/modifyCashbook/modify/${c.cashbookId}" class="btn btn-primary">수정</a></td>
					<td><a href="${pageContext.request.contextPath}/admin/removeCashbook/remove/${c.cashbookId}" class="btn btn-danger">삭제</a></td>
				</tr>
			</c:forEach>
			<c:if test="${empty cashbookList}">
				<tr>
					<td>데이터가 없습니다.</td>
				</tr>
			</c:if>
		</tbody>
	</table>
	</div>
	<div class="col"></div>
	</div>
</body>
</html>