<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath }" />
<c:set scope="session" var="memberId" value="${sessionScope.memberId}" />
<c:set scope="session" var="name" value="${sessionScope.name}" />
<!DOCTYPE html>
<html>

<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<meta charset="UTF-8">
<title>歸心寺</title>
 <style>
    .badge-notify {
      border: 1px solid red;
      border-radius:50%;

      background: red;
      position: relative;
      top: -20px;
      right: -50px;

    }

    .my-cart-icon-affix {
      z-index: 999;
    }
 </style>

<!-- Bootstrap Icons-->
<link href="${contextRoot }/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Google fonts-->
<link href="${contextRoot }/font/Merriweather+Sans.css" rel="stylesheet" />
<link href="${contextRoot }/font/Merriweather.css" rel="stylesheet"
	type="text/css" />
<!-- SimpleLightbox plugin CSS-->
<link href="${contextRoot }/css/index/plugin/simpleLightbox.min.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="${contextRoot}/css/index/styles.css" rel="stylesheet" />
<!-- Custom -->
<link href="${contextRoot}/css/index/customIndex.css" rel="stylesheet" />
<!-- Bootstrap Core Css-->
<link href="${contextRoot}/vender/bootstrap/4.6.2/bootstrap_Modal.css"
	rel="stylesheet" />
<link href="${contextRoot}/css/index/drawLots.css" rel="stylesheet" />

</head>

<body id="page-top">

	<nav class="navbar navbar-expand-lg navbar-light fixed-top py-0"
		id="mainNav">
		<div class="container px-4 px-lg-8">
			<!-- <div class="row row-cols-auto"> -->

			<div class="logoImage" style="margin-left: -35vh;">
				<a class="navbar-brand" href=" ${contextRoot}/" > <img
					class="barimg" src=" ${contextRoot}/image/index/logo.png" >
				</a>
			</div>
			<div class="logoImage">
				<a class="navbar-brand" style="weight:30px" >
				</a>
			</div>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ms-auto my-2 my-lg-0">
					<li class="nav-item" style="font-size:20px"><a class="nav-link"
						href="${contextRoot}/donation">香油錢</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${contextRoot}/drawlots">求籤</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${contextRoot}/marriage">求姻緣</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${contextRoot}/shop">線上商城</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${contextRoot}/about">關於月老</a></li>
					<!--      -------------------------------------------------------------------------- -->
					<li class="nav-item"><a class="nav-link"
						href="${contextRoot}/Order/page">訂單資訊</a></li>
					<!--       -------------------------------------------------------------------------- -->
					<li class="nav-item"><c:choose>
							<c:when test="${empty memberId}">
								<li class="nav-item"><a class="nav-link"
									href="${contextRoot}/login"> 訪客 </a></li>
							</c:when>
							<c:when test="${memberId.equals('A123123')}">
								<li class="nav-item"><a class="nav-link"
									href="${contextRoot}/management/allManagement">
										使用者：${name} </a></li>
								<li class="nav-item"><a class="nav-link" href="#"
									data-toggle="modal" data-target="#logoutModal">登 出<i
										></i>
<!-- 										class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400 -->
										
								</a></li>
							</c:when>
							<c:otherwise>
								<li class="nav-item" style="font-size: 13px"><a class="nav-link"
									href="${contextRoot}/user"> 使用者:${name}</a></li>
								<li class="nav-item"><a class="nav-link" href="#"
									data-toggle="modal" data-target="#logoutModal"> <i
										class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
										
								</a></li>
							</c:otherwise>
						</c:choose>
						
				
				</ul>

<!--------------------購物車 ------------>

<!-- <div style="float: right; cursor: pointer;"> -->
<!-- <span class="glyphicon glyphicon-shopping-cart my-cart-icon"> -->
<!-- 	<span class="badge badge-notify my-cart-badge"></span> -->
<!-- 		<i class="fa-sharp fa-solid fa-cart-shopping"style="font-size: 27px;"></i> -->
<!-- 	</span> -->
<!-- </div> -->


<!-------------------------- -->
			</div>
		</div>
	
</nav>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">確定要登出?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">如果確定請選擇"登出"</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">取消</button>
					<a class="btn btn-primary" href="logout">登出</a>
				</div>
			</div>
		</div>
	</div>
	<!-- Jquery Core -->
	<script src="${contextRoot}/vender/jquery/3.6.0/jquery.min.js"></script>
	<!-- Bootstrap Modal JS -->
	<script src="${contextRoot}/vender/bootstrap/4.6.2/bootstrap.min.js"></script>
	<!-- Bootstrap core JS -->
	<script src="${contextRoot}/vender/bootstrap/5.1.3/bootstrap.bundle.min.js"></script>
	<!-- SimpleLightbox plugin JS -->
	<script src="${contextRoot}/js/index/plugin/simpleLightbox.min.js"></script>
	<!-- Core theme JS -->
	<script src="${contextRoot}/js/index/scripts.js"></script>
	<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
 


</body>

</html>