<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<div>
		<!-- 공지 -->
		<table border="1">

				<tr>
					<th>notice_id</th>
					<td>${notice.noticeId}</td>
				</tr>
				<tr>
					<th>notice_title</th>
					<td>${notice.noticeTitle}</td>
				</tr>
				<tr>
					<th>notice_content</th>
					<td>${notice.noticeContent}</td>
				</tr>
		</table>
		<a href="/admin/modifyNotice/${notice.noticeId}">수정</a>
		<a href="/admin/removeNotice/${notice.noticeId}">삭제</a>
		&nbsp;&nbsp;&nbsp;
		<a href="/admin/noticeList/1">목록으로</a>
	</div>
</body>
</html>