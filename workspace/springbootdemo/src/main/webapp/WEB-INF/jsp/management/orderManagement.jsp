<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextRoot"  value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>訂單管理</title>
</head>
<body>
<jsp:include page="../management/managerLayout/mnavbar.jsp"></jsp:include>

 <header class="masthead">
        <!--查詢元件-->
        <div id="wrap"> 
            <div class="box1">
                <select class="form-select"  aria-label="multiple select example" style="width:auto;">
                <option selected>訂購人帳號</option>
                <option value="1">訂單編號</option>
                <option value="1">訂購人姓名</option>
                <option value="2">訂購人電話</option>
                </select>              
            </div>      
            <div class="box2" >
                <div class="input-group">
                <input type="text"  class="form-control input-md"><span class="btn btn-primary">搜索</span>
                </div>
            </div>
        </div> 

        <table class="table table-hover">
            <thead>
              <tr>
                <th scope="col">訂單編號</th>
                <th scope="col">訂購人帳號</th>
                <th scope="col">收件人姓名</th>
                <th scope="col">收件人電話</th>
                <th scope="col">配送地址</th>
                <th scope="col">訂單時間</th>
                <th scope="col">訂單總金額</th>
                 <th scope="col">付款狀態</th>
                <th scope="col">出貨狀態</th>
                <th scope="col">修改</th>
                <th scope="col">刪除</th>
               
              </tr>
            </thead>
            <tbody>
            <c:forEach var="orders" items="${page.content}">
              <tr>
                <th scope="row">${orders.orderId}</th>
                <td>${orders.userId}</td>
                <td>${orders.conName}</td>
                <td>${orders.conPhone}</td>
                <td>${orders.address}</td>
                <td>${orders.orderDate}</td>
                <td>${orders.orderSum}</td>
                <td>${orders.paystatus==1?"已付款":"未付款"}</td>
                <td>${orders.shipstatus==1?"已出貨":"未出貨"}</td>
                <td>
                    <a href="${contextRoot}/order/editOrder?id=${orders.orderId}"><img src="${contextRoot}/image/management/edit.png"></a>
                </td>
                <td>
                    <a onclick="return confirm('確定刪除訂單?')" href="${contextRoot}/order/deleteOrder?id=${orders.orderId}"><img src="${contextRoot}/image/management/delete.png"></a>
                </td>
                
              </tr>
             </c:forEach>
            </tbody>
          </table>

		<nav aria-label="Page navigation example">
			 	<ul class="pagination justify-content-center fixed-bottom" >
			    	<li class="page-item">
			    		<c:choose>
				    		<c:when test="${page.number!=0}">
				      		<a class="page-link" href="${contextRoot}/order/page?p=${page.number}">Previous</a>
				      		</c:when>
				      		<c:otherwise>
				      		<a class="page-link" href="">Previous</a>
				      		</c:otherwise>
			      		</c:choose> 
			    	</li>
			    	<c:forEach var="pageNumber" begin="1" end="${page.totalPages}">
						<c:choose>
			    			<c:when test="${page.number != pageNumber-1}">
			   					 <li class="page-item"><a class="page-link" href="${contextRoot}/order/page?p=${pageNumber}">${pageNumber}</a></li>
			   				 </c:when>
				    		<c:otherwise>
				    			<li class="page-item"><a class="page-link" style="background-color: #F2F3F4">${pageNumber}</a></li>
				    		</c:otherwise>
			 			</c:choose>     
					</c:forEach>
					<li class="page-item">
						<c:choose>
				    		<c:when test="${page.number!=page.totalPages-1}">
				      			<a class="page-link" href="${contextRoot}/order/page?p=${page.number+2}">Next</a>
				      		</c:when>
				      		<c:otherwise>
				      			<a class="page-link" href="">Next</a>
				      		</c:otherwise>
			      		</c:choose> 
			    	</li>
			  	</ul>
			</nav>

    </header>



</body>
</html>