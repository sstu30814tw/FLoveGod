<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
			<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

				<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

				<!DOCTYPE html>
				<html>

				<head>
					<meta charset="UTF-8">
					<title>登入會員</title>
					<!-- Custom fonts for this template-->
					<link href="${contextRoot}/vender/fontawesome-free/css/v5.8_all.min.css" rel="stylesheet"
						type="text/css">
					<!-- Custom styles for this template-->
					<link href="${contextRoot}/css/login/fontsNunito.css" rel="stylesheet">
					<!-- 登入CSS -->
					<link href="${contextRoot}/css/login/login.css" rel="stylesheet">
					<!-- 首頁CSS -->
					<!--     <link href="../css/index/styles.css" rel="stylesheet"> -->
					<link href="${contextRoot}/css/index/styles.css" rel="stylesheet">
					<!-- 自訂修改CSS -->
					<link href="${contextRoot}/css/login/loginCustom.css" rel="stylesheet">
					<!-- 翻轉卡片效果 -->
					<link href="${contextRoot}/css/login/loginSwitch.css" rel="stylesheet">
					<!-- 點擊愛心效果 -->
					<link href="${contextRoot}/css/login/loveClick.css" rel="stylesheet">
					<!-- 點擊愛心 只能使用網址 -->
					<!--     <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" -->
					<!--         integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous"> -->
					<style>
						.noshow {
							display: none;
						}
					</style>
				</head>


				<body class="bg-gradient-primary">

					<div class="backgroundImge">
						<!-- 


⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠂⠀⠀⠀⢀⣀⡀⢿⣾⢇⠀⠀⠀⠀⠀⠀⠀⢈⠃⠀⠁⠀⢠⡀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣤⣤⣴⣿⣿⣿⣿⣆⠀⣶⣆⣀⣠⣤⠀⣄⢨⡄⢶⣶⢶⣾⡁⡀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡰⢠⢤⣶⣾⣿⣿⣿⣿⠏⣻⠆⣶⡽⣿⣿⣿⣿⣿⣇⡟⢰⡟⣣⣧⣽⣿⣷⡇⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠓⠛⣽⣿⣿⣿⣿⣿⣿⣿⣟⣥⣻⣶⣿⣿⣿⣿⣿⣿⣷⣾⣿⣿⣷⣻⣷⣿⣷⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣯⣿⣿⣿⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⠆⢰⠎⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡷⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠃⢚⣳⣿⣿⣿⣿⣿⣿⣿⣿⣿⣬⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⡷⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⡼⠀⠀⠀⠀⠀⠀⢨⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⣿⢹⣿⣿⣿⣿⣿⣷⣦⡀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠇⠀⠀⠀⠀⠀⠀⠄⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣯⡛⠸⣟⣿⣿⣿⡕⠄⠙⠁⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⢛⣓⣂⣉⣉⣉⣉⣉⡍⠻⢾⠆⣿⣟⣿⣿⣿⣿⣿⣿⣿⣿⣿⠜⢿⣍⣏⠀⠀⠁⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⣠⣴⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣶⣶⣭⣭⣛⡻⢿⣿⣟⡟⠀⠘⣿⣯⠲⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⣾⠏⠁⠀⠀⠀⠈⠉⠙⠻⣿⣿⣿⣿⣿⣿⠟⠋⠉⠉⢉⣉⣉⣉⡙⢿⣮⣿⠷⣠⢱⣿⣏⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢸⣿⠀⠴⠚⠉⡉⠀⠤⢄⠀⠙⣿⣿⣿⣿⣿⣿⡶⡚⠉⠙⠻⠿⡿⢿⣶⣿⣿⣷⣆⠪⢎⣻⠇⠃⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠸⣿⣇⡁⠀⠸⣿⣄⣡⣾⣕⡄⢸⣿⣿⣿⣿⣿⣮⣶⣿⣄⣁⣶⣌⣘⣿⣿⣿⣿⣿⣷⠈⠛⠃⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣧⣈⣻⣿⣿⣿⣿⡄⢸⣿⣿⣿⣿⣿⣿⣝⣛⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⣤⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⣿⣿⣆⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⢈⣿⣿⣿⣿⣿⣿⣿⣿⡿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢀⣿⣿⡿⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠈⠹⣿⣿⣿⣿⣿⣿⣿⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢸⡛⢛⠁⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⡙⠛⢿⣿⣿⣿⣿⣟⣙⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⢰⣿⣿⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡽⢿⣿⣿⣿⣿⣄⣀⣙⣛⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠁⢸⣿⡿⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⣛⣿⣿⣿⣿⣿⣿⣿⠃⠀⣸⣿⡇⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠛⠛⠛⠛⠛⠻⠛⠛⣛⣛⣫⣭⣶⣶⣿⣿⣿⣿⣿⣿⣿⡿⠃⠀⢀⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣔⠾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⣿⠏⠀⠀⣠⣾⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢷⣈⠉⠛⠛⠛⣛⣿⣿⣿⣿⣿⣿⣿⣿⠳⠊⠀⢠⣾⣿⣿⢣⣄⠀⠀⣠⣶⣷⣶⣦⣄
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⣷⣄⣀⣴⣿⣿⣿⣿⣿⣿⣿⠟⠋⠐⢀⣴⣿⣿⣿⣯⣾⣿⣦⣾⣿⣿⣿⣿⣿⣿
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠛⠛⠛⠻⣿⣿⣿⣿⣿⣿⣿⠛⠀⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⠿⠿⠟⠋⠀⠀⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⡗⣵⣿⣿⣿⣿⣿⣿⣿⠉⠈⣿⣿⣿⣿⣿⣿
⠀⠀香蕉君保佑  永無BUG⠀⠀⠀           ⢠⡾⠋⠹⢿⣿⣿⣿⣿⡟⠀⠀⠸⣿⣿⣿⣿⣿ 

