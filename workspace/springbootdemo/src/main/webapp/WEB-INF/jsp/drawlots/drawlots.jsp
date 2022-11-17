<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <c:set var="contextRoot" value="${pageContext.request.contextPath }" />

        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>姻緣籤詩</title>
            <link href="${contextRoot}/css/index/drawLots.css" rel="stylesheet" />
            <style>
                .bt2class {
                    margin-left: 50%;
                    display: none;
                }

                .bt2class2 {
                    margin-left: 50%;

                }
            </style>
        </head>

        <body>

            <jsp:include page="../layout/navbar.jsp"></jsp:include>
            <!-- 跳出視窗內容 -->

            <div class="modal fade " id="loginModal">

                <div class="modal-dialog modal-dialog-centered  redLine">
                    <div class="modal-content">
                        <!-- Header -->
                        <div class="modal-header">
                            <h2>求籤結果</h2>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                        </div>
                        <!-- Body -->
                        <div class="modal-body">
                            <!-- 表單 -->
                            <form>
                                <!-- 籤詩 -->
                                <div class="form-group">
                                    <h3>籤詩</h3>
                                    <h4>${drawName}</h4>
                                    <br>
                                </div>
                                <!-- 解說 -->
                                <div class="form-group">
                                    <h3>解說</h3>
                                    <h4>${drawMean}</h4>
                                    <br>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
            </div>
            <!-- 跳出視窗內容 -->


            <div class="backgroundImge moveback ">
                <div class="container px-4 px-lg-5 h-100">


                    <img class="move" src="${contextRoot}/image/draw/back/1.png" alt=''>
                    <img class="move2" src="${contextRoot}/image/draw/back/1.png" alt=''>
                    <img class="move3" src="${contextRoot}/image/draw/back/1.png" alt=''>
                    <img class="move" src="${contextRoot}/image/draw/back/1.png" alt=''>
                    <img class="move2" src="${contextRoot}/image/draw/back/2.png" alt=''>
                    <img class="move3" src="${contextRoot}/image/draw/back/2.png" alt=''>
                    <img class="move" src="${contextRoot}/image/draw/back/2.png" alt=''>
                    <img class="move" src="${contextRoot}/image/draw/back/2.png" alt=''>


                    <div class="row gx-3 gx-lg-5 h-50  justify-content-center text-center">

                        <h1>姻緣籤詩</h1>
                        <div class="drawBig smallback">
                            <div id="centerimg" class="centerback">

                                <div class="drawBigText text-center   ">


                                    <h3 id="s">合掌默禱求籤</h3>

                                    <h5 id="s2"><br><br><br> 默念 :
                                        信士OOO，OOO年O月O生，<br>家住OOOOO(現居地址)，因有OOOOO問題，<br>恭請賜籤指點。
                                    </h5>
                                    <br>
                                    <br>
                                    <!-- 按鈕 -->
                                    <div class="nobigCard " id="showPoem">
                                        <a href="#" type="button" data-bs-toggle="modal"
                                            data-bs-target="#loginModal"><img class="paper "
                                                src="${contextRoot}/image/draw/paper.gif"></a>
                                    </div>

                                    <img class="draw " id='idimg' src="" />
                                </div>
                                <div id="nextimage">
                                    <button id="nextText" class="bubbly-button">下一步</button>
                                </div>
                                <div class="bt2class" id='bt2class'>
                                    <button id="bt2" class="bubbly-button">一鍵聖杯</button>
                                </div>

                            </div>



                            <div id="controlBigCard" class="nobigCard inZoom">

                            </div>



                        </div>


                    </div>
                </div>
            </div>






            <script src="${contextRoot}/js/drawlots/drawlots.js"></script>
        </body>

        </html>