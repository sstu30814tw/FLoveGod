<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<c:set var="contextRoot" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>使用者介面</title>
<!-- Custom fonts for this template-->
<link href="${contextRoot}/vender/bootstrap/5.1.3/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<!-- Custom styles for this template-->
<link href="${contextRoot}/css/login/fontsNunito.css" rel="stylesheet">
<!-- 登入CSS -->
<link href="${contextRoot}/css/login/login.css" rel="stylesheet">

<!-- 首頁CSS -->
<link href="${contextRoot}/css/index/styles.css" rel="stylesheet">
<!-- 自訂修改CSS -->
<link href="${contextRoot}/css/login/loginCustom.css" rel="stylesheet">
<link href="${contextRoot}/css/user/userStyles.css" rel="stylesheet">
<!-- <link href="../../../css/user/userStyles.css" rel="stylesheet"> -->

</head>
<jsp:include page="../layout/navbar.jsp"></jsp:include>





<div class="container">
	<form:form class="user" action="usersubmit" method="post"
		modelAttribute="usersubmit">
		<div class="row">
			<div class="col-lg-3"></div>
			<div class="my-5 col-lg-6">
				<div class="card-body p-0">
					<!-- Nested Row within Card Body -->
					<div class="p-5 row">
						<div class="text-center col-lg-12">
							<h1 class="h2 text-gray-900 mb-4 font">修改會員</h1>
						</div>
						<div class="text-center col-lg-12">
							<h5 class="text-danger">${Msg}</h5>
						</div>

						<!-- 註冊帳號 -->
						<div class="form-group col-lg-12">

							<input type="text" class="form-control form-control-lg"
								id="memberId" placeholder="${MemberId}" pattern=".{6,12}"
								pattern="[a-zA-Z0-9]{6,12}" title="（請最少輸入 6 - 12 位英文與數字）"
								name="memberId"  required disabled="disabled"> <span
								id='result0c'>（請最少輸入 6 - 12 位英文與數字）</span>
							<!-- minlength="6" maxlength="12" -->
						</div>
						<!-- 註冊密碼 -->
						<div class="form-group col-lg-12">
							<input type="password" class="form-control form-control-lg"
								id="password" placeholder="請輸入密碼..." pattern=".{6,12}"
								pattern="[a-zA-Z0-9]{6,12}" title="（請最少輸入 6 - 12 位英文與數字）"
								name="password" value="${Password}" required disabled="disabled"> <span>（請最少輸入
								6 - 12 位英文與數字）</span>
						</div>

						<!-- 註冊姓名 -->
						<div class="form-group col-lg-12">
							<input type="text" class="form-control form-control-lg"
								placeholder="請輸入您的姓名..." name="name" value="${Name}" required>
						</div>

						<!-- 註冊性別 -->
						<div class="form-group col-lg-3"
							style="text-align: left; font-size: 1.5rem;">
							<label>性別：</label>
						</div>

						<c:choose>
							<c:when test="${Sex == 1}">
								<div class="form-group col-lg-2"
									style="text-align: left; font-size: 1.5rem;">
									<div class="form-check">
										<input class="form-check-input" type="radio" name="sex"
											value="1" id="sexRadio1" checked> <label
											class="form-check-label" for="sexRadio1"> 男 </label>
									</div>
								</div>
								<div class="form-group col-lg-2"
									style="text-align: left; font-size: 1.5rem;">
									<div class="form-check">
										<input class="form-check-input" type="radio" name="sex"
											value="0" id="sexRadio0"> <label
											class="form-check-label" for="sexRadio0"> 女 </label>
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<div class="form-group col-lg-2"
									style="text-align: left; font-size: 1.5rem;">
									<div class="form-check">
										<input class="form-check-input" type="radio" name="sex"
											value="1" id="sexRadio1"> <label
											class="form-check-label" for="sexRadio1"> 男 </label>
									</div>
								</div>
								<div class="form-group col-lg-2"
									style="text-align: left; font-size: 1.5rem;">
									<div class="form-check">
										<input class="form-check-input" type="radio" name="sex"
											value="0" id="sexRadio0" checked> <label
											class="form-check-label" for="sexRadio0"> 女 </label>
									</div>
								</div>
							</c:otherwise>
						</c:choose>
						<div class="form-group col-lg-5"></div>

						<!-- 註冊生日 -->
						<div class="form-group col-lg-3"
							style="text-align: left; font-size: 1.5rem;">
							<label>生日：</label>
						</div>
						<div class="form-group col-lg-9"
							style="text-align: left; font-size: 1.5rem;">
							<input class="form-control form-control-lg" type="date"
								name="birthday" value="${Birthday}" required>
						</div>

						<!-- 註冊地址 -->
						<div class="form-group col-lg-12">
							<input type="text" class="form-control form-control-lg"
								placeholder="請輸入您的地址..." name="address" value="${Address}"
								maxlength="30">
						</div>

						<!-- 註冊手機 -->
						<div class="form-group col-lg-12">
							<input type="tel" class="form-control form-control-lg"
								placeholder="請輸入您的手機號碼..." name="phone" value="${Phone}"
								pattern=".{6,12}">
							<!-- minlength="10" maxlength="11" -->
						</div>

						<!-- 註冊信箱 -->
						<div class="form-group col-lg-12">
							<input type="tel" class="form-control form-control-lg"
								pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$"
								placeholder="請輸入您的E-mail..." value="${Mail}" name="mail">
						</div>


						<div class="form-check col-lg-10 h2 text-gray-900 mb-4">
							<label class="form-check-label" for="flexCheckDefault">
								開啟姻緣功能： </label> <input class="form-check-input" type="checkbox"
								name="mach" checked
								style="float: none; margin-left: 0.1em; margin-top: 0.1em;"
								value="${Mach}"
								onclick="openShutManager(this,'extraData',false,'内容')" />
							<div class="form-group col-lg-2"></div>

							<div id="extraData" style="display: block;">
								<!-- <span>我是隐藏的内容</span> -->
								<div class="form-group col-lg-12">
									<label for="exampleFormControlTextarea1"
										style="font-size: 1.5rem;">簽名欄：</label>
									<textarea class="form-control" id="exampleFormControlTextarea1"
										rows="5" name="text">${Text}</textarea>
								</div>
								<div class="form-group col-lg-12">
									<label style="font-size: 1.5rem;">聯絡方式(建議填寫)：</label>
								</div>

								<div class="form-group col-lg-12"
									style="font-size: 1.5rem; margin-top: 0.1em; text-align: left;">
									<div class="form-check">
