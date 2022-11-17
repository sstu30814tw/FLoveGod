// 控制卡片出現的變數
var classVal = document.getElementById("controlBigCard").getAttribute("class");
//
var classVal2 = document.getElementById("centerimg").getAttribute("class");
//
var classVal3 = document.getElementById("story").getAttribute("class");
//拿來監聽點擊畫面的變數
let nextStep = document.getElementById("story");
let count = 0;



nextStep.addEventListener("click", click)


function click() {
    console.log("count=" + count)

    if (count == 0) {
        // classVal3 = classVal3.replace("backgroundImge", "backgroundImge1");
        // document.getElementById("story").setAttribute("class", classVal3);

        document.getElementById("centerP").innerHTML = ""
        document.getElementById("centerP").innerHTML = "向天公簡單的自我介紹；<br>名字、年齡、地址。"
        count++
    }
    else if (count == 1) {
        // classVal3 = classVal3.replace("backgroundImge1", "backgroundImge2");
        // document.getElementById("story").setAttribute("class", classVal3);

        document.getElementById("centerP").innerHTML = ""
        document.getElementById("centerP").innerHTML = "與月老講述自己心中的理想對象，<br>越詳細，月老越靈驗。"
        count++
    }
    else if (count == 2) {
        // classVal3 = classVal3.replace("backgroundImge2", "backgroundImge3");
        // document.getElementById("story").setAttribute("class", classVal3);

        classVal2 = classVal2.replace("outcenterimg", "noCenterImg");
        document.getElementById("centerimg").setAttribute("class", classVal2);
        document.getElementById("idimg").src = ""
        document.getElementById("centerP").innerHTML = ""
        document.getElementById("centerP").innerHTML = "持香三拜"
        count++
    }

    else if (count == 3) {
        // classVal3 = classVal3.replace("backgroundImge3", "backgroundImge4");
        // document.getElementById("story").setAttribute("class", classVal3);


        document.getElementById("centerP").innerHTML = "持香三拜<br>壹拜"
        count++
    }
    else if (count == 4) {



        document.getElementById("centerP").innerHTML = "持香三拜<br>貳拜"
        count++
    }
    else if (count == 5) {



        document.getElementById("centerP").innerHTML = "持香三拜<br>參拜"
        count++
    }

    else if (count == 6) {
        // classVal3 = classVal3.replace("backgroundImge6", "backgroundImge7");
        // document.getElementById("story").setAttribute("class", classVal3);

        document.getElementById("centerP").innerHTML = ""
        document.getElementById("centerP").innerHTML = "已尋得對象，<br>請擲杯詢問是否為良緣。"


        let num = Math.floor(Math.random() * 2);
        console.log("num =" + num);
        if (num == 0) {
            count++
        }
        else {
            count++;
            count++;
        }
    }
    else if (count == 7) {


        classVal2 = classVal2.replace("noCenterImg", "outcenterimg");
        document.getElementById("centerimg").setAttribute("class", classVal2);
        document.getElementById("centerP").innerHTML = ""
        document.getElementById("idimg").src = "/my-app/image/marriage/false.png"
        count = 2
    }
    else if (count == 8) {
        document.getElementById("centerP").innerHTML = ""
        document.getElementById("idimg").src = "/my-app/image/marriage/true.png"


        classVal2 = classVal2.replace("noCenterImg", "outcenterimg");
        document.getElementById("centerimg").setAttribute("class", classVal2);



        classVal3 = classVal3.replace("backgroundImge7", "backgroundImge2");
        document.getElementById("story").setAttribute("class", classVal3);


        count++
    }

    else if (count == 9) {



        classVal3 = classVal3.replace("backgroundImge", "backgroundImge7");
        document.getElementById("story").setAttribute("class", classVal3);
        classVal2 = classVal2.replace("outcenterimg", "");
        document.getElementById("centerimg").setAttribute("class", classVal2);
        document.getElementById("idimg").src = ""
        document.getElementById("centerP").innerHTML = ""
        count++
    }


    else if (count == 10) {
        classVal3 = classVal3.replace("backgroundImge7", "");
        document.getElementById("story").setAttribute("class", classVal3);

        classVal = classVal.replace("nobigCard", "bigCard");
        document.getElementById("controlBigCard").setAttribute("class", classVal);


    }
}