
//已經將驗證碼顯到後端，目前已棄用
/**
 * 
 */
 
var checkCode = document.getElementById("code");
var DD;//數字字串
var D2;//大寫數字字串

//產生驗證碼
function createCode(){
//設定數字
  var aa=[5,6,7,8,9];//十位數
  var bb=[0,1,2,3,4];//個位數
  var cc=['+','-','*'];//運算符號
  //設定大寫數字
  var a2=["五","六","七","八","九"];//十位數
  var b2=["零","一","二","三","四"];//個位數
  var c2=['加','減','乘'];//運算符號
  
  //取得隨機數字
  var r1=Math.floor(Math.random()*aa.length);
  var r2=Math.floor(Math.random()*bb.length);
  var r3=Math.floor(Math.random()*cc.length);
  //alert(r1+"-"+r2+"-"+r3);

  var AA=aa[r1];
  var BB=bb[r2];
  var CC=cc[r3];
  console.log(AA);
  console.log(BB);
  console.log(CC);
  DD="";
  DD=AA+CC+BB;//數字字串
  Md=eval(DD);//透過eval強制運算
  //alert(eval(DD));

  var A2=a2[r1];
  var B2=b2[r2];
  var C2=c2[r3];
  console.log(A2);
  console.log(B2);
  console.log(C2);
  D2="";
  D2=A2+C2+B2;//大寫數字字串
  //alert(D2);
  //checkCode.style["font-family"]="Microsoft JhengHei";
  //checkCode.style["font-style"]="normal";
  checkCode.innerHTML=D2//寫出驗證碼
}

//驗證
var validate=document.getElementById('validate');
let na = document.getElementById('CheckId');
validate.addEventListener("click",checkForm);

function checkForm(){
	var inputCode = document.getElementById("Check").value.toUpperCase(); //取得輸入的驗證碼並轉化為大寫 
	if(inputCode.length <= 0) { //若輸入的驗證碼長度為0 
		na.innerHTML=("不可為空白"); //則彈出請輸入驗證碼 
		
	} 
	else if(parseInt(inputCode,10) !== Md ) { //若輸入的驗證碼與產生的驗證碼不一致時 //將輸入的字串轉成10進位的整數
    //alert(parseInt(inputCode,10));
    //alert(eval(DD));
    na.innerHTML=("驗證碼輸入錯誤")//則彈出驗證碼輸入錯誤 
    createCode();//重新整理驗證碼 
	  document.getElementById("Check").value = "";//清空文字框
	   return false;
	} 
	else { //輸入正確時 
	alert("^-^"); //彈出^-^
    createCode();//重新整理驗證碼
    document.getElementById("Check").value = "";//清空文字框
    	return true;
	} 
};

//更新驗證碼
var recode=document.getElementById('recode');
recode.addEventListener("click",function(){
	  createCode();
    document.getElementById("Check").value = "";//清空文字框 
  	e.preventDefault();	
});
//點擊更新驗證碼
checkCode.addEventListener("click",function(){
	  createCode();
    document.getElementById("Check").value = "";//清空文字框 
  	e.preventDefault();	
});

createCode();