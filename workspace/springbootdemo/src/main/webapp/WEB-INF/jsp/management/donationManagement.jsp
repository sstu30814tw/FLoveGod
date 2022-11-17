<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextRoot"  value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>香油錢管理</title>
</head>

<body>
<jsp:include page="../management/managerLayout/mnavbar.jsp"></jsp:include>


<!-- <div class="row gx-4 gx-lg-5 h-100 align-items-center justify-content-center text-center"> -->
<header class="masthead">
<div id="wrap">
	<div class="box1">
		<select class="form-select" aria-label="multiple select example" style="width:auto;">
			<option selected>捐款編號</option>
			<option value="1">姓名</option>
			<option value="2">電話</option>
		</select>
     </div>
	 <div class="box2">
           <div class="input-group">
                <input type="text" class="form-control input-md"><span class="btn btn-primary">搜索</span>
            </div>
	 </div>
</div>

        <table class="table table-hover">
            <thead>
                <tr>
                    <th scope="col">編號</th>
                    <th scope="col">日期</th>
                    <th scope="col">姓名</th>
                    <th scope="col">手機</th>
                    <th scope="col">信箱</th>
                    <th scope="col">地址</th>
                    <th scope="col">金額</th>
                    <th scope="col">捐款狀態</th>
                    <th scope="col">收據</th>
<!--                     <th scope="col">寄送收據</th> -->
                    <th scope="col">刪除</th>

                </tr>
            </thead>
            <tbody>
                
                <c:forEach var="DonationModel" items="${page.content}">
              <tr>
                <th scope="row">${DonationModel.id}</th>
                <td>${DonationModel.time}</td>
                <td>${DonationModel.name}</td>
                <td>${DonationModel.phone}</td>
                <td>${DonationModel.mail}</td>
                <td>${DonationModel.address}</td>
                <td>${DonationModel.money}</td>
                <td>${DonationModel.donationStatus==1?"已完成":"未完成"}</td>
                <td>${DonationModel.receipt}</td>

<!--                 <td>   -->
<%--                     <a href="${contextRoot}/donation/editDonation?id=${DonationModel.id}">${DonationModel.sendReceipt==1?"已寄送":"未寄送"}</a> --%>
<!--                 </td>  -->
                <td>
                    <a onclick="return confirm('確定刪除捐款?')" href="${contextRoot}/donation/deleteDonation?id=${DonationModel.id}"><img src="${contextRoot}/image/management/delete.png"></a>
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
			      		<a class="page-link" href="${contextRoot}/donation/page?p=${page.number}">Previous</a>
			      		</c:when>
			      		<c:otherwise>
			      		<a class="page-link" href="">Previous</a>
			      		</c:otherwise>
			      		</c:choose> 
			    	</li>
			    	<c:forEach var="pageNumber" begin="1" end="${page.totalPages}">
						<c:choose>
			    			<c:when test="${page.number != pageNumber-1}">
			   					 <li class="page-item"><a class="page-link" href="${contextRoot}/donation/page?p=${pageNumber}">${pageNumber}</a></li>
			   				 </c:when>
				    		<c:otherwise>
				    			<li class="page-item"><a class="page-link" style="background-color: #F2F3F4">${pageNumber}</a></li>
				    		</c:otherwise>
			 			</c:choose>     
					</c:forEach>
					<li class="page-item">
						<c:choose>
			    		<c:when test="${page.number!=page.totalPages-1}">
			      		<a class="page-link" href="${contextRoot}/donation/page?p=${page.number+2}">Next</a>
			      		</c:when>
			      		<c:otherwise>
			      		<a class="page-link" href="">Next</a>
			      		</c:otherwise>
			      		</c:choose> 
			    	</li>
			  	</ul>
			</nav>
			
 </header>
        
<!--       </div> -->
<!--  </div> -->

        
</body>
</html>