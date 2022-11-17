<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<c:set var="contextRoot"  value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改商品</title>
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
<h1>修改商品</h1>

	<div class="card">
	
			    <div class="card-header">
	   			 商品編號:<span>${products.prodId}</span>
	   			<br>
	  			</div>

  	
	    <div class="card-body" style="background-image:url('${contextRoot}/image/management/newpoem.png'); ">
                <form action="${contextRoot}/product/postEditProduct" method="post" enctype="multipart/form-data">
                     <input type="hidden" value="${products.prodId}" name="prodId"> <br>
                     商品名稱：<input type="text" value="${products.prodName}" name="productName">
                     <br><br>
                     商品價格：<input type="text" value="${products.prodPrice}"name="productPrice">
                     <br><br>
                     商品庫存：<input type="text" value="${products.prodStock}" name="productStock">
                     <br><br>
                     商品原圖片 : <input type="image" src="${pageContext.request.contextPath }/downloadImg/${products.prodId}" height="100px" >
                     <br><br>
                     更新商品圖片：<input type="file" name="photo" >
                     <br><br>
                     <div style="text-align: center">
                     <a class="btn btn-secondary" href="http://localhost:8080/my-app/product/page">取消</a>
                     <input  style="margin-left: 10px"class="btn btn-primary" type="submit" name="submit" value="送出">
					</div>
					<br>
                 </form>    
		       </div>
		 
	  	
	  	</div>
   
</div>












</header>

</body>
</html>