<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cashStats.html</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
	.hint {color:red;}
</style>
</head>
<body>
<div class="row">
<div class="col"></div>
<div class="col-10">
<div>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/view/inc/chartMenu.jsp"></jsp:include>
</div>

	<h1>Cashbook Stats Data</h1>
	
	<!-- 샘플 요청1 -->
	<div>
		<div><!-- 호출 -->
			ex1) 년도별 월 지출액 :
			<button id="totalOfMonthByYearTable" type="button">Table</button>
			<button id="totalOfMonthByYearChart" type="button">Chart</button>
			<button id="totalOfMonthByYearExcel" type="button">Excel</button>
		</div>
		<div>	<!-- 출력 -->
			<span id="totalOfMonthByYearTableResult" class="hint">데이터결과물의 테이블 or 차트 or 엑셀파일다운로드</span>
		</div>
		<div>
			<canvas id="myChart"></canvas>
		</div>
	</div>
	
	<!-- 샘플요청2 -->
	<div>
		<div>
			ex2) 년도별 수입/지출 지출액 :
			<input type="text" id="year">
			<button id="totalOutAndInByYearChart" type="button">Chart</button>
		</div>
		<div>
			<canvas id="pieChart"></canvas>
		</div>
	</div>
	
</div>
<div class="col"></div>
</div>	
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- 자트 CDN주소 -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script>

	$('#totalOutAndInByYearChart').click(function(){
		$.ajax({
			url: '/totalOutAndInByYear/'+$('#year').val(),
			type: 'get',
			success: function(data){
				let pieCtx = $('#pieChart');
				let pieChart = new Chart(pieCtx,{
					
					type: 'pie',
				    
				    data: {
				    	labels:['수입','지출'],
				    	
				    	datasets:[{
				    		
				    		backgroundColor:[
					    			'rgb(255, 99, 132, 0.2)',
					    			'rgb(1, 199, 13, 0.2)'
				    			],
				    		
				    		borderColor:[
					    			'rgb(255, 99, 132, 0.2)',
					    			'rgb(1, 199, 13, 0.2)'
				    			],
				    		
				    		data:[data.수입, data.지출]
				    		
				    	}]
				    	
				    },
				    
				    options: {}
				    
				});
			}
		});
		
	});



	$('#totalOfMonthByYearChart').click(function(){
		
		$.ajax({
			
			url:'/totalOfMonthByYear',
			
			type:'get',
			
			success: function(data){
					
				var ctx = document.getElementById('myChart').getContext('2d');
				var chart = new Chart(ctx, {
					
					type:'bar', // 차트종류
					
					data:{		// 차트안에 사용되는 모든 데이터
						
						labels:['january','february','march','april','may','june','july','august','september','october','november','december'],
						
						datasets:[{
							
							label:'2019년 월별 지출',
							
							backgroundColor:[
											'rgb(255, 99, 132, 0.2)',
											'rgb(155, 99, 132, 0.2)',
											'rgb(105, 99, 132, 0.2)',
											'rgb(15, 99, 132, 0.2)',
											'rgb(155, 199, 132, 0.2)',
											'rgb(155, 99, 12, 0.2)',
											'rgb(150, 159, 132, 0.2)',
											'rgb(205, 39, 102, 0.2)',
											'rgb(155, 209, 32, 0.2)',
											'rgb(55, 90, 132, 0.2)',
											'rgb(1, 199, 13, 0.2)',
											'rgb(105, 9, 132, 0.2)'
											],
											
							borderColor:[
										'rgb(255, 99, 132, 1)',
										'rgb(155, 99, 132, 1)',
										'rgb(105, 99, 132, 1)',
										'rgb(15, 99, 132, 1)',
										'rgb(155, 199, 132, 1)',
										'rgb(155, 99, 12, 1)',
										'rgb(150, 159, 132, 1)',
										'rgb(205, 39, 102, 1)',
										'rgb(155, 209, 32, 1)',
										'rgb(55, 90, 132, 1)',
										'rgb(1, 199, 13, 1)',
										'rgb(105, 9, 132, 1)'
										],
										
							// data속성의 배열값은 ajax호출 후 결과값으로 채워야 한다.(완료)
							data:[
								data.january,
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
								data.december
								],
							borderWidth: 1
						}]
					},
					
					option:{}
				});
			}
		});
	});



	$('#totalOfMonthByYearTable').click(function(){
		//	$('#totalOfMonthByYearTableResult').html('totalOfMonthByYearTableResult'); test
		$.ajax({
			url:'/totalOfMonthByYear',
			type:'get',
			success: function(data){
				console.log(data);
				let html = `
					<table border="1">
						<tr>
							<th>january</th>
							<th>february</th>
							<th>march</th>
							<th>april</th>
							<th>may</th>
							<th>june</th>
							<th>july</th>
							<th>august</th>
							<th>september</th>
							<th>october</th>
							<th>november</th>
							<th>december</th>
						</tr>
						<tr>
							<td>\${data.january}</td>
							<td>\${data.february}</td>
							<td>\${data.march}</td>
							<td>\${data.april}</td>
							<td>\${data.may}</td>
							<td>\${data.june}</td>
							<td>\${data.july}</td>
							<td>\${data.august}</td>
							<td>\${data.september}</td>
							<td>\${data.october}</td>
							<td>\${data.november}</td>
							<td>\${data.december}</td>
						</tr>
					</table>
				`;
				$('#totalOfMonthByYearTableResult').html(html);
			}
		});
	});
</script>
</html>