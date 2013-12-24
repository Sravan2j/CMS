
<body><form name="sub" onsubmit="return f1()">
  <script type="text/javascript">
    function f1(){
        if(document.sub.year.value=='-')
            {alert("sem")};
    }
    function dis()
{
var cn=document.sub.cname.value;
var a="<select name=year onChange=f2()>";
var b="<option value=- selected=selected>-select-</option>";
var c="<option>I</option><option>II</option>";
var d="<option>III</option>";
var e= "<option>IV</option>";
var f=" </select>";
if(cn=='B.Tech'){
    document.getElementById("sb").innerHTML=a+b+c+d+e+f;
}
else if(cn=='M.Tech' || cn=='M.B.A'){
    document.getElementById("sb").innerHTML=a+b+c+f;
}
else if(cn=='M.C.A'){
    document.getElementById("sb").innerHTML=a+b+c+d+f;
}
}
function f2()
{
var cn=document.sub.cname.value;
var yr=document.sub.year.value;
if((cn=='B.Tech')&(yr=='I'))
{
document.sub.sem.disabled = true;
}
else
{
document.sub.sem.disabled = false;
}
}
  </script>

   <select name="cname" onchange="dis()" >
                          <option value="0">-select-</option>
                          <option value="B.Tech">B.Tech</option>
                          <option value="M.Tech">M.Tech</option>
                          <option value="M.B.A">M.B.A</option>
                          <option value="M.C.A">M.C.A</option>
                        </select>
 <div id="sb">
   </div>
    <select name="sem" id="textfield">
        <option value="-" selected="selected">-- -- -- -- -- --</option>
        <option value="1">1</option>
        <option value="2">2</option>
      </select>
    <input type="submit" value="ok">
  </form>
  </body>
</html>
