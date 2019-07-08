<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>

<style type="text/css">
#statistic_wrap h2{font-weight:normal; margin-top:40px;}
#statistic_wrap p{color:gray; margin-top:10px;}

#salesSearchFormBtn{
	text-align: center;
	width: 100px;
	height: 35px;
    padding: 0 20px;
    font-size: 14px;
	font-weight: normal;
    cursor: pointer;
	color: #1b87d4;
    border: 1px solid #1b87d4;
    background-color: #fff;
   	float: right;
}
#salesSearchFormBtn:hover{
   background-color:#1b87d4;
   color:#ffffff;
}
</style>
</head>

<!-- 메인컨텐츠 시작 -->
<div id="mainContent_wrap">
	<div id="statistic_wrap" style="width: 1000px; margin: 0 auto;">
		<div id="order_search_title" style="margin-bottom: 20px;">
			<h1 style="font-weight:normal;">매출현황</h1>
		</div>
	
		<!-- 일별 그래프 -->
		<h2 style="display: inline;">일별 매출 현황</h2>
		<div style="float: right; padding-right: 63px;">
			<input type="button" id="salesSearchFormBtn" value="상세 매출">
		</div>
		<p id="monthText"></p>
		<div id="day_sales"></div>
		
		<!-- 월별 그래프 -->
		<h2>월별 매출 현황</h2>
		<p id="yearText"></p>
		<div id="month_sales"></div>
		
		
	</div><!-- statistic_wrap -->
	
	
</div><!-- 메인컨텐츠 끝 -->

<script src="../js/Easygraphs.js"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(document).ready(function(){
	/* 통계그래프에 들어갈 array */
	$.ajax({
		type : 'POST',
		url : '/kokonutStationery/admin/dayStatisticsArray.do',
		dataType : 'json',
		success : function(data){
			var split = data.sysDate.split('/');
			$('#monthText').text(split[1]+"월");
			$('#yearText').text("20"+split[0]+"년");
			
			/* 일별 매출 배열 가져오기 */
			var count=0;
			var dayArr = new Array();
			if(data.dayList.length!=0){//dayList 값이 있을때만
				for(var i=0; i<data.dayList.length; i++){
					count++;
					if(data.dayList[i].orderDate<10){
						if(data.dayList[i].orderDate!="0"+count){
							dayArr.push(0);
							i--;
						}else{
							dayArr.push(data.dayList[i].discountPrice);
						}
					}else{
						if(data.dayList[i].orderDate!=count){
							dayArr.push(0);
							i--;
						}else{
							dayArr.push(data.dayList[i].discountPrice);
						}
					}//else
				}//for
			}//if
			
			for(var i=count; i<31; i++){//데이터가 없으면 배열에 0을 추가해줌
				dayArr.push(0);
			}
			
			/* 월별 매출 배열 가져오기 */
			var count2=0;
			var monthArr = new Array();
			if(data.monthList.length!=0){//monthList 값이 있을때만
				for(var i=0; i<data.monthList.length; i++){
					count2++;
					if(data.monthList[i].orderDate<10){
						if(data.monthList[i].orderDate!="0"+count2){
							monthArr.push(0);
							i--;
						}else{
							monthArr.push(data.monthList[i].discountPrice);
						}
					}else{
						if(data.monthList[i].orderDate!=count2){
							monthArr.push(0);
							i--;
						}else{
							monthArr.push(data.monthList[i].discountPrice);
						}
					}//else
				}//for
			}//if
			
			for(var i=count2; i<12; i++){//데이터가 없으면 배열에 0을 추가해줌
				monthArr.push(0);
			}
			
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
			    values: dayArr
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
			    values: monthArr
			  }]
			});
			eg2.render();
			
			
		}//success
	});//ajax
});





//상세 매출 클릭 시 검색 폼 띄우기
$('#salesSearchFormBtn').click(function(){
  	window.open('/kokonutStationery/admin/salesSearchForm.do','','width=1100, height=750, left=200, resizable=no, toolbar=no','true');
});
</script>
