//解籤畫面
var classVal = document.getElementById("controlBigCard").getAttribute("class");
//
var classVal2 = document.getElementById("centerimg").getAttribute("class");


var classVal3 = document.getElementById("showPoem").getAttribute("class");

var classVal4 = document.getElementById("bt2class").getAttribute("class");
let count = 0;
let nextimage = document.getElementById("nextText");
nextimage.addEventListener("click", click)

let bt2 = document.getElementById("bt2");
bt2.addEventListener("click", bt2click)
function bt2click() {
    document.getElementById("s").innerHTML = "勝杯"
    document.getElementById("idimg").src = "/my-app/image/draw/true.png"
    document.getElementById("nextText").innerHTML = "觀看籤文";
    classVal4 = classVal4.replace("bt2class2", "bt2class");
    document.getElementById("bt2class").setAttribute("class", classVal4);
    count = 5;

}

function click() {
    if (count == 0) {
        document.getElementById("s").innerHTML = "開始求籤"
        document.getElementById("idimg").src = "/my-app/image/draw/drawn-sign.gif";
        document.getElementById("s2").innerHTML = ""
        document.getElementById("nextText").innerHTML = "已誠心祈求";
        count++
    }
    else if (count == 1) {

        document.getElementById("s").innerHTML = "以抽出籤"
        document.getElementById("idimg").src = "/my-app/image/draw/draw2.gif";
        document.getElementById("nextText").innerHTML = "下一步";
        count++

    }
    else if (count == 2) {

        classVal4 = classVal4.replace("bt2class", "bt2class2");
        document.getElementById("bt2class").setAttribute("class", classVal4);




        document.getElementById("s").innerHTML = "請擲杯詢問"
        document.getElementById("idimg").src = "/my-app/image/draw/hand.png"
        document.getElementById("nextText").innerHTML = "開始擲杯";

        let num = Math.floor(Math.random() * 2);
        console.log(num);
        if (num == 0) {
            count++
        }
        else {
            count++;
            count++;
        }



    }
    else if (count == 3) {
        classVal4 = classVal4.replace("bt2class2", "bt2class");
        document.getElementById("bt2class").setAttribute("class", classVal4);


        document.getElementById("s").innerHTML = "笑杯"

        document.getElementById("idimg").src = "/my-app/image/draw/false.png"
        document.getElementById("nextText").innerHTML = "重新求籤";
        // Math.floor(Math.random() * 2);
        count--;
        count--;
        count--;


    }
    else if (count == 4) {
        classVal4 = classVal4.replace("bt2class2", "bt2class");
        document.getElementById("bt2class").setAttribute("class", classVal4);


        document.getElementById("s").innerHTML = "勝杯"
        document.getElementById("idimg").src = "/my-app/image/draw/true.png"
        document.getElementById("nextText").innerHTML = "觀看籤文";
        count++
    }
    else if (count == 5) {



        classVal3 = classVal.replace("nobigCard", "bigCard");
        document.getElementById("showPoem").setAttribute("class", classVal3);

        document.getElementById("s").innerHTML = "點擊觀看簽文"
        document.getElementById("idimg").src = ""
        document.getElementById("s2").innerHTML = ""
        document.getElementById("nextText").innerHTML = "再次求籤";

        count++
    }
    else if (count == 6) {
        window.location.reload();
    }

}


// button
var animateButton = function (e) {

    e.preventDefault;
    //reset animation
    e.target.classList.remove('animate');

    e.target.classList.add('animate');
    setTimeout(function () {
        e.target.classList.remove('animate');
    }, 700);
};

var bubblyButtons = document.getElementsByClassName("bubbly-button");

for (var i = 0; i < bubblyButtons.length; i++) {
    bubblyButtons[i].addEventListener('click', animateButton, false);
}

