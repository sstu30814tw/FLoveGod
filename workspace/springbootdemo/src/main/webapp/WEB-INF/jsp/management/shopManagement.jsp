<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextRoot"  value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理員首頁</title>
</head>
<body>
<jsp:include page="../management/managerLayout/mnavbar.jsp"></jsp:include>

<header class="masthead">
        <!--查詢元件-->
        <div id="wrap"> 
            <div class="box1">
                <select class="form-select"  aria-label="multiple select example" style="width:auto;">
                <option selected>商品編號</option>
                <option value="1">商品名稱</option>
                </select>              
            </div>      
            <div class="box2" >
                <div class="input-group">
                <input type="text"  class="form-control input-md"><span class="btn btn-primary">搜索</span>
                </div>
            </div>
            <div class="box3">
            	<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo"> + 新增商品</button>
            </div>
            <div  class="box4">
            <a class="btn btn-primary" href="${contextRoot}/orderPie" style="text-decoration:none;color:#FFF;">商品銷售數量統計圖</a>
            </div>   
        </div> 
	


<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content" style="background-color: #F8F9F9">
      <div class="modal-header" >
        <h2 class="modal-title" id="exampleModalLabel">商品上架</h2>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
       <form class="form-inline" action="fileUpload" method="post" enctype="multipart/form-data">
		  <div class="form-group">
		    <label for="">商品名稱:</label>
		    <input type="text" name="pName" class="form-control mx-sm-1">
		  </div>
		  <div class="form-group">
		    <label for="">商品照片:</label>
		    <input type="file" name="file" class="form-control mx-sm-1">
		  </div>
		  <div class="form-group">
		    <label for="">商品價格:</label>
		    <input type="text" name="pPrice" class="form-control mx-sm-1">
		  </div>
		  <div class="form-group">
		    <label for="">商品庫存:</label>
		    <input type="text" name="pStock" class="form-control mx-sm-1">
		  </div>
		<div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">取消</button>
	        <input type="submit" class="btn btn-primary" value="送出">
      	</div>
		</form>
      </div>
    </div>
  </div>
</div>
     

        <table class="table table-hover">
            <thead>
              <tr>
                <th scope="col">商品編號</th>
                <th scope="col">商品名稱</th>
                <th scope="col">商品照片</th>
                <th scope="col">商品價格</th>
                <th scope="col">商品庫存</th>
                <th scope="col">編輯</th>
                <th scope="col">刪除</th>
              </tr>
            </thead>
            <tbody>
            <c:forEach var="Products" items="${page.content}">
              <tr>
                <td scope="row">${Products.prodId}</td>
         		<td >${Products.prodName}</td>
         		<td><img src="${pageContext.request.contextPath }/downloadImg/${Products.prodId}" height="50px"></td>
         		<td >${Products.prodPrice}</td>
         		<td >${Products.prodStock}</td>
           		<td >
                    <a href="${contextRoot}/product/editProduct?id=${Products.prodId}"><img src="${contextRoot}/image/management/edit.png"></a>
                </td>
                 <td>
                    <a onclick="return confirm('確定刪除商品?')" href="${contextRoot}/product/deleteProduct?id=${Products.prodId}"><img src="${contextRoot}/image/management/delete.png"></a>
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
				      		<a class="page-link" href="${contextRoot}/product/page?p=${page.number}">Previous</a>
				      		</c:when>
				      		<c:otherwise>
				      		<a class="page-link" href="">Previous</a>
				      		</c:otherwise>
			      		</c:choose> 
			    	</li>
			    	<c:forEach var="pageNumber" begin="1" end="${page.totalPages}">
						<c:choose>
			    			<c:when test="${page.number != pageNumber-1}">
			   					 <li class="page-item"><a class="page-link" href="${contextRoot}/product/page?p=${pageNumber}">${pageNumber}</a></li>
			   				 </c:when>
				    		<c:otherwise>
				    			<li class="page-item"><a class="page-link" style="background-color: #F2F3F4">${pageNumber}</a></li>
				    		</c:otherwise>
			 			</c:choose>     
					</c:forEach>
					<li class="page-item">
						<c:choose>
				    		<c:when test="${page.number!=page.totalPages-1}">
				      			<a class="page-link" href="${contextRoot}/product/page?p=${page.number+2}">Next</a>
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