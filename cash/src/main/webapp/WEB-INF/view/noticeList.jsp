<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeList.jsp</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="row">
<div class="col"></div>
<div class="col-6">
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<h1>공지사항</h1>
	<div>
		<!-- 공지 -->
		<a href="/admin/addNotice">공지추가</a>
		<table border="1" class="table table-hover table-striped">
			<thead>
				<tr>
					<th>notice_id</th>
					<th>notice_title</th>
					<th>notice_date</th>
					<th>상세보기</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="n" items="${noticeList}">
					<tr>
						<td>${n.noticeId}</td>
						<td>${n.noticeTitle}</td>
						<td>${n.noticeDate}</td>
						<td><a href="/admin/noticeOne/${n.noticeId}">상세보기</a></td>
					</tr>
				</c:forEach>
			</tbody>
			
		</table>
			<c:if test="${currentPage != 1}">
				<a href="/admin/noticeList/1">처음으로</a>
			</c:if>
			&nbsp;
			<c:if test="${currentPage > 1}">
				<a href="/admin/noticeList/${currentPage - 1}">이전</a>
			</c:if>
			&nbsp;&nbsp;
			<c:if test="${currentPage < lastPage}">
				<a href="/admin/noticeList/${currentPage + 1}">다음</a>
			</c:if>
			<c:if test="${currentPage != lastPage}">
				<a href="/admin/noticeList/${lastPage}">마지막으로</a>
			</c:if>

			<div>현재 페이지 : ${currentPage}</div>
			<div>최대 출력 목록 갯수 : ${rowPerPage}</div>
			<div>마지막 페이지 : ${lastPage}</div>
			<div>공지사항 갯수 : ${noticeCount}</div>
	</div>
</div>
<div class="col"></div>
</div>
</body>
</html>