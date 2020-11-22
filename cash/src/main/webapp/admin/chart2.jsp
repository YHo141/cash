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
			url:'/OutMaxPriceByYear',
			type:'get',

			success:function(data){
				console.log(data);
					var ctx = $('#chart2');
					var myLineChart = new Chart(ctx, {
						
					    type: 'polarArea',
					    
					    data: {
							labels:['2018','2019','2020'],
							
							datasets:[{
								backgroundColor:[
					    			'rgb(107, 102, 255, 0.5)',
					    			'rgb(243, 97, 166, 0.5)',
					    			'rgb(155, 255, 132, 0.5)'
				    			],
				    			borderColor:[
					    			'rgb(107, 102, 255, 0.5)',
					    			'rgb(243, 97, 166, 0.5)',
					    			'rgb(155, 255, 132, 0.5)'
				    			],
								data:[data.one, data.two, data.three]

								}]
						}
						
					});

				}
		});
</script>
</html>