<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>香油錢</title>

<link href="${contextRoot}/css/donation/donation.css" rel="stylesheet" />
</head>
<body>
	<jsp:include page="../layout/navbar.jsp"></jsp:include>

	<header class="masthead">
		<div class="container px-4 px-lg-5 h-100">
			<div
				class="gx-4 gx-lg-5 h-100 align-items-center justify-content-center text-center">

				<div class="all_border" id="all_border">
					<div class="choose_border sign-in-container">
						<form action="#">
							<!-- 選擇付款方法 -->
							<span class="title">歸心寺為信眾設置線上付款添油香，讓您不管在哪裡都可以表達對神明的感謝</span> <span
								class="title">請選擇付款方式:</span>
							<button type="button" id="Payment1" name="check">
								<img src="${contextRoot}/image/donation/debit-card.png" width="10%" alt="">線上信用卡
							</button>
							<button type="button" id="Payment2" data-bs-toggle="modal"
								data-bs-target="#lodinModal" name="check">
								<img src="${contextRoot}/image/donation/atm2.png" width="10%" alt="">
								ATM匯款
							</button>
						</form>
					</div>

					<div class="Payment_border">
<!-- 						輸入香油錢資訊 -->
						<form:form action="${contextRoot}/donationForm" method="post" modelAttribute="donationForm"
						class="donation_dataform_m1 sign-up-container"  onsubmit="return checkForm(false);">
						<form
						class="donation_dataform_m1 sign-up-container" name="dataform"  onsubmit="return checkForm(false);">
							<!-- <span class="title">請填寫以下資訊，以利寄發感謝狀!</span> -->
							<div class="form-floating ">
								<input  type="text" class="form-control" name="name" id="name"
									maxlength="100" style="height: 50px" placeholder="請輸入捐款人姓名" required>
									<label for="name">請輸入捐款人姓名</label>
							</div>
							<div class="form-floating ">
								<input  type="text" class="form-control" name="phone" id="phone"
									maxlength="100" style="height: 50px" placeholder="連絡電話" 
									pattern="09\d{2}(\d{6}|-\d{3}-\d{3})"	title="(請輸入09開頭的電話號碼)" required>
									<label for="name">連絡電話</label>
							</div>
							<div class="form-floating ">
								<input   type="text" class="form-control" name="mail" id="mail"
									maxlength="100" style="height: 50px" placeholder="電子郵件" 
									pattern="^[a-zA-Z0-9_.-]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.[a-zA-Z0-9]{2,6}$"
									title="(請確認電子郵件格式)" required>
									<label for="name">電子郵件</label>
							</div>
							<div class="form-floating ">
								<input  type="text" class="form-control" name="address" id="address"
									maxlength="100" style="height: 50px" placeholder="收件地址" 
									pattern="^[\u4e00-\u9fa5_a-zA-Z0-9-,.]+$"
									title="(請確認地址是否正確且不可有間隔)" required>
									<label for="name">收件地址</label>
							</div>
							<div class="form-floating ">
								<input  type="text" class="form-control" name="money" id="money"
									maxlength="100" style="height: 50px" placeholder="捐款金額" required>
									<label for="name">捐款金額</label>
							</div>
							<div class="form-folat_mb2 ">
								<div class="form check">
									<input  class="form-check-input" type="radio" name="receipt"
										id="receipt2" value="N"> <label>無需捐款收據</label>
								</div>
								<div class="form-folat_mb2">
									<input  class="form-check-input" type="radio" name="receipt"
										id="receipt1" value="Y" checked=""> <label>寄送捐款收據</label>
								</div>
							</div>
							
							
<!-- 							<div class="form-folat_mb3"> -->
<!-- 								<a id="code"></a><br> <input type="text" -->
<!-- 									class="form-contol" name="Check" id="Check" maxlength="6" -->
<!-- 									placeholder="驗證碼"> <span id="CheckId"></span>  -->
<!-- 									<a href="#" id="recode">更新驗證碼</a><br>  -->
<!-- 									<input type="submit" name="submit" value="驗證" id="validate"> -->
<!-- 							</div> -->
							
							<div class="form-folat_mb3">
								<div class="col-md-12">
									<img src="data:image/png;base64,${captchaEncode}" />
								</div>
							</div>
							<c:if test="${message ne null}">
								<div class="form-folat_mb3">
									${message}
								</div>
							</c:if>
							<div class="form-folat_mb3">
								<div class="col-md-12">
									<form:input class="form-control" path="captcha"
										placeholder="Enter Captcha" required="true" />
										<input type="submit" name="submit" value="確認" id="validate">
								</div>
							</div>
							
							</form>
							</form:form>
					</div>
					<!-- 邊框內容 -->
					<div class="overlay_border">
						<div class="overlay">
							<div class="overlay_pannel overlay_left">
								<p class="ps">請在右方填寫聯絡資訊，以利寄發感謝狀!</p>
								<p class="ps">重新選擇付款方式請點選下方返回鍵</p>
								<button class="ghost" id="signIn">
									<img src="${contextRoot}/image/donation/turn-back2.png" width="30%" alt="">
									返回
								</button>
							</div>
							<div class="overlay_pannel overlay_right">
								<!-- <p class="ps">斡旋</p>
                                <p class="ps">雅量</p> -->
								<img src="${contextRoot}/image/donation/cycle_diagram.jpg" alt="">
								<!-- <button class="ghost" id="signUp">右邊</button> -->
							</div>
						</div>
					</div>

					<div class="modal fade popout" id="lodinModal">
						<div class="modal-dialog modal-dialog-centered modal-lg">
							<div class="modal-content">
								<div class="modal-header">
									<a>ATM匯款方式</a>
									<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
								</div>
								<div class="modal-body">
									<a>歸心寺因應諸多信眾建議，增設匯款帳戶，方便信眾添油香，表達對神明的敬意與想還願，
										可以利用以下帳號，以轉帳匯款方式來支持：<br> <br> 銀行名稱：台新銀行<br>
										分行名稱：新北分行<br> 帳號：20311999217523<br> 戶名：歸心寺惜福帳戶<br>
										<br> 如需感謝狀，請電話告知、郵寄或
										Email:returntoheart@gmail.com，提供捐款人姓名、電話、住址、匯款帳號後五碼及匯款時間、金額，或是匯款影本。
										核對資料及疫情趨緩後將統一寄出感謝狀。<br> <br> 若有任何問題請洽 (06) 9993-2122
									</a>
								</div>
								<div class="modal-footer">
									<button type="button" data-bs-dismiss="modal">關閉</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>

<%-- 	<jsp:include page="../layout/footer.jsp"></jsp:include> --%>
	<script src="${contextRoot}/js/index/donation/Choose_to_pay.js"></script>
	<script src="${contextRoot}/js/index/donation/verification_code.js"></script>
</body>
</html>