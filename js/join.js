// function doDisplay(){
//   var con = document.getElementById("term_text_1")
//   if(con.style.display=='none'){
//       con.style.display = 'block';
//   } else {
//     con.style.display = 'none';
//   }
// }

function doDisplay(){
  var text1 = document.getElementById("term_text_1")
  var text2 = document.getElementById("term_text_2")
  var text3 = document.getElementById("term_text_3")
  var con = document.getElementById("term_text")
  var con2 = document.getElementById("background")

  if(text1.style.display=='none'){
      con.style.display = 'block';
      con2.style.display = 'block';
      text1.style.display = 'block';
  } else {
    text1.style.display = 'none';
    con.style.display = 'none';
    con2.style.display = 'none';
  }

  if(text1.style.display=='none'){
      con.style.display = 'block';
      con2.style.display = 'block';
      text1.style.display = 'block';
  } else {
    text1.style.display = 'none';
    con.style.display = 'none';
    con2.style.display = 'none';
  }

  if(text1.style.display=='none'){
      con.style.display = 'block';
      con2.style.display = 'block';
      text1.style.display = 'block';
  } else {
    text1.style.display = 'none';
    con.style.display = 'none';
    con2.style.display = 'none';
  }
}
