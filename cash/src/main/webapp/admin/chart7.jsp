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
	<h1>chart7</h1>
	<!-- chart7 -->
	<div>
		<input type="text" id="year">
		<button id="totalSumByYearChart" type="button">입력</button>
	</div>
		월별 이익
	<div>
		<canvas id="chart7"></canvas>
	</div>
	<!-- table -->
	<div>
	
	</div>
</div>
<div class="col"></div>
</div>	
</body>
<script>
$('#totalSumByYearChart').click(function(){
	$.ajax({
			url:'/totalSumByYear/'+$('#year').val(),
			type:'get',
			success:function(data){
				console.log(data);
				var ctx = $('#chart7');
				var chart = new Chart(ctx,{
					type:'line',
					data:{
						labels:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],

						datasets:[{
							label : '년도별 수입',
							backgroundColor:[
					    			'rgb(107, 102, 255, 0.5)'
				    			],
				    		borderColor:[
					    			'rgb(107, 102, 255, 0.5)'
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
				    		borderWidth: 1,
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
	});
</script>
</html>