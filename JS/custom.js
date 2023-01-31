
const sidebar = document.getElementById("sidebar");
 const menubar = document.getElementById("menubar");
menubar.onclick = function(){
    if(sidebar.style.display != "none"){
        sidebar.style.display = "none";
    }else{
        sidebar.style.display = "block"
    }
}
