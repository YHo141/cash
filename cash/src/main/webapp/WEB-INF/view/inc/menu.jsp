<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<div>
	<a href="${pageContext.request.contextPath}/admin/index" class="btn btn-primary">index</a>
	<a href="${pageContext.request.contextPath}/admin/cashbookByMonth/-1/-1" class="btn btn-primary">cashbook</a>
	<a href="${pageContext.request.contextPath}/admin/cashbookList/1" class="btn btn-primary">cashbookList</a>
	<a href="${pageContext.request.contextPath}/admin/noticeList/1" class="btn btn-primary">공지사항</a>
	<a href="${pageContext.request.contextPath}/admin/cashStats.jsp" class="btn btn-primary">CashStats</a>
	<a href="${pageContext.request.contextPath}/admin/logout" class="btn btn-danger">로그아웃</a>
	<a href="${pageContext.request.contextPath}/admin/addMember" class="btn btn-primary">사용자 추가</a>
</div>