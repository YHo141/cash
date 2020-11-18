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
	<h1>chart2</h1>
	<!-- chart2 -->
	<div>
		<canvas id="chart2"></canvas>
	
	</div>
	<!-- table -->
	<div>
	
	</div>
	
</body>
<script>
	$.ajax({
			url:'/totalOfMonthByYear',
			type:'get',

			success:function(data){
				console.log(data);
					/*
						data(데이터가든 타입)
					*/
					var ctx = $('#chart2');
					var myLineChart = new Chart(ctx, {
						
					    type: 'line',
					    
					    data: {
							labels:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
							
							datasets:[{
								backgroundColor:[
					    			'rgb(255, 99, 132, 0)'
				    			],
								borderColor:[
					    			'rgb(255, 99, 132, 0.5)'
				    			],
				    			
								data:[data.january,
									 data.february,
									 data.march,
									 data.april,
									 data.may,
									 data.june,
									 data.july,
									 data.august,
									 data.september,
									 data.october,
									 data.november,
									 data.december],

									pointRadius: 5,
									pointHoverRadius: 10
									
									
								}]
						},
						
					    options: {
					        scales: {
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