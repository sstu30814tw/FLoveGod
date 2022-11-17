<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<c:set var="contextRoot" value="${pageContext.request.contextPath }" />
		<!DOCTYPE html>
		<html>

		<head>
			<link href="${contextRoot}/css/index/styles.css" rel="stylesheet" />
			<link href="${contextRoot}/css/index/customIndex.css" rel="stylesheet" />
			<style>
				.error {
					display: flex;
					justify-content: center;
					align-items: center;
					flex-direction: column;
					height: 100vh;
				}
			</style>
		</head>

		<body>
			<div class="backgroundImge error">
				<h1>此頁面錯誤 </h1>
				<h2>工程師正在努力維修中...</h2>
				<a href="${contextRoot}/">回首頁</a>

			</div>

		</body>

		</html>