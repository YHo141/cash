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
	<h1>chart4</h1>
	<!-- chart5 -->
	<div>
		<canvas id="chart4"></canvas>
		년도별 지출현황
	</div>
	<!-- table -->
	<div>
	
	</div>
	
</body>
<script>
	$.ajax({
			url:'/totalOutByYear',
			type:'get',
			
			success:function(data){
				console.log(data);
				var ctx = $('#chart4');
				var chart = new Chart(ctx,{
					type:'horizontalBar',
					data:{
						labels:['2018','2019','2020'],

						datasets:[{
							backgroundColor:[
					    			'rgb(255, 99, 132, 0.5)',
					    			'rgb(200, 199, 13, 0.5)',
					    			'rgb(155, 255, 132, 0.5)'
				    			],
				    		borderColor:[
					    			'rgb(255, 99, 132, 0.5)',
					    			'rgb(200, 199, 13, 0.5)',
					    			'rgb(155, 255, 132, 0.5)'
				    			],
				    		data:[data.a지출, data.b지출, data.c지출],
				    		borderWidth: 1
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
</script>
</html>