function showMenu(){
   document.getElementById("menu").style.top = 0 + "px";   
}

function hideMenu(){
  document.getElementById("menu").style.top = "-" + 300 + "px";  
}

hideMenu();

document.getElementById("hamburger").onclick = showMenu;

document.getElementById("hamburger").ondblclick = hideMenu;


//
//   var logo = document.getElementById("logo");
//   var header = document.getElementById("header");
//
//   window.onscroll = shrink_header;
//
//   function shrink_header() {
//     if (window.pageYOffset>120) {
//     header.style.height = "75px";
//     logo.className = "small"
//   }
//     if (window.pageYOffset<120) {
//     header.style.height = "125px";
//     logo.className = "large"
//   }
// }