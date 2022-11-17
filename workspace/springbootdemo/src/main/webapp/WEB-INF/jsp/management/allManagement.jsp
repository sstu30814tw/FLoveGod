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
        <!-- <div class="container px-4 px-lg-5 h-100">
             <div class="row gx-4 gx-lg-5 h-80 align-items-center justify-content-center text-center">  
                
                        <h1 font-size=300px id="navin" class="nav-item">管理員 你好</h1>

                

               <img src="${contextRoot}/image/management/rules.png" sizes="65%">


            </div>
        </div> -->
        <div class="justify-content-center align-items-center text-center">
            
                <h1 font-size=300px style="margin-top:-3rem ; margin-left:-3rem ;">管理員 你好</h1>
            
            <div>
            <img src="${contextRoot}/image/management/rules.png" width="80%" style="margin-top: -50px;">
            </div>
        </div>
</header>

</body>
</html>