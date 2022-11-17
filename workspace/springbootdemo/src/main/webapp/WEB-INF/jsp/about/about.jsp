<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<title>關於月老</title>
<!-- Favicon-->
<!-- <link rel="icon" type="image/x-icon" href="assets/favicon.ico" /> -->
<!-- Bootstrap Icons-->
<link href="${contextRoot}/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Google fonts-->
<link href="${contextRoot}/font/Merriweather+Sans.css" rel="stylesheet" />
<link href="${contextRoot}/font/Merriweather.css" rel="stylesheet"
	type="text/css" />
<!-- SimpleLightbox plugin CSS-->
<link href="${contextRoot}/css/index/plugin/simpleLightbox.min.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="${contextRoot}/css/index/styles.css" rel="stylesheet" />
<!-- Custom -->
<link href="${contextRoot}/css/index/customIndex.css" rel="stylesheet" />

</head>
<jsp:include page="../layout/navbar.jsp"></jsp:include>


<!-- ⣿⣿⢿⣿⢿⣿⢿⣿⢿⣿⢿⣿⢿⣿⢿⣿⢿⣿⢿⣿⢿⣿⢿⣿⢿⣿⢿⣿⢿⣿⢿⣿⢿⣿⡿⣿⣿⢿⡿⣿⡿⣿⡿⣿⡿⣿⡿⣿⡿⣿⡿⣿
⣿⣻⣿⣻⣿⣻⣿⣻⣿⣻⣿⣻⣿⣻⣿⣻⣿⣻⣿⣻⣿⣻⣿⣻⣿⣻⣿⣻⣿⡟⠉⠈⠛⠙⠉⠫⢻⢿⣿⣟⣿⣟⣿⣟⣿⣟⣿⣟⣿⣟⣿⣿
⣿⣿⣽⣿⣽⣿⣽⣿⣽⣿⣽⣿⣽⣿⣽⣿⣽⣿⣽⣿⣽⡿⣯⣏⣮⡧⣏⢿⡷⡇⠀⠄⠀⠂⠁⠀⢌⢿⣷⢿⣻⣽⣿⣻⣽⣿⣯⣿⣯⣿⢿⣾
⣿⣾⡿⣾⡿⣾⣿⢾⣿⡾⣿⣾⢿⣾⢿⣾⢿⣾⢿⣾⣟⣿⡿⡗⣽⡗⣽⢼⢟⣛⠄⢀⢀⢄⢐⡰⣸⣻⣾⡿⡿⡫⣛⠿⣻⢳⡿⣷⣿⣻⣿⣻
⣿⣷⣿⡿⣿⣻⣽⣿⣯⣿⣿⣽⣿⣟⣿⣿⣻⣿⣟⣯⣿⣯⣿⣿⡶⣞⢺⣱⣭⣮⣧⣦⣇⣏⠿⡽⣷⣢⡳⣿⡕⣿⡻⣾⡾⣱⣿⣿⣽⣿⣽⣿
⣿⣷⢿⣻⣿⣟⣿⣽⣾⣿⢾⣿⡾⣟⣿⣾⢿⣷⡿⣟⣯⣿⡷⡿⢑⢑⡉⡻⡱⣑⢕⡱⣉⠫⡻⣷⢕⢿⣟⣮⣕⣜⢽⢟⡽⣾⢷⡿⣷⡿⣷⣿
⣿⣾⣿⡿⠏⠃⡀⢁⠁⡉⠛⢯⣿⣿⣻⣾⣿⣯⣿⣿⢿⣻⣿⢑⢅⢇⢇⠥⡸⡸⡽⣺⡳⡕⡆⢝⢟⣧⢻⣯⣿⣾⢷⣟⣿⣟⣿⡿⣟⣿⣿⣽
⣿⣯⠟⠀⡐⠀⠠⠀⠄⠀⢁⢐⢠⡟⢹⣿⢾⣟⣷⣿⡿⣟⣷⡻⡛⠫⡓⡱⣘⢞⣿⢾⡮⣎⢎⠆⢿⢽⣇⣿⡿⣾⣿⢿⣯⣿⣯⣿⢿⣿⢾⣿
⣿⠇⠀⢂⠀⠐⣠⣶⣾⠶⠴⠰⡞⣻⣟⣿⢿⣻⣿⢷⣿⢯⡞⡰⡰⡢⢂⢜⢜⡆⣂⢅⠙⢽⢧⢑⠍⢇⢇⣿⣟⣿⣽⣿⣟⣷⣿⣻⣿⣻⣿⣻
⣿⡁⠐⠠⡈⠌⣿⢿⣾⢆⡀⣰⣻⣽⣿⣻⣿⣟⣿⣟⣿⣽⢑⢌⠌⢌⠢⡣⢇⢃⢇⢗⠕⠌⣻⢄⢅⢢⢣⣿⣽⣿⣽⣾⡿⣯⣿⣯⣿⣯⣿⢿
⣿⣆⠈⠠⠐⢀⠉⠻⠿⡛⠫⠙⠽⣯⣿⣯⣷⣿⢿⣽⣟⣾⡂⢇⣽⠓⠺⠲⠞⢾⣷⡢⡣⡣⢸⠂⠡⢮⣿⣽⣷⡿⣯⣷⣿⣿⣻⣾⡿⣾⡿⣿
⣿⣻⣄⠂⡁⠄⠈⠠⠀⡀⠄⣤⣿⣟⣷⣿⣯⣿⠻⠋⢋⠔⡀⢑⡽⡐⠢⠢⡊⣂⢳⢿⡸⡊⠂⢥⢁⠢⡉⡓⠟⣿⣟⣯⣿⣾⡿⣯⣿⣿⣻⣿
⣿⡿⣿⣷⣾⣾⢦⠀⠂⠀⠄⢿⣷⡿⣟⣷⣿⣻⣆⠨⡐⠔⡨⠠⠃⠬⣯⡷⠘⢈⠠⠙⢧⡰⡵⡃⡎⡊⠄⠄⠰⣿⣟⣿⣯⣷⣿⡿⣿⣾⢿⣻
⣿⣟⣿⡷⣿⣾⣿⣧⠈⠀⠄⢸⣷⣿⡿⣟⣿⣻⡽⡂⠅⠌⣎⣆⠱⡁⠟⢀⢌⠆⡡⣜⢔⢍⡇⡢⠃⡐⠀⠠⠐⠈⢻⣯⣿⣽⣯⣿⣿⣾⣿⣿
⣿⣻⣽⣿⢿⣽⣾⣿⡃⠀⠨⠀⠻⣾⣿⡿⠟⡋⠂⠀⠂⡸⣪⢾⠠⢃⢑⠜⡐⣜⣞⢎⢞⡵⡑⢌⠐⡀⠀⠠⠀⠠⠀⠙⣾⡿⣯⣿⣾⢿⣾⢿
⣿⣿⣻⣽⣿⣟⣿⣾⢿⣅⢠⡠⢔⢋⡑⠀⠁⠀⠀⠌⢀⠪⡺⠍⡁⡢⢊⢔⠝⢊⢎⡪⠘⠮⠪⠀⠂⠀⠀⠄⠀⠄⠠⠀⠘⢿⣟⣿⣾⣿⢿⣿
⣿⣽⣿⣻⣽⣿⣽⣾⣿⢊⢱⠌⡚⠌⠆⣱⡈⠀⠀⢈⠀⠢⢈⢐⢠⠠⡈⠨⠨⡂⢑⢯⠈⣎⠀⢀⠀⠄⠀⠀⡀⠀⠀⠀⠀⠘⣿⣯⣷⣿⣿⣻
⣿⢿⣾⣿⣻⣽⣯⣿⣾⡌⡔⠔⢊⢙⡀⡯⡂⠀⠈⠀⡑⠠⢀⠀⠨⠉⡊⡂⠡⠪⡀⠱⡁⢗⡅⠀⠀⠀⠀⠁⠀⠀⠀⠄⠀⠠⣿⣯⣿⢷⣿⢿
⣿⡿⣿⣾⢿⣻⣽⣯⣷⣿⣔⠑⠁⠁⠀⢯⠀⠀⠂⠠⠈⠄⠠⡈⠄⢃⠒⡐⠐⢁⠨⢀⠠⠹⣒⠀⠀⠁⠀⠀⠠⠐⠀⠀⠀⣴⡿⣾⡿⣟⣿⣿
⣿⢿⣿⣾⣿⡿⣟⣿⣽⣿⣾⡃⡀⠈⡀⢱⠅⠀⠄⠀⠅⡁⠢⡢⠁⡂⡐⢌⠑⢅⢆⢐⢀⠢⠠⡀⠈⠀⢀⠀⠀⠀⢀⣴⣻⣯⣿⣿⣻⣿⢿⣽
⣿⡿⣷⣿⣾⡿⣿⣟⣯⣷⣿⠅⡂⠀⡀⠸⢘⠀⠀⢌⡪⣌⢆⠄⢐⢄⠐⢀⢁⢌⢡⢡⢤⠀⢗⡆⠐⠈⠀⠀⠀⣨⣄⡑⠹⢟⣿⣾⢿⣻⣿⢿
⣿⣿⣻⣷⡿⣟⣿⣟⣿⣯⣿⠨⡂⡁⠀⠨⡼⡀⣌⠂⢻⡪⡂⡂⡸⡜⡠⠸⣼⢺⡜⡾⡕⠅⢌⠳⠀⠀⢀⠀⢘⣿⢾⡿⣷⡌⠻⣾⢿⢿⣻⣿
⣿⣾⡿⣷⣿⣿⣟⣿⣽⣾⣿⣎⡂⠢⠀⠁⢏⢦⡗⠁⠠⠈⢌⢰⢹⢳⡐⠅⢯⡳⣽⡹⡸⠠⠨⡱⡁⠀⠀⡀⠀⢹⣿⢿⣿⣽⣦⡉⠄⠙⣟⣿
⣿⣷⣿⡿⣷⡿⣯⣿⣯⣿⣷⡿⣿⣦⡔⠀⢱⡝⠠⠐⠀⠀⡊⡐⠄⠀⠀⡑⡨⡀⠄⠀⠄⠂⠈⠀⠀⢀⠀⠀⠀⠀⢿⡿⣷⣟⣿⣶⡼⣾⡾⣿
⣿⡷⣿⣻⣿⣻⣿⣻⣾⡿⣾⡿⣟⣷⣇⠐⠘⢨⠀⠀⠄⢀⢇⠸⠀⠀⠁⢐⢁⠣⠀⠀⢀⠀⠀⠂⠈⠀⠀⠀⠁⠀⠈⢿⣟⣿⣯⣷⣿⣿⣻⣿
⣿⢿⣟⣿⣯⣿⣟⣿⣽⡿⣟⣿⡿⣟⣿⡄⠁⡀⠂⠐⡀⠰⠀⠉⠄⠀⠁⠀⡃⠪⠂⠀⠄⠢⠀⠀⠄⠁⡂⠀⠂⠀⡀⠀⠻⢯⣷⣿⣷⢿⣻⣽
⣿⡿⣟⣯⣿⣾⢿⣯⣿⢿⣿⣻⣿⢿⣿⡅⢀⢘⢆⢞⠄⠅⠀⠀⠄⠀⡀⠁⠀⠀⡀⠄⠐⢀⡁⠈⡠⠀⠂⠀⠀⡀⢀⣠⣠⣤⡿⣷⡿⣿⡿⣿
⣿⡿⣿⢿⣯⣿⢿⣯⣿⢿⣯⣿⣟⣿⣟⣯⣄⣤⣷⣷⣴⣶⣴⣤⣤⣀⣀⣀⣠⣀⣠⣀⣄⠀⢇⠝⡜⠠⣥⣦⣷⣾⢿⣷⢿⣯⣿⣟⣿⣟⣿⣿
⣿⢿⡿⣿⣻⣽⣿⢿⣽⣿⣯⣷⣿⢿⣽⣿⣻⣿⣻⣾⣷⢿⣯⣿⣯⣿⢿⣻⣟⣿⣻⣿⣽⣿⣾⡷⣟⣿⣯⣿⡾⣿⣻⣿⣻⣯⣷⣿⢿⣽⣿⣾ -->

