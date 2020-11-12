<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>

</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/view/inc/chartMenu.jsp"></jsp:include>
	<h1>chart7</h1>
	<!-- chart7 -->
	<div>
		<canvas id="chart7"></canvas>
	
	</div>
	<!-- table -->
	<div>
	
	</div>
	
</body>
<script>
	$.ajax({
			url:'',
			type:'',
			date:{},
			success:function(data){
					/*
						data(데이터가든 타입)
					
					*/
				}
		});
</script>
</html>