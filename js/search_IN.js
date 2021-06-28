function test(){
  document.getElementById("demo").style.color = "red";
}

function doDisplay() {
  var horror = document.getElementById("horror");
  var comedy = document.getElementById("comedy");

  if(horror.style.display == 'none'){
    horror.style.display = 'block';

  }else{
    horror.style.display = 'none';
  }
}
