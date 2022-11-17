<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<c:set var="contextRoot"  value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改詩籤</title>
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
<h1>修改詩籤</h1>

	<div class="card">
			<div class="card-header">
	   			詩籤編號:<span>${drawlots.drawId}</span>
	   			<br>
	   			
	  		</div>
  	
	    <div class="card-body"  style="background-image:url('${contextRoot}/image/management/newpoem.png'); ">
	    
		     <form:form action="${contextRoot}/poem/editPoem" method="post" modelAttribute="drawlots" enctype="multipart/form-data">
		       
		       <form:input type="hidden" path="drawId"/>
		       
		       詩籤：<form:input type="text" path="drawName"/>
		       <br/><br/>
		       內文：<form:input type="text" path="drawMean"/>
		       <br/><br/>
		       
		       
		       <div style="text-align: center">
		        <a class="btn btn-secondary" href="http://localhost:8080/my-app/poem/page">取消</a>
		       <input type="submit" style="margin-left: 10px"class="btn btn-primary" name="submit" value="送出">
		       </div>
		      </form:form>     
		       </div>
		 
	  	
	  	</div>
   
</div>












</header>

</body>
</html>