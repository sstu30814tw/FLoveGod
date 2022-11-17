<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<c:set var="contextRoot"  value="${pageContext.request.contextPath}"/>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>註冊成功</title>
 <!-- Custom fonts for this template-->
    <link href="${contextRoot}/vender/fontawesome-free/css/v5.8_all.min.css" rel="stylesheet" type="text/css">
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
</head>
<body class="bg-gradient-primary">
<%-- <jsp:include page="../layout/navbar.jsp"></jsp:include> --%>

<!--                         _oo0oo_ -->
<!--                        o8888888o -->
<!--                        88" . "88 -->
<!--                        (| -_- |) -->
<!--                        0\  =  /0 -->
<!--                      ___/`---'\___ -->
<!--                    .' \\|     |// '. -->
<!--                   / \\|||  :  |||// \ -->
<!--                  / _||||| -:- |||||- \ -->
<!--                 |   | \\\  -  /// |   | -->
<!--                 | \_|  ''\---/''  |_/ | -->
<!--                 \  .-\__  '-'  ___/-. / -->
<!--               ___'. .'  /--.--\  `. .'___ -->
<!--            ."" '<  `.___\_<|>_/___.' >' "". -->
<!--           | | :  `- \`.;`\ _ /`;.`/ - ` : | | -->
<!--           \  \ `_.   \_ __\ /__ _/   .-` /  / -->
<!--       =====`-.____`.___ \_____/___.-`___.-'===== -->
<!--                         `=---=' -->
<!--       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

<!--                 佛祖保佑         永無BUG -->
  
<div class="row">
    <div class="col-lg-12">
        <div class="p-5">
            <div class="text-center">
                <h1 class="h1 text-gray-900 mb-4 font">註 冊 成 功</h1>
                <a href="./login">回 登 入 畫 面</a>
            </div>
        </div>
    </div>
</div>

 <!-- LIKE 愛心特效 -->
    <div class="middle" style="display: none;">
        <div class="content-wrap middle">
            <div class="like-wrap middle"><i class="fas fa-heart"></i><span>Like</span></div>
        </div>
    </div>
<script type="text/javascript" src="json.js" >
   
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


<%-- <jsp:include page="../layout/footer.jsp"></jsp:include> --%>

</body>
</html>