<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:set var="contextRoot"  value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改配對</title>
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
<h1 >修改配對</h1>

<div class="card">

	    <div class="card-header">
   			配對日期:<span>${pairDetail.pairDate}</span>
   			<br>
   			配對名字(男)：<span>${pairDetail.idBoy.name}</span>
   			<br>
   			配對名字(女)：<span>${pairDetail.idGirl.name}</span>
  		</div>
  		
  		
  		<div class="card-body" style="background-image: url('${contextRoot}/image/management/newpoem.png');">
	    	<form:form action="${contextRoot}/pair/postEditPair"  method="post" modelAttribute="pairDetail">
	    	
				    <form:input type="hidden" path="pairDate" />
				    <form:input type="hidden" path="idBoy.name" />
				    <form:input type="hidden" path="idGirl.name" /> 
	    			<form:input type="hidden" path="pairId" /> <br>
	    			 優惠券修改：
	    			 <form:radiobutton path="coupon" value="1"/>
	    			 <label for="get1"> 已領取</label>
					 <form:radiobutton path="coupon" value="" />
					 <label for="get2"> 未領取</label>
	    			 
	    			 <br><br>
	    			 <div style="text-align: center">
	    		     <a class="btn btn-secondary" href="http://localhost:8080/my-app/pair/page">取消</a>
					  <input type="submit" style="margin-left: 10px" class="btn btn-primary" name="submit" value="送出">
					  </div>
            	</form:form> 
         
		   </div>
		 
	  	
	  	</div>
   
</div>


</header>

</body>
</html>