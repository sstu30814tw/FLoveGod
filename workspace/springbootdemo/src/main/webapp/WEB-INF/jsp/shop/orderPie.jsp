<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>歸心寺</title>

<style>
.pieM{
margin-top: 15vh;
display:flex;
align-items:center;
justify-content:center; 
}
.pieM2{
margin-top: 5vh;
display:flex;
align-items:center;
justify-content:center; 
}
.flex {
	display: flex;
	align-items: center;
	justify-content: center;
}

</style>

</head>
 <body>
<jsp:include page="../management/managerLayout/mnavbar.jsp"></jsp:include>
<!-- 柱狀圖 -->
<div class="pieM">
<canvas id="myChart" style="width:100%;max-width:800px"></canvas>
</div>

<!-- 圓餅圖 -->
<div class="pieM2">
<canvas id="myChartUser" style="width:100%;max-width:450px"></canvas>
</div>
<br>
<div  class="flex"><a class="btn btn-primary" href="${contextRoot}/product/page" style="text-decoration:none;color:#FFF;">回前頁</a></div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<script>
var line_orderUser = [];
var orderSum = [];

<c:forEach items="${order}" var="orderOne" >	
line_orderUser.push("${orderOne.userId}");
orderSum.push("${orderOne.orderSum}");
</c:forEach>


//-----userId
var orderUser_uniqulo2 = [];
var orderUser_uniqulo = [];
line_orderUser.reduce(function(res, value) {
  if (!res[value]) {
    res[value] = {value};
    orderUser_uniqulo2.push(res[value])
  }
  return res;
}, {});

for (i = 0 ; i < orderUser_uniqulo2.length ; i++){
	orderUser_uniqulo.push(orderUser_uniqulo2[i].value);
}
console.log(orderUser_uniqulo);
//------------------------------------
var line_orderSum = new Array(orderUser_uniqulo.length);
for (u = 0 ; u < orderUser_uniqulo.length ; u++){
	line_orderSum[u] = 0;
}

for ( i = 0 ; i < orderSum.length ; i++ ){
	for (u = 0 ; u < orderUser_uniqulo.length ; u++){
		if (orderUser_uniqulo[u] == line_orderUser[i]){
			line_orderSum[u] = line_orderSum[u] + parseInt(orderSum[i]);
		}
	}
} 
console.log(line_orderSum);

//------------product_quanity
var line_name = [];
var line_q = [];
<c:forEach items="${orderDetail}" var="oD" >	
	line_name.push("${oD.prod_name}");
	line_q.push("${oD.quanity}");
	</c:forEach>
	
//-----去除重複的商品名稱
var line_name_uniqulo2 = [];
var line_name_uniqulo = [];
line_name.reduce(function(res, value) {
  if (!res[value]) {
    res[value] = {value};
    line_name_uniqulo2.push(res[value])
  }
  return res;
}, {});
console.log(line_name_uniqulo2)

//-----將商品的名稱轉為字串
for (i = 0 ; i < line_name_uniqulo2.length ; i++){
	line_name_uniqulo.push(line_name_uniqulo2[i].value);
}

var line_q_sum = new Array(line_name_uniqulo.length);

for (u = 0 ; u < line_name_uniqulo.length ; u++){
	line_q_sum[u] = 0;
}

//--依照原本的商品名稱位置，累加商品的賣出數量
for ( i = 0 ; i < line_q.length ; i++ ){
	for (u = 0 ; u < line_name_uniqulo.length ; u++){
		if (line_name_uniqulo[u] == line_name[i]){
			line_q_sum[u] = line_q_sum[u] + parseInt(line_q[i]);
		}
	}
} 
console.log(line_q_sum)
//------------------------------//
var barColors = [
  "#b91d47",
  "#00aba9",
  "#2b5797",
  "#e8c3b9",
  "#1e7145",
  "#DCB5FF",
  "#79FF79",
  "#2894FF",
  "#FF9797",
  "#4F9D9D",
  "#FF9224",
  "#996633",
  "#999966",
  "#FFCC99"
	
];

new Chart("myChart", {
  type: 'bar',
  data: {
    labels: line_name_uniqulo,
    datasets: [{
    backgroundColor: barColors,
    data: line_q_sum
    }],
  },
  options: {
    legend: {display: false},

    title: {
      display: true,
      text: "2022/11月 商品銷售數量",
      fontSize: 16
    },
    scales: {
        yAxes: [{
        	scaleLabel:{
                display: true,
                labelString:"quantity",
                fontSize: 16
              },
            ticks: {
                beginAtZero: true,
                stepSize: 5 

            }
        }]
    }
  }
});
console.log(line_q_sum)

new Chart("myChartUser", {
	  type: 'pie',
	  data: {
	    labels: orderUser_uniqulo,
	    datasets: [{
	    backgroundColor: barColors,
	    data: line_orderSum
	    }],
	  },
	  options: {
	    
	    title: {
	      display: true,
	      text: "2022年-使用者消費總金額",
    	  fontSize: 16
	    }
	  }
	});

</script>
  
</body>
</html>