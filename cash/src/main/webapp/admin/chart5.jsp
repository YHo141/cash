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
	<h1>chart5</h1>
	<!-- chart5 -->
		년도별 총 수입
	<div>
		<canvas id="chart5"></canvas>
	
	</div>
	<!-- table -->
	<div>
	
	</div>
</div>
<div class="col"></div>
</div>	
</body>
<script>
	$.ajax({
			url:'${pageContext.request.contextPath}/totalInByYear',
			type:'get',
			
			success:function(data){
				console.log(data);
				var ctx = $('#chart5');
				var chart = new Chart(ctx,{
					type:'horizontalBar',
					data:{
						labels:['2018','2019','2020'],

						datasets:[{
							label : '년도별 수입',
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
				    		data:[data.a수입, data.b수입, data.c수입],
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