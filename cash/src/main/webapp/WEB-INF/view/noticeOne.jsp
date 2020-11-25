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
<div class="col-6">
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
				<tr>
					<th>noticefile_list</th>
					<c:forEach var="n" items="${notice.noticefile}">
							<td>${n.noticefileName}</td>
					</c:forEach>
				</tr>
		</table>
		<a href="${pageContext.request.contextPath}/admin/modifyNotice/${notice.noticeId}">수정</a>
		<a href="${pageContext.request.contextPath}/admin/removeNotice/${notice.noticeId}">삭제</a>
		&nbsp;&nbsp;&nbsp;
		<a href="${pageContext.request.contextPath}/admin/noticeList/1">목록으로</a>
	</div>
	<br>
	<div>
		<table border="1">
			<tr>
				<th>comment_id</th>
				<th>comment_content</th>
				<th>comment_date</th>
				<th>삭제</th>
			</tr>
			<c:forEach var="nc" items="${notice.commentList}">
				<tr>
					<td>${nc.commentId}</td>
					<td>${nc.commentContent}</td>
					<td>${nc.commentDate}</td>
					<td><a href="${pageContext.request.contextPath}/admin/removeComment/${nc.noticeId}/${nc.commentId}">삭제</a></td>
				</tr>
			</c:forEach>
			
		</table>
		<form method="post" action="${pageContext.request.contextPath}/admin/addComment">
			<input type="hidden" name="noticeId" value="${notice.noticeId}">
			<textarea name="commentContent" rows="3" cols="50"></textarea>
			<button type="submit">댓글입력</button>
		</form>
	</div>
</div>
<div class="col"></div>
</div>
</body>
</html>