<body>
	<!-- <div class="backgroundImge"> -->



		<div
			class="gnn-container gnn-section" style="margin-top:100px;">
		</div>
			
<div class="container px-4 px-lg-5">
	<div class="row gx-4 gx-lg-5 justify-content-center">
		<div
			class="align-items-center justify-content-center text-center">
			<h1 style="font-size:50px;">關 於 月 老</h1>
<!-- 			<div class="container px-4 px-lg-5 h-100"></div> -->

<!-- 			<div class="row"> -->
<!-- 				<div class="col-lg-1"></div> -->
<!-- 				<div class="col-lg-10"> -->
					<h2 class="mb-5">相傳，人世間的姻緣由月老為每個人配就 無論大德前來本寺，是求好姻，結良緣
						抑或是處於感情裡的貪癡怨，欲求解疑答惑</h2>
					<h2>紅塵事，情人結， 月老助手幫你牽起手中線</h2>
					<h3>鸞鳳配，鴛鴦鳴 月老助手媒合你的好姻緣 化碟意，破鏡圓 你的悲歡離合，<br>月老助手在線解</h3>
					<h3 class="mt-5">終結單身? 求好姻緣? 你的感情苦惱，月老助手都知道
						月老online小助手在此為你指點迷津。 這裡有許多相信月老的善男信女們來祈求好姻緣
						，各位別再猶豫了，讓我們代替月老牽起屬於你的那條紅線!</h3>
					<h2 class="mt-2">本寺月老憐痴男怨女之苦 必將持姻緣簿一一指點迷津</h2>
					<h2>願善男信女，持本寺之紅線 經歷顛沛流離之後必然會再度與有緣之人相逢。</h2>
				</div>
				<div class="col-lg-1"></div>
			</div>
		</div>

<!-- 	</div> -->
<!-- </div> -->


	<!-- Bootstrap core JS-->
	<!-- <script src="${contextRoot}/vender/bootstrap/5.1.3/bootstrap.bundle.min.js"></script> -->
	<!-- SimpleLightbox plugin JS-->
	<script src="${contextRoot}/js/index/plugin/simpleLightbox.min.js"></script>
	<!-- Core theme JS-->
	<script src="${contextRoot}/js/index/scripts.js"></script>

</body>
</html>