<!-- 										<input class="form-check-input" type="radio" name="Line" -->
<!-- 											id="contactRadio2">  -->
											<label class="form-check-label"
											for="contactRadio2"> Line： </label>
									</div>
								</div>
								<div class="form-group col-lg-12">
									<input type="text" class="form-control form-control-lg"
										value="${Line}" placeholder="請輸入您Line" name="line"
										maxlength="50">
								</div>

								<div class="form-group col-lg-12"
									style="font-size: 1.5rem; margin-top: 0.1em; text-align: left;">
									<div class="form-check">
<!-- 										<input class="form-check-input" type="radio" name="IG" -->
<!-- 											id="contactRadio3">  -->
											<label class="form-check-label"
											for="contactRadio3"> IG： </label>
									</div>
								</div>
								<div class="form-group col-lg-12">
									<input type="text" class="form-control form-control-lg"
										value="${Ig}" placeholder="請輸入您IG" name="ig" maxlength="50">
								</div>
							</div>
							<div class="form-group">
								<div class="custom-control custom-checkbox small">
									<input type="checkbox" class="custom-control-input"
										id="customCheck">
								</div>
							</div>
							<button class=" btn-loginColor btn-block btn-lg font"
								name="submit" value="submit">確 認 修 改</button>
						</div>
					</div>
				</div>
				<div class="col-lg-3"></div>
			</div>
		</div>
	</form:form>
</div>




<!-- 姻緣開啟 -->
<script src="${contextRoot}/js/login/marriage.js"></script>
<!-- Bootstrap core JavaScript-->
<script src="${contextRoot}/vender/jquery/3.6.0/jquery.min.js"></script>
<!-- <script
		src="${contextRoot}/vender/bootstrap/5.1.3/bootstrap.bundle.min.js">
	</script> -->
<!-- Core plugin JavaScript-->
<script src="${contextRoot}/vender/jquery/3.6.0/jquery.min.js"></script>



</body>
</html>