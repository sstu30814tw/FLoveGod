<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:set var="contextRoot"  value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改訂單</title>

<style>
.card-body{
background-size:contain;
}
</style>

</head>
<body>

<jsp:include page="../management/managerLayout/mnavbar.jsp"></jsp:include>

<header class="masthead">


<div class="container"  style="width: 50%">
<h1>修改訂單</h1>

	<div class="card">

		    <div class="card-header">
	   			訂單時間:<span>${orders.orderDate}</span>
	   			<br>
	   			訂購人帳號：<span>${orders.userId}</span>
	   			<br>
	   			訂單總金額:<span>${orders.orderSum}</span>
	  		</div>
  		
  			<div class="card-body"  style="background-image:url('${contextRoot}/image/management/newpoem.png'); ">
	    	<form:form action="${contextRoot}/order/postEditOrder"  method="post" modelAttribute="orders">
	    	
				    <form:input type="hidden" path="orderId" />
				    <form:input type="hidden" path="userId" />
				    <form:input type="hidden" path="orderSum" /> 
	    			<form:input type="hidden" path="orderDate" /> 
	    			<form:input type="hidden" path="orderDetail" />
	    			<form:input type="hidden" path="paystatus" />
	    			<br>
	    			 收件人姓名：<form:input type="text" path="conName" /><br><br>
		             收件人電話：<form:input type="text" path="conPhone" /><br><br>
		             配送地址: <form:input type="text" path="address" /><br><br>
		             出貨狀態：
		             <form:radiobutton path="shipstatus" value="1"/>
		             <label for="ship1"> 已出貨</label>
		             <form:radiobutton path="shipstatus" value="0"/>
		             <label for="ship2"> 未出貨</label>
		             <br><br>
		             <div style="text-align: center">
		              <a class="btn btn-secondary" href="http://localhost:8080/my-app/order/page">取消</a>
					  <input type="submit" style="margin-left: 10px"class="btn btn-primary" name="submit" value="送出">
					  </div>
            	</form:form> 
         
		   </div>
  		
	  	</div>
</div>


</header>

</body>
</html>