<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<%@ page import="java.lang.*" %> 
<html
<head>
<title>Course Management System</title>
<script>
    function f1(){
if(document.up.creg.value==0)
	{
        alert("please enter regulation");
		return false;
    }
     if(isNaN(document.up.creg.value)==false)
       {alert("Regulation should contain alphabets");
       return false;
   }
    if((document.up.year.value==0))
	{
        alert("please enter year");
		return false;
    }
     if(isNaN(document.up.year.value))
       {alert("Year should contain Numerics only");
       return false;
   }
 if(document.up.seats.value==0)
        {
        alert("Please enter seats");
		return false;
		}
     if(isNaN(document.up.seats.value))
       {alert("Seats should contain Numerics only");
       return false;
   }
  return true;
}</script>
<style type="text/css">
<!--
body {
	background-color: #EBEBEB;
}
a:link {
	color: #5691B1;
	text-decoration: none;
}
a:visited {
	text-decoration: none;
	color: #5691B1;
}
a:hover {
	text-decoration: underline;
	color: #5691B1;
}
a:active {
	text-decoration: none;
	color: #5691B1;
}
.style14 {
	color: #5691B1;
	font-size: 22px;
	font-family: "Courier New", Courier, monospace;
	font-weight: bold;
}
.style15 {
	font-family: "Courier New", Courier, monospace;
	color: #666666;
}
.style16 {color: #666666}
.style1 {font-size: 16px}
-->
</style>
</head>
<body>
<%
 try {
String driver=application.getInitParameter("driver");
        String url=application.getInitParameter("url");
        String user=application.getInitParameter("user");
        String pswd=application.getInitParameter("pswd");
        Class.forName(driver);
        Connection con=DriverManager.getConnection(url,user,pswd);
String c= request.getParameter("cname");
String b= request.getParameter("bname");
String cr= request.getParameter("creg");
PreparedStatement pst = con.prepareStatement("select creg,year,seats from courseinfo where cname=? and bname=? and creg=?");
 pst.setString(1, c);
 pst.setString(2, b);
 pst.setString(3, cr);
 ResultSet rs1 = pst.executeQuery(); 
 %>
<form ACTION="update1.jsp" method="post" name="up" onsubmit="return f1()">
  <%
if(rs1.next()){ 
%>
<center>
<table width="778" height="404" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="780" height="69" valign="bottom" background="images/header.gif"><div align="center" class="style14 style1">To Update:Remove Existing and Replace the Text Field with New</div></td>
  </tr>
  <tr>
    <td height="201" valign="middle">
	<table width="764" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td bgcolor="#DADADA">
		<table width="756" height="203" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="764" bgcolor="#CCCCCC">
			<table width="749" height="207" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td valign="top" bgcolor="#FFFFFF">

                    <p>
                      <%
    ResultSet rs = pst.executeQuery();
while (rs.next()) {

    %>
                      <input type="hidden" name="cname1" value="<%=c%>"/>
                      <input type="hidden" name="bname1" value="<%=b%>"/>
                      <input type="hidden" name="creg1" value="<%=cr%>"/>
</p>
                    <p>&nbsp;                    </p>
                    <div align="center" class="style15">Course Regulation:
  <input name="creg" type="text" size="10" value="<%=rs.getString(1)%>"/>
</div>
<p align="center" class="style15">&nbsp;</p>
<div align="center" class="style15">Year Of Starting:
  <input name="year" type="text" size="10" value="<%=rs.getString(2)%>"/>
</div>
<p align="center" class="style15">&nbsp;</p>
<div align="center" class="style15">No. Of Seats:
  <input name="seats" type="text" size="10" value="<%=rs.getString(3)%>"/>
  
</div>

                    <table width="748" height="165" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                      <td height="81" valign="top" background="ch.JPG" bgcolor="#8AB06B">
					<table align="center" cellpadding="30"><tr><td valign="top">
                                     <button type="submit">Update</button></td>
</form>
<td>
					
					<form ACTION="updatec.jsp" method="post" > 
					   <button type="submit">Cancel</button>
					  </form>
</td></tr>
                    </table>
</td>
                    </tr>
                  </table></td>
                </tr>
            </table></td>
          </tr>
        </table></td>
      </tr>
    </table>
    </td>
  </tr>
  <tr>
    <td height="44" background="images/footer2.gif">&nbsp;</td>
  </tr>
</table>

<%
}
}
else
    {
%> 
<body>
<table width="778" height="404" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="780" height="69" valign="bottom" background="images/header.gif"><div align="center" class="style14"></div></td>
  </tr>
  <tr>
    <td height="201" valign="middle"><table width="764" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td bgcolor="#DADADA"><table width="756" height="203" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="764" bgcolor="#CCCCCC"><table width="749" height="207" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td valign="top" bgcolor="#FFFFFF"><p align="center">&nbsp;</p>
                <h3><center>
                  <span class="style15 style1">Selected Course or Subject doesnot Exists.</span>
                </center></h3>
     <h3><center>
       <span class="style15 style1">To Create Course</span><span class="style16 style1">: </span><a href="addc.html">Click Here</a> 
     </center></h3>   

<TABLE align="center">
        <TR>
            <TD><form ACTION="updatec.jsp" method="post" >
<p align="center"><input type="hidden" name="hiddenField" /></p></form>            </TD>
        </TR>
    </TABLE>
<table width="748" height="165" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                      <td height="81" valign="top" background="ch.JPG" bgcolor="#8AB06B"><div align="center">
                        <TABLE align="center" cellpadding="30">
                          <TR>
                            <TD valign="middle"><form ACTION="updatec.jsp" method="post" >
                                <p align="center">
                                  <button type="submit">Back</button>
                                </p>
                            </form>                                                    </TD>
                            <TD valign="middle"><form ACTION="courses.html" method="post" >
                                <button type="submit">Back to HOME PAGE</button>
                            </form></TD>
                          </TR>
                        </TABLE>
                      </div></td>
                    </tr>
                  </table></td>
                </tr>
            </table></td>
          </tr>
        </table></td>
      </tr>
    </table>
    </td>
  </tr>
  <tr>
    <td height="44" background="images/footer2.gif">&nbsp;</td>
  </tr>
</table>


<%   }
pst.close();
con.close();

 }

   catch (Exception ex) {out.println(ex);}
     %>

</body>
</html>