by 清樺
以下開放評論
2022/9/22 
亮丞覺得不太ok==-->


						<div class="container">
							<!-- Outer Row -->
							<div class="row justify-content-center">

								<div class="col-md-6 mb-md-0 p-md-4">
									<a href="${contextRoot}/index">
										<img src="${contextRoot}/image/index/logo.png" class="w-100" alt="...">
									</a>
								</div>

								<div class="col-xl-10 col-lg-12 col-md-9">
									<!-- 切換部分的卡片 -->
									<div class="row" style="margin-bottom: -2.5rem; padding-top: -2rem">
										<div class="col-lg-3"></div>
										<div class="card o-hidden border-0 shadow-lg my-5 col-lg-6">
											<div class="card-body p-0">
												<!-- Nested Row within Card Body -->
												<div class="row">
													<div class="col-lg-12">
														<div class="pt-0 pb-0 pl-5 pr-5">
															<div class="h2 text-center font2">
																<span id="showFast">註冊 / 登入</span>
															</div>



														</div>
														<div class="pt-0 pb-0 pl-5 pr-5">
															<div class="text-center">
																<!-- <button class="shadow btn btn-switchColor btn-block btn-lg font2"
    onclick="switchCard()">
    切 換
</button> -->
																<a href="./register"
																	class="shadow btn btn-switchColor btn-block btn-lg font2"
																	target="_self">切 換</a>
																<div id="useFast" class="noshow">
																	<button
																		class="shadow btn btn-loginColor btn-block btn-lg font2"
																		id='useManager'>管理者帳號填寫</button>
																	<button
																		class="shadow btn btn-loginColor btn-block btn-lg font2"
																		id='useCustomer'>測試用戶填寫</button>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="col-lg-3"></div>
									</div>


									<!-- 顯示部分的卡片 -->
									<div class="flip-card">
										<div class="flip-card-inner">
											<div class="flip-card-front">
												<div class="row">
													<div class="col-lg-3"></div>
													<!-- <div class="card o-hidden border-0 shadow-lg my-5 col-lg-6"> -->
													<!-- <div class="card-body p-0"> -->
													<div class="card o-hidden border-0 shadow-lg my-5 col-lg-6">
														<div class="card-body p-0">
															<!-- Nested Row within Card Body -->
															<div class="row">
																<div class="col-lg-12">
																	<div class="p-5">
																		<div class="text-center">
																			<h1 class="h2 text-gray-900 mb-4 font">
																				您好，歡迎訪問歸心寺</h1>
																		</div>


																		<form:form class="user" action="loginsubmit"
																			method="post" modelAttribute="loginsubmit">


																			<div class="form-group">
																				<input id="ct" type="text"
																					class="form-control form-control-lg"
																					placeholder="請輸入帳號..."
																					pattern=".{6,12}" name="memberId"
																					pattern="[a-zA-Z0-9]{6,12}"
																					title="（請最少輸入 6 - 12 位英文與數字）"
																					required id="memberId">
																			</div>

																			<div id='result0c' style="height: 10px;">
																			</div>
																			<div class="form-group">
																				<input id="pw" type="password"
																					class="form-control form-control-lg"
																					id="password" placeholder="請輸入密碼..."
																					pattern=".{6,12}" name="password"
																					pattern="[a-zA-Z0-9]{6,12}"
																					title="（請最少輸入 6 - 12 位英文與數字）"
																					required>
																			</div>
																			<div class="text-center col-lg-12">
																				<h5 class="text-danger">${Msg}</h5>
																			</div>

																			<br>

																			<button
																				class="shadow btn btn-loginColor btn-block btn-lg font2"
																				name="submit" value="submit"
																				id='sendData'>登 入
																			</button>

																		</form:form>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<div class="col-lg-3"></div>
												</div>
											</div>
										</div>
									</div>

								</div>
							</div>
						</div>




						<!-- LIKE 愛心特效 -->
						<div class="middle" style="display: none;">
							<div class="content-wrap middle">
								<div class="like-wrap middle">
									<i class="fas fa-heart"></i><span>Like</span>
								</div>
							</div>
						</div>
						<script>

							var classVal = document.getElementById("useFast").getAttribute("class");
							let autoregbtn3 = document.getElementById("showFast");
							autoregbtn3.addEventListener("click", autoreg3)
							function autoreg3() {

								classVal = classVal.replace("noshow", "");
								document.getElementById("useFast").setAttribute("class", classVal);
							}
							let autoregbtn2 = document.getElementById("useCustomer");
							autoregbtn2.addEventListener("click", autoreg2)
							function autoreg2() {
								document.getElementById("ct").value = "test123"
								document.getElementById("pw").value = "test123"
							}
						</script>
						<script>
							let autoregbtn = document.getElementById("useManager");
							autoregbtn.addEventListener("click", autoreg)
							function autoreg() {
								document.getElementById("ct").value = "A123123"
								document.getElementById("pw").value = "A123123"

							}

						</script>


						<script type="text/javascript" src="json.js">


						</script>


						<!-- 姻緣開啟 -->
						<script src="${contextRoot}/js/login/marriage.js"></script>
						<!-- 翻轉、愛心 -->
						<script src="${contextRoot}/js/login/login.js"></script>
						<!-- Bootstrap core JavaScript-->
						<script src="${contextRoot}/vender/jquery/jquery.min.js"></script>
						<script src="${contextRoot}/vender/bootstrap/4.6.0/bootstrap.bundle.min.js"></script>
						<!-- Core plugin JavaScript-->
						<script src="${contextRoot}/vender/jquery-easing/jquery.easing.min.js"></script>
						<!-- JavaScript-->
						<!-- <script src="js/login/loveClick.js"></script> -->

						<!-- Custom scripts for all pages-->
						<!-- <script src="js/login.js"></script> -->

					</div>


				</body>

				</html>