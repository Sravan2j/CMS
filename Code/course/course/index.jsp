<html>
<head>
<title>Course Management System</title>
		<script>

function f1(){
if(document.login.uname.value==0)
	{
        alert("please enter username");
		return false;
    }
 if(document.login.pass.value==0)
        {
        alert("Please enter password");
		return false;
		}
  return true;
}
</script>
<style type="text/css">
<!--
body {
	background-color: #405060;
}
a:link {
	color: #FFFFFF;
	text-decoration: none;
}
a:visited {
	text-decoration: none;
	color: #FFFFFF;
}
a:hover {
	text-decoration: underline;
	color: #FFFFFF;
}
a:active {
	text-decoration: none;
	color: #FFFFFF;
}
.style17 {
	font-size: 12px;
	font-family: Arial, Helvetica, sans-serif;
}
.style20 {font-size: 9px}
.style24 {
	color: #002C37;
	font-size: 20px;
	font-weight: bold;
	font-family: "Times New Roman", Times, serif;
}
.style26 {
	font-size: 20px;
	font-weight: bold;
	color: #013648;
	font-family: "Times New Roman", Times, serif;
}
.style9 {
	font-size: 9px;
	font-weight: bold;
	font-family: "Times New Roman", Times, serif;
	color: #FFFFFF;
}
.style27 {font-size: 18px; font-weight: bold; font-family: "Times New Roman", Times, serif; color: #FFFFFF; }
.style29 {font-size: 11px; font-family: Arial, Helvetica, sans-serif; }
.style30 {
	font-family: "Times New Roman", Times, serif;
	font-size: 13.5px;
}
.style31 {
	color: #666666;
	font-size: 12px;
	font-weight: bold;
}
.style32 {
	font-size: 13.5px;
	color: #666666;
	font-weight: bold;
}
.style33 {
	color: #013648;
	font-weight: bold;
	font-size: 18px;
}
.style34 {color: #013648; font-size: 12px; font-weight: bold; }
-->
</style></head>

<body>
<p class="style20">&nbsp;</p>
<table width="760" height="418" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="760" height="78" valign="baseline" background="images/menu.jpg"><div align="center">
      <p align="right" class="style9"><span class="style29"><a href="home.html">Home</a></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
      <p class="style27">Sri Venkatesa Perumal College of Engineering &amp; Technology</p>
    </div></td>
  </tr>
  <tr>
    <td height="307" bgcolor="#CAD9DE">
 <form name="login" method="post" action="login.jsp" onSubmit="return f1()">
        <table width="758" height="242" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="516"><p>&nbsp;</p>
          <table width="479" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#003647">
            <tr>
              <td bgcolor="#EEEEEE"><table width="460" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td><p class="style17"><span class="style24">A</span>dvanced technology only will make the rural India productive. Rural folk can be provided the same technology that works in urban area. Information and communication technology bestows upon humanity and ability to defy distance and time. A healthy nation means more productive labor and an educated nation means more creative labor. To boost up the productivity of an individual or organization, the things to be considered in human resources are 1. Managerial Knowledge 2. Technical know-how particularly in information and communication technology area</p>
                    <p class="style17"><span class="style26">A</span>nd we at SVPCET, nurture future engineers with the combined efforts of the management committed to quality education, principal and faculty who have broad experience as teachers, strong academic and scholarly credentials, and great teaching skills. </p>
                    </td>
                </tr>
              </table></td>
            </tr>
          </table>  
          <p class="style20">&nbsp;</p></td>
        <td width="242"><table width="232" height="227" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#CAD9DE">
          <tr>
            <td width="232" valign="top" background="images/U1.jpg"><p>
              <label></label>
              </p>
              <p align="center" class="style33"> Login </p>
			 
              <table width="204" border="0" align="center" cellpadding="6" cellspacing="0">
                <tr>
                  <td><span class="style31"><span class="style30">UserName</span>:</span></td>
                  <td><input name="uname" type="text" size="15" /></td>
                </tr>
                <tr>
                  <td><span class="style32">Password:</span></td>
                  <td><input name="pass" type="password" size="15" /></td>
                </tr>
              </table>              
              <p align="center">
                <label>
                <input type="submit" name="Submit" value="Submit" />
                </label>
              </p>
           
          </tr>
        </table></td>
      </tr>
    </table>
    </form>
	</td>
  </tr>
  <tr>
    <td bgcolor="#013648">&nbsp;</td>
  </tr>
</table>
</body>
</html>
