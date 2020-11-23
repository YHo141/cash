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
<div class="row">
<div class="col"></div>
<div class="col-10">
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/view/inc/chartMenu.jsp"></jsp:include>
	<h1>chart6</h1>
	<!-- chart6 -->
	<div>
		<input type="text" id="year">
		<button id="totalInByCategoryByYearChart" type="button">입력</button>
	</div>
		년도별 카테고리별 수입
	<div>
		<canvas id="chart6"></canvas>
	</div>
	<!-- table -->
	<div>
	
	</div>
</div>
<div class="col"></div>
</div>	
</body>
<script>
$('#totalInByCategoryByYearChart').click(function(){
	$.ajax({
			url:'/totalInByCategory/'+$('#year').val(),
			type:'get',
			success:function(data){
					console.log(data);
					var ctx = $('#chart6');
					var chart = new Chart(ctx,{
							type : 'pie', 
							data : {
									labels : ['급여','용돈'],
									datasets : [{
											label : '수입',
											backgroundColor : [
												'rgb(255, 99, 132, 0.5)',
												'rgb(150, 197, 166, 0.5)'
												],
											borderColor : [
												'rgb(255, 99, 132, 0.5)',
												'rgb(150, 197, 166, 0.5)'
												],
											data : [data.급여, data.용돈]
										}]
								},
								options: {
							        scales: {
							            xAxes: [{
							                stacked: true
							            }],
							            yAxes: [{
							                stacked: true
							            }]
							        }
							    }
						});
				}
		});
});
</script>
</html>