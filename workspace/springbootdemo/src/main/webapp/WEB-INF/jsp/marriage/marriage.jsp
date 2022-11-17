<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<c:set var="contextRoot" value="${pageContext.request.contextPath }" />
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>姻緣配對</title>
			<link href="${contextRoot}/css/marriage/marriage.css" rel="stylesheet" />
		</head>
		<style>
			.body {}

			.backgroundImge {
				background: url("${contextRoot}/image/marriage/story/1.gif");
				background-position: center;
				background-repeat: no-repeat;
				background-size: cover;
				border-radius: 20px;
				box-shadow: 5px 5px 2px 1px rgba(0, 0, 0, 0.2);
				height: 100vh;
				max-width: 100vw;
				margin: 0px auto;
				position: relative
			}

			.backgroundImge1 {
				background: url("${contextRoot}/image/marriage/story/2.gif");
				background-position: center;
				background-repeat: no-repeat;
				background-size: cover;
				border-radius: 20px;
				box-shadow: 5px 5px 2px 1px rgba(0, 0, 0, 0.2);
				height: 100vh;
				max-width: 100vw;
				margin: 0px auto;
				position: relative
			}

			.backgroundImge2 {
				background: url("${contextRoot}/image/marriage/story/2.gif");
				background-position: center;
				background-repeat: no-repeat;
				background-size: cover;
				border-radius: 20px;
				box-shadow: 5px 5px 2px 1px rgba(0, 0, 0, 0.2);
				height: 100vh;
				max-width: 100vw;
				margin: 0px auto;
				position: relative
			}

			.backgroundImge7 {
				background: url("${contextRoot}/image/marriage/story/test.gif");
				background-position: center;
				background-repeat: no-repeat;
				background-size: cover;
				border-radius: 20px;
				box-shadow: 5px 5px 2px 1px rgba(0, 0, 0, 0.2);
				height: 100vh;
				max-width: 100vw;
				position: relative;
				animation: fadein 15s ease;
				margin: 0%;
				padding: 0%;
			}

			.marriage {
				background: url("${contextRoot}/image/marriage/story/white.png");
			}

			#centerP {
				margin-top: 15%;
				padding: 2%;
			}

			.card-profile {
				margin-top: 30%;
			}
		</style>

		<body class="marriage">

			<jsp:include page="../layout/navbar.jsp"></jsp:include>
			<div id="story" class="backgroundImge">
				<div id="change" class="container px-4 px-lg-5 h-100 ">
					<div class="row gx-4 gx-lg-5 h-100 align-items-center justify-content-center text-center ">
						<div class="col-lg-8 align-self-baseline centertext">

							<!-- 中央圖 -->
							<div id="centerimg" class="noCenterImg"><img class="incenterimg" id="idimg" src="" alt="">
							</div>
							<h1 id="centerP" class="text-black-75 mb-5 out inZoom">郎才佳人聚於此，情云初話結親誼，
								月老有意線相牽，更在相情把機會。</h1>




							<!-- 卡片照片及文字 -->
							<div id="controlBigCard" class="nobigCard inZoom">
								<div class="card-profile">

									<c:choose>
										<c:when test="${Marriage.idGirl.memberId == MemberId}">
											<c:choose>
												<c:when test="${Marriage.idBoy == null}">
													<div class="card-profile_visual">
														<img class="cardImg"
															src="${contextRoot}/image/marriage/null.png" alt="">
													</div>
													<div class="card-profile_user-infos">
														<span class="infos_name">未配對到有緣人，請明日再來</span>
												</c:when>
												<c:otherwise>
													<div class="card-profile_visual">
														<img class="cardImg"
															src="${contextRoot}/image/marriage/icon_boy.png" alt="">
													</div>
													<div class="card-profile_user-infos">
														<span class="infos_name">${Marriage.idBoy.name}</span>
												</c:otherwise>
											</c:choose>
										</c:when>
										<c:otherwise>
											<c:choose>
												<c:when test="${Marriage.idGirl == null}">
													<div class="card-profile_visual">
														<img class="cardImg"
															src="${contextRoot}/image/marriage/null.png" alt="">
													</div>
													<div class="card-profile_user-infos">
														<span class="infos_name">未配對到有緣人，請明日再來</span>
												</c:when>
												<c:otherwise>
													<div class="card-profile_visual">
														<img class="cardImg"
															src="${contextRoot}/image/marriage/icon_girl.png" alt="">
													</div>
													<div class="card-profile_user-infos">
														<span class="infos_name">${Marriage.idGirl.name}</span>
												</c:otherwise>
											</c:choose>
										</c:otherwise>
									</c:choose>
								</div>
								<!-- 卡片下方icon -->
								<div class="card-profile_user-stats">
									<div class="stats-holder">
										<c:choose>
											<c:when test="${Marriage.idGirl.memberId == MemberId}">
												<c:choose>
													<c:when test="${Marriage.idBoy == null}">
														<div class="user-stats">
															<span></span>
															<span class="infos_name"></span>
														</div>
														<div class="user-stats">
															<span></span>
															<span class="infos_name"></span>
														</div>
													</c:when>
													<c:otherwise>
														<div class="user-stats">
															<span><a href="https://line.me/ti/p/${Marriage.idBoy.line}"><img class="cardicon"
																	src="${contextRoot}/image/marriage/icon/line.png"
																	alt=""></a></span>
															<span class="infos_name"><a href="https://line.me/ti/p/${Marriage.idBoy.line}">${Marriage.idBoy.line}</a></span>
														</div>
														<div class="user-stats">
															<span><a href="https://www.instagram.com/${Marriage.idBoy.ig}"><img class="cardicon"
																	src="${contextRoot}/image/marriage/icon/ig.png"
																	alt=""></a></span>
															<span class="infos_name"><a href="https://www.instagram.com/${Marriage.idBoy.ig}">${Marriage.idBoy.ig}</a></span>
														</div>
													</c:otherwise>
												</c:choose>
											</c:when>
											<c:otherwise>
												<c:choose>
													<c:when test="${Marriage.idGirl == null}">
														<div class="user-stats">
															<span></span>
															<span class="infos_name"></span>
														</div>
														<div class="user-stats">
															<span></span>
															<span class="infos_name"></span>
														</div>
													</c:when>
													<c:otherwise>
														<div class="user-stats">
															<span><a href="https://line.me/ti/p/${Marriage.idGirl.line}"><img class="cardicon"
																	src="${contextRoot}/image/marriage/icon/line.png"
																	alt=""></a></span>
															<span class="infos_name"><a href="https://line.me/ti/p/${Marriage.idGirl.line}">${Marriage.idGirl.line}</a></span>
														</div>
														<div class="user-stats">
															<span><a href="https://www.instagram.com/${Marriage.idGirl.ig}"><img class="cardicon"
																	src="${contextRoot}/image/marriage/icon/ig.png"
																	alt=""></a></span>
															<span class="infos_name"><a href="https://www.instagram.com/${Marriage.idGirl.ig}">${Marriage.idGirl.ig}</a></span>
														</div>
													</c:otherwise>
												</c:choose>
											</c:otherwise>
										</c:choose>



									</div>
								</div>

							</div>

						</div>
					</div>
				</div>
			</div>
			</div>
			<%-- <jsp:include page="../layout/footer.jsp">
				</jsp:include> --%>
				<script src="${contextRoot}/js/marriage/marriage.js"></script>
		</body>

		</html>