// window.onload = function(){
//
//   var display = document.getElementById("profile_wrap");
//   var btn = document.getElementById("login_btn");
//
//   btn.onclick = function(){
//     if(display.style.display=="none"){
//       display.style.display = "block";
//     } else {
//       display.style.display = "none";
//     }
//   }
// }

var a;
function login_btn(){
  var display = document.getElementById("profile_wrap");
  var btn = document.getElementById("login_btn");

  if(a==1){
    display.style.display="block";
    return a=0;
  } else {
    display.style.display="none";
    return a=1;
  }
}

// let btn = document.getElementById("login_btn");
//
// btn.onclick = display;
//
// function display(){
//     if(document.getElementById("profile_wrap").style.display=="none"){
//       document.getElementById("profile_wrap").style.display = "block";
//     } else {
//       document.getElementById("profile_wrap").style.display = "none";
//     }
// }
