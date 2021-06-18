function test(){
  document.getElementById("demo").style.color = "red";
}

function doDisplay() {
  var con = document.getElementById("horror");
  if(con.style.display == 'none'){
    con.style.display = 'block';
  }else{
    con.style.display = 'none';
  }
}

function doDisplay2() {
  var con = document.getElementById("comedy");
  if(con.style.display == 'none'){
    con.style.display = 'block';
  }else{
    con.style.display = 'none';
  }
}
