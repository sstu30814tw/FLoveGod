//marriage 姻緣開啟//
function openShutManager(oSourceObj, oTargeObj, shutAble, oOpenTip, oShutTip) {
    var sourceObj = typeof oSourceObj == "string" ? document.getElementById(oSourceObj) : oSourceObj;
    var targeObj = typeof oTargeObj == "string" ? document.getElementById(oTargeObj) : oTargeObj;
    var openTip = oOpenTip || "";
    var shutTip = oShutTip || "";
    if (targeObj.style.display != "block") {
        if (shutAble) return;
        targeObj.style.display = "block";
        if (openTip && shutTip) {
            sourceObj.innerHTML = shutTip;
        }
    } else {
        targeObj.style.display = "none";
        if (openTip && shutTip) {
            sourceObj.innerHTML = openTip;
        }
    }
}