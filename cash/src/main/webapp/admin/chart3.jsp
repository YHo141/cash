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
	<h1>chart3</h1>
	<!-- chart3 -->
	<div>
		<div>
			<input type="text" id="year">
			<button id="totalOfCategoryNameByYearChart" type="button">입력</button>
		</div>
			년도별 카테고리 수입
		<div>
			<canvas id="chart3"></canvas>
		
		</div>
	</div>
	<!-- table -->
	<div>
		
	</div>
</div>
<div class="col"></div>
</div>	
</body>
<script>
	$('#totalOfCategoryNameByYearChart').click(function(){
		$.ajax({
				url:'/totalOfCategoryNameByYear/'+$('#year').val(),
				type:'get',
				date:{},
				success:function(data){
						var ctx = $('#chart3')
						var chart = new Chart(ctx,{
								type : 'doughnut',
								data : {
							    	labels:['관광', '급여', '생활', '식비', '용돈', '의료'],
							    	
							    	datasets:[{
							    		
							    		backgroundColor:[
								    			'rgb(255, 99, 132, 0.2)',
								    			'rgb(152, 139, 13, 0.2)',
								    			'rgb(60, 99, 132, 0.2)',
								    			'rgb(53, 19, 132, 0.2)',
								    			'rgb(1, 199, 13, 0.2)',
								    			'rgb(125, 9, 1, 0.2)'
							    			],
							    		
							    		borderColor:[
								    			'rgb(255, 99, 132, 0.2)',
								    			'rgb(152, 139, 13, 0.2)',
								    			'rgb(60, 99, 132, 0.2)',
								    			'rgb(53, 19, 132, 0.2)',
								    			'rgb(1, 199, 13, 0.2)',
								    			'rgb(125, 9, 1, 0.2)'
							    			],
							    		
							    		data:[data.관광, data.급여, data.생활, data.식비, data.용돈, data.의료]
							    		
							    	}]
							    	
							    },
								option : {}
							
							})
					}
			});
	});
</script>
</html>