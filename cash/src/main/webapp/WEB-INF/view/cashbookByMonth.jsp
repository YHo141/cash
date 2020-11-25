<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link href="${path}/resources/css/calendar.css" type="text/css" media="all" rel="stylesheet">
<style type="text/css">
	.sunday {color: red}
</style>
</head>
<body>
<div class="row">
<div class="col"></div>
<div class="col-10">
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<h3>목록</h3>
	
	<!-- 다이어리 -->	
	<div>
		이번달 수입 합계 : ${sumIn}
	</div>
	<div>
		이번달 지출 합계 : ${sumOut}
	</div>
	<h3>
		<a href="${pageContext.request.contextPath}/admin/cashbookByMonth/${currentYear}/${currentMonth-1}">[이전달]</a>
			${currentYear}년 ${currentMonth} 월
		<a href="${pageContext.request.contextPath}/admin/cashbookByMonth/${currentYear}/${currentMonth+1}">[다음달]</a>
	</h3>
	<div>
		<table border="1" class="small_calendar calendar-table table table-bordered">
			<thead>
				<tr>
					<th>일</th>
					<th>월</th>
					<th>화</th>
					<th>수</th>
					<th>목</th>
					<th>금</th>
					<th>토</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<c:forEach var="i" begin="1" end="${lastDay+(firstDayOfWeek-1)}" step="1">
						<c:if test="${i-(firstDayOfWeek-1) <1 }">
							<td>&nbsp;</td>
						</c:if>
						<c:if test="${i-(firstDayOfWeek-1) >0}">

							<td>
							
								<!-- 날짜 -->
								<div class="day">
								<a href="${pageContext.request.contextPath}/admin/cashbookByDay/now/${currentYear}/${currentMonth}/${i-(firstDayOfWeek-1)}">
								<font size="5px" color="beige">
									${i-(firstDayOfWeek-1)}</font>
								</a>
								</div>
								<!-- 지출 / 수입 목록이 있는 날짜를 cashList에서 검색 -->
								<c:forEach var="c" items="${cashList}">
									<c:if test="${i-(firstDayOfWeek-1) == c.dday}">
										<c:if test="${c.cashbookKind == '수입'}">
											<div>수입 : ${c.cashPrice}</div>
										</c:if>
										<c:if test="${c.cashbookKind == '지출'}">
											<div>지출 : ${c.cashPrice}</div>
										</c:if>
									</c:if>
								</c:forEach>
							</td>
							
							</c:if>
						<c:if test="${i%7 == 0}">
							<tr></tr>
						</c:if>
					</c:forEach>
					
					<c:if test="${(lastDay+(firstDayOfWeek-1)) %7 !=0 }">
						<c:forEach begin="1" end="${7-((lastDay+(firstDayOfWeek-1)) %7)}" step="1">
								<td>&nbsp;</td>
						</c:forEach>
					</c:if>
				</tr>
			</tbody>
		</table>
	</div>
	</div>
	<div class="col"></div>
	</div>

</body>
</html>
