<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>香油錢</title>

<link href="${contextRoot}/css/donation/donationCheck.css"
	rel="stylesheet" />
<%-- <link href="${contextRoot}/css/donation/donationCaptcha.css" rel="stylesheet" /> --%>

</head>

<body>
	<jsp:include page="../layout/navbar.jsp"></jsp:include>

	<header class="masthead2">
		<div class="container px-4 px-lg-5 h-100">
			<div
				class="gx-4 gx-lg-5 h-100 align-items-center justify-content-center text-center">

				<div class="all_border" id="all_border">
					<div class="TitleThank">
						<br> <br>
						<h2>請確認您的捐款訊息</h2>
					</div>
					<div class="Payment_border">

						<!-- 						輸入香油錢資訊 -->
						<form:form action="${contextRoot}/donationPayment" method="post"
							modelAttribute="Payment" class="donation_dataform_m1"
							onsubmit="return checkForm(false);">

							<%-- 								<form class="donation_dataform_m1 sign-up-container" --%>
							<%-- 									name="dataform" onsubmit="return checkForm(false);"> --%>
							<div class="form">
								姓名:
								<form:input readonly="true" path="name" />
							</div>

							<div class="form" style="caret-color: transparent;">
								手機:
								<form:input readonly="true" path="phone" />
							</div>
							<div class="form">
								電子郵件:
								<form:input readonly="true" path="mail" />
							</div>
							<div class="form">
								地址:
								<form:input readonly="true" path="address" />

							</div>
							<div class="form">
								捐款金額:
								<form:input readonly="true" path="money" />
							</div>

							<div class="form">
								是否寄送獎狀:
								<form:input type="hidden" path="receipt"/>
								<input value="${receipt==1?'否':'是'}">
								
								
							</div>

							<button class="button1" type="button"
								onclick="location.href='${contextRoot}/donation'">
								<img src="${contextRoot}/image/donation/turn-back2.png"
									width="20%" alt=""> 重新填寫
							</button>
							<div class="submit_mb1">
								<button class="button2" type="submit" name="submit" value="確認"
									id="validate">
									<img src="${contextRoot}/image/donation/check2.png" width="20%"
										alt=""> 確認
								</button>

							</div>
							<%-- 								</form> --%>
						</form:form>
					</div>
				</div>
				<!-- 邊框內容 -->

			</div>
		</div>

	</header>

	<%-- <jsp:include page="../layout/footer.jsp">
					</jsp:include> --%>
	<script src="${contextRoot}/js/index/donation/Choose_to_pay.js"></script>
	<script src="${contextRoot}/js/index/donation/verification_code.js"></script>
</body>

</html>