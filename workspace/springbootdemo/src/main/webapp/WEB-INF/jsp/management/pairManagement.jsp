<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextRoot"  value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>配對管理</title>
</head>

<body>
<jsp:include page="../management/managerLayout/mnavbar.jsp"></jsp:include>


<!-- <div class="row gx-4 gx-lg-5 h-100 align-items-center justify-content-center text-center"> -->
<header class="masthead">

        <div id="wrap"> 
            <div class="box1">
                <select class="form-select"  aria-label="multiple select example" style="width:auto;">
                <option selected>配對日期</option>
                <option value="1">會員帳號</option>
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
                <th scope="col">配對編號</th>
                <th scope="col">配對日期</th>
                <th scope="col">配對名字（男）</th>
                <th scope="col">配對名字（女）</th>
                <th scope="col">領取優惠</th>
                <th scope="col">修改</th>
                <th scope="col">刪除</th>
              </tr>
            </thead>
            <tbody>
            <c:forEach var="pairDetail" items="${page.content}">
              <tr>
                <th scope="row">${pairDetail.pairId}</th>
                <td>${pairDetail.pairDate}</td>
                <td>${pairDetail.idBoy.name}</td>
                <td>${pairDetail.idGirl.name}</td>
                <td>${pairDetail.coupon==1?"已領取":"未領取"}</td>
                <td>
                    <a href="${contextRoot}/pair/editPair?id=${pairDetail.pairId}"><img src="${contextRoot}/image/management/edit.png"></a>
                </td>
                <td>
                    <a onclick="return confirm('確定刪除?')" href="${contextRoot}/pair/deletePair?id=${pairDetail.pairId}"><img src="${contextRoot}/image/management/delete.png"></a>
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
			      		<a class="page-link" href="${contextRoot}/pair/page?p=${page.number}">Previous</a>
			      		</c:when>
			      		<c:otherwise>
			      		<a class="page-link" href="">Previous</a>
			      		</c:otherwise>
			      		</c:choose> 
			    	</li>
			    	<c:forEach var="pageNumber" begin="1" end="${page.totalPages}">
						<c:choose>
			    			<c:when test="${page.number != pageNumber-1}">
			   					 <li class="page-item"><a class="page-link" href="${contextRoot}/pair/page?p=${pageNumber}">${pageNumber}</a></li>
			   				 </c:when>
				    		<c:otherwise>
				    			<li class="page-item"><a class="page-link" style="background-color: #F2F3F4">${pageNumber}</a></li>
				    		</c:otherwise>
			 			</c:choose>     
					</c:forEach>
					<li class="page-item">
						<c:choose>
			    		<c:when test="${page.number!=page.totalPages-1}">
			      		<a class="page-link" href="${contextRoot}/pair/page?p=${page.number+2}">Next</a>
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