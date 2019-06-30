<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>

<style type="text/css">
#statistic_wrap h2{font-weight:normal; margin-top:40px;}
#statistic_wrap p{color:gray; margin-top:10px;}
</style>
</head>

<!-- 메인컨텐츠 시작 -->
<div id="mainContent_wrap">
	<div id="statistic_wrap" style="width: 1000px; margin: 0 auto;">
		<div id="order_search_title" style="margin-bottom: 20px;">
			<h1 style="font-weight:normal;">매출현황</h1>
		</div>
	
		<!-- 일별 그래프 -->
		<h2>일별 매출 현황</h2>
		<p>6월</p>
		<div id="day_sales"></div>
		
		<!-- 월별 그래프 -->
		<h2>월별 매출 현황</h2>
		<p>2019년</p>
		<div id="month_sales"></div>
		
		
	</div><!-- statistic_wrap -->
	
	
</div><!-- 메인컨텐츠 끝 -->

<script src="../js/Easygraphs.js"></script>
<script>

// 일별 매출현황

var eg1 = new Easygraphs({
  container: document.getElementById('day_sales'),
  width: 880,
  height: 200,
  padding: {
    top: 30,
    right: 30,
    left: 55
  },
  tooltip: {
    template: '판매 금액  : {{ value }} 원',
    widthAuto: true,
    color: '#222',
    background: '#FFF'
  },
  yAxis: {
    text: {
      toFixed: 0
    },
    title: {
      text: ''
    },
    grid: {
      dasharray: '1%'
    }
  },
  xAxis: {
    labels: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31'],
    grid: {
      dasharray: '1%'
    }
  },
  data: [{
    name: '판매금액',
    dots: {
      color: 'rgb(246, 75, 47)'
    },
    line: {
      width: 2,
      color: 'rgb(246, 75, 47)',
      fill: 'rgba(246, 75, 47, 0.5)'
    },
    values: [12, 22, 25, 23, 32, 34, 37, 30, 32, 40, 51, 56, 52, 70, 68, 72, 74, 78, 91, 92, 95, 96, 98, 121, 70, 78, 76, 68, 72, 71, 92]
  }]
});
eg1.render();


//월별 매출현황

var eg2 = new Easygraphs({
  container: document.getElementById('month_sales'),
  width: 880,
  height: 200,
  padding: {
    top: 30,
    right: 30,
    left: 55
  },
  tooltip: {
    template: '판매 금액  : {{ value }} 원',
    widthAuto: true,
    color: '#222',
    background: '#FFF'
  },
  yAxis: {
    text: {
      toFixed: 0
    },
    title: {
      text: ''
    },
    grid: {
      dasharray: '1%'
    }
  },
  xAxis: {
    labels: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'],
    grid: {
      dasharray: '1%'
    }
  },
  data: [{
    name: '판매금액',
    dots: {
      color: 'rgb(0, 183, 238)'
    },
    line: {
      width: 2,
      color: 'rgb(0, 183, 238)',
      fill: 'rgba(0, 183, 238, 0.5)'
    },
    values: [100000, 300000, 400000, 200000, 400000,600000,
    		800000, 200000, 400000, 400000, 600000, 700000]
  }]
});
eg2.render();
</script>
