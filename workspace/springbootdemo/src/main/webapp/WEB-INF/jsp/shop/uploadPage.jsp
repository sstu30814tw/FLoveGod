<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<title>歸心寺</title>
<style type="text/css">
.fillIn {
	font-size: 20px;
	width: 40%;
	text-align: center;
	border-bottom: 2px solid #D0D0D0;
	
}

table thead th {
	color: #ffffff;
	background: #7B7B7B;
	height: 20 px
}

.tdbottom{
border-bottom: 2px solid #D0D0D0;
height: 70px;
}

.flex{
	display:flex;
	align-items:center;
	justify-content:center; 
}

</style>
</head>
<body>
	<jsp:include page="../layout/orderNavbar.jsp"></jsp:include>
	<header class="masthead">

		<div>
			<div class=" container flex" >
					<table class="fillIn ">
						<thead>
							<tr style="height: 50px;">
								<th>訂單編號</th>
								<th>訂購日期</th>
								<th>訂購總額</th>
							</tr>
						</thead>
						<tbody>
				<c:forEach items="${memberOrders}" var="oneOrder">
							<tr class="tdbottom">
								<td><a href="${contextRoot}/orderDetailList?orderId=${oneOrder.orderId}">${oneOrder.orderId}</a></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm EEEE" value="${oneOrder.orderDate}" /></td>
								<td>$<fmt:formatNumber value="${oneOrder.orderSum}" pattern="#,###,###"/></td>
							</tr>
				</c:forEach>
			</tbody>
		</table>
		
<%-- 		<a  href="${contextRoot}/orderPie">商品銷售數量統計圖</a> --%>
		
<!-- 		<nav aria-label="Page navigation example"> -->
<!-- 			 	<ul class="pagination justify-content-center fixed-bottom" > -->
<!-- 			    	<li class="page-item"> -->
<%-- 			    		<c:choose> --%>
<%-- 				    		<c:when test="${page.number!=0}"> --%>
<%-- 				      		<a class="page-link" href="${contextRoot}/Order/page?p=${page.number}">Previous</a> --%>
<%-- 				      		</c:when> --%>
<%-- 				      		<c:otherwise> --%>
<!-- 				      		<a class="page-link" href="">Previous</a> -->
<%-- 				      		</c:otherwise> --%>
<%-- 			      		</c:choose>  --%>
<!-- 			    	</li> -->
<%-- 			    	<c:forEach var="pageNumber" begin="1" end="${page.totalPages}"> --%>
<%-- 						<c:choose> --%>
<%-- 			    			<c:when test="${page.number != pageNumber-1}"> --%>
<%-- 			   					 <li class="page-item"><a class="page-link" href="${contextRoot}/Order/page?p=${pageNumber}">${pageNumber}</a></li> --%>
<%-- 			   				 </c:when> --%>
<%-- 				    		<c:otherwise> --%>
<%-- 				    			<li class="page-item"><a class="page-link" style="background-color: #F2F3F4">${pageNumber}</a></li> --%>
<%-- 				    		</c:otherwise> --%>
<%-- 			 			</c:choose>      --%>
<%-- 					</c:forEach> --%>
<!-- 					<li class="page-item"> -->
<%-- 						<c:choose> --%>
<%-- 				    		<c:when test="${page.number!=page.totalPages-1}"> --%>
<%-- 				      			<a class="page-link" href="${contextRoot}/Order/page?p=${page.number+2}">Next</a> --%>
<%-- 				      		</c:when> --%>
<%-- 				      		<c:otherwise> --%>
<!-- 				      			<a class="page-link" href="">Next</a> -->
<%-- 				      		</c:otherwise> --%>
<%-- 			      		</c:choose>  --%>
<!-- 			    	</li> -->
<!-- 			  	</ul> -->
<!-- 			</nav> -->
			
			</div>
		</div>
	</header>
</body>

</html>