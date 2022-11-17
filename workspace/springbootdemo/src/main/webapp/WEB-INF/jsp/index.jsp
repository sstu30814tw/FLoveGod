<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<c:set var="contextRoot" value="${pageContext.request.contextPath }" />
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>首頁</title>
			<style>

			</style>
		</head>

		<body>
			<jsp:include page="layout/navbar.jsp"></jsp:include>

			<div class="">


				<div class="form-group col-lg-12">
					<h1 style="font-size:50px ;margin-top:100px;"></h1>
				</div>


				<div class="container px-4 px-lg-5 h-100 imgrela">
					<br><br><br><br> <br><br><br><br><br>
					<div class="indeximg">
						<img class="imgcenter" src="${contextRoot}/image/index/indexCenter.gif">
						<div class="col-lg-8 align-self-end imgSize">
						</div>
						<div class="col-lg-8 align-self-baseline indeximg2">

							<a id="login" href="${contextRoot}/login ">登入/註冊</a>
							<%-- <a id="login" href="${contextRoot}/register "></a> --%>
						</div>
					</div>
				</div>
			</div>


			<!--如果你是做首頁 內容請放於這上方 這個要放在最下面 -->
			<%-- <jsp:include page="layout/footer.jsp">
				</jsp:include> --%>

		</body>

		</html>