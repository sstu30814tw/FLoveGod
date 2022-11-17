/**
 * 
 */
var all_border = document.querySelector("#all_border");
var signInButton = document.querySelector("#signIn");
var signUpButton = document.querySelector("#signUp");
var ATMtransfer = document.querySelector("#Payment1");


ATMtransfer.addEventListener('click',function(){
    all_border.classList.add('right-panel-active')
    console.log("yes");
})

//右邊開關
// signUpButton.addEventListener('click',function(){
//     all_border.classList.add('right-panel-active')
//     console.log("no");
// })

//左邊開關
signInButton.addEventListener('click',function(){
    all_border.classList.remove('right-panel-active')
    console.log("yes");
})