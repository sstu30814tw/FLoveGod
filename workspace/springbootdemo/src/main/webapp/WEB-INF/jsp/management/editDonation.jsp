<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:set var="contextRoot"  value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>寄送收據</title>

<style>

</style>

</head>
<body>

<jsp:include page="../management/managerLayout/mnavbar.jsp"></jsp:include>

<header class="masthead">


<div class="container"  style="width: 50%">
<h1>寄送收據</h1>

	<div class="card">

		    <div >
	   			捐款人:<span>${donationModel.name}</span>
	   			<br>
	   			捐款金額：<span>${donationModel.money}</span>
	   			<br>
	   			時間:<span>${donationModel.time}</span>
	   			
	  		</div>
  		
  			<div>
	    	<form:form action="${contextRoot}/donation/postEditDonation"  method="post" modelAttribute="donationModel">
	    	
				    <form:input type="hidden" path="id" />
				    <form:input type="hidden" path="name" />
				    <form:input type="hidden" path="phone" /> 
	    			<form:input type="hidden" path="mail" /> 
	    			<form:input type="hidden" path="address" />
	    			<form:input type="hidden" path="money" />
	    			<form:input type="hidden" path="receipt" />
	    			<form:input type="hidden" path="captcha" />
	    			<form:input type="hidden" path="time" />
	    			<form:input type="hidden" path="donationStatus" />
<%-- 	    			<form:input type="hidden" path="sendReceipt" /> --%>
	    			
		             <form:radiobutton path="sendReceipt" value="1"/>
		             <label for="ship1"> 已出貨</label>
		             <form:radiobutton path="sendReceipt" value="0"/>
		             <label for="ship2"> 未出貨</label>
		             <br><br>
		             <div style="text-align: center">
		              <a class="btn btn-secondary" href="http://localhost:8080/my-app/donation/page">取消</a>
					  <input type="submit" style="margin-left: 10px"class="btn btn-primary" name="submit" value="送出">
					  </div>
            	</form:form> 
         
		   </div>
  		
	  	</div>
</div>


</header>

</body>
</html>