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
	<h1>가계부 수정</h1>
	<form method="post" action="${pageContext.request.contextPath}/admin/modifyCashbook">
	<table border="1" class="table table-bordered">
		<tr>
			<td>cashbook_id</td>
			<td><input type="text" name="cashbookId" value="${cashbook.cashbookId}" class="form-control" readonly="readonly"></td>
		</tr>
		<tr>
			<td>cashbook_kind</td>
				<td>
					<c:if test="${cashbook.cashbookKind == '수입'}">
						<input type="radio" value="수입" checked="checked" name="cashbookKind">수입
						<input type="radio" value="지출" name="cashbookKind">지출
					</c:if>
					<c:if test="${cashbook.cashbookKind == '지출'}">
						<input type="radio" value="수입" name="cashbookKind">수입
						<input type="radio" value="지출" checked="checked" name="cashbookKind">지출
					</c:if>
				</td>
				
		</tr>
		<tr>
			<td>category_name</td>
			<td>
			<select name = "categoryName">
				<c:forEach var = "c" items="${categoryList}">
					<option value = "${c.categoryName}">${c.categoryName}</option>
				</c:forEach>
			</select>
			</td>
		</tr>
		<tr>
			<td>cashbook_price</td>
			<td><input type="text" value="${cashbook.cashbookPrice}" name="cashbookPrice" class="form-control"></td>
		</tr>
		<tr>
			<td>cashbook_content</td>
			<td><input type="text" value="${cashbook.cashbookContent}" name="cashbookContent" class="form-control"></td>
		</tr>
	</table>
	<button type="submit" class="btn btn-primary">수정하기</button>
	</form>
</div>
<div class="col"></div>
</div>
</body>
</html>