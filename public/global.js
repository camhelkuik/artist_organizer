function showMenu(){
   document.getElementById("menu").style.top = 0 + "px";   
}

function hideMenu(){
  document.getElementById("menu").style.top = "-" + 300 + "px";  
}

hideMenu();

document.getElementById("hamburger").onclick = showMenu;

document.getElementById("hamburger").ondblclick = hideMenu;