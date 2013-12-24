<%@ page import="java.sql.*" %>
<%@ page import="java.lang.*" %> 
<html>
<head>
<title>Course Management System</title>
<script>function f1(){

if(document.sbv1.cname.value==0)
	{
        alert("please select course");
		return false;
    }
     if((document.sbv1.cname.value=='B.Tech')&(document.sbv1.bname.value=='-'))
	{
        alert("please select Branch");
		return false;
    }
    if(document.sbv1.creg.value==0)
	{
        alert("please select Course Regulation");
		return false;
    }
    if(document.sbv1.year.value==0)
	{
        alert("please select year");
		return false;
    }
      if((document.sbv1.cname.value!='B.Tech')||(document.sbv1.year.value!='I')|(document.sbv1.sem.value!='-'))
	{
        if(document.sbv1.sem.value=='-'){
	 alert("please select sem");
		return false;}
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
.style1 {	font-size: 18px;
	font-weight: bold;
}
.style29 {color: #666666}
-->
</style></head>

<body>
     <script language="javascript">
function dis()
{
if((document.sbv1.cname.value=='B.Tech')&(document.sbv1.year.value=='I'))
{

document.getElementById("textfield").disabled = true;
}
else
{
document.getElementById("textfield").disabled = false;
}

}
</script>
<form name="sbv1" method="post" action="subview1.jsp" onSubmit="return f1()">
  <table width="778" height="404" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="780" height="69" valign="bottom" background="images/header.gif"><div align="center" class="style14"><span class="style1"> Select Options to view Subjects</span></div></td>
  </tr>
  <tr>
    <td height="201" valign="middle"><table width="764" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td bgcolor="#DADADA"><table width="756" height="203" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="764" bgcolor="#CCCCCC"><table width="749" height="207" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td valign="top" bgcolor="#FFFFFF"><div align="center" class="style14"><span class="style1">
                    <%
                 String driver=application.getInitParameter("driver");
        String url=application.getInitParameter("url");
        String user=application.getInitParameter("user");
        String pswd=application.getInitParameter("pswd");
        Class.forName(driver);
        Connection con=DriverManager.getConnection(url,user,pswd);
%>
                  </span></div>
                  <p align="center">&nbsp;</p>

 <center>
   <table width="260" border="0" align="center" cellpadding="12" cellspacing="0">
     <%
      PreparedStatement pst2 = con.prepareStatement("select distinct cname from courseinfo");

 ResultSet rs2 = pst2.executeQuery();
      %>
     <tr>
       <td><span class="style29">Course: </span></td>
       <td><span class="style29">
         <select name="cname" onChange="dis()">
           <option value="0">-select-</option>
           <%
while (rs2.next()) {
    %>
           <option value="<%=rs2.getString(1)%>"><%=rs2.getString(1)%></option>
           <%   }%>
         </select>
       </span> </td>
     </tr>
     <%
      PreparedStatement pst = con.prepareStatement("select distinct bname from courseinfo");

 ResultSet rs = pst.executeQuery();
      %>
     <tr>
       <td><span class="style29">Branch: </span></td>
       <td><span class="style29">
         <select name="bname">
           <option value="-">-------</option>
           <%
while (rs.next()) {
    %>
           <option value="<%=rs.getString(1)%>"><%=rs.getString(1)%></option>
           <%   }%>
         </select>
       </span> </td>
     </tr>
     <%
      PreparedStatement pst1 = con.prepareStatement("select distinct creg from courseinfo");

 ResultSet rs1 = pst1.executeQuery();
      %>
     <tr>
       <td><span class="style29">Course Regulation: </span></td>
       <td><span class="style29">
         <select name="creg">
           <option value="0">-select-</option>
           <%
while (rs1.next()) {
    %>
           <option value="<%=rs1.getString(1)%>"><%=rs1.getString(1)%></option>
           <%   }%>
         </select>
       </span> </td>
     </tr>

     <tr>
       <td><span class="style29">Year:</span></td>
       <td><span class="style29">
         <select name="year" onChange="dis()">
           <option value="0">-year-</option>
           <option value="I">I</option>
           <option value="II">II</option>
           <option value="III">III</option>
           <option value="IV">IV</option>
         </select>
       </span></td>
     </tr>
     <tr>
       <td><span class="style29">sem: </span></td>
       <td><span class="style29">
         <select name="sem" id="textfield">
           <option value="-" selected="selected">-- -- -- -- -- --</option>
           <option value="1">1</option>
           <option value="2">2</option>
         </select>
       </span></td>
     </tr>
   </table>
   </center>
        <table width="748" height="165" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                      <td height="81" valign="top" background="ch.JPG" bgcolor="#8AB06B"><div align="center">
					   <p>&nbsp;</p>
                       <table width="200" border="0">
                          <tr>
                            <td width="100" align="center" valign="top"><input type="submit" name="Submit" value="Show" /></form></td>
                            <td width="100" align="center"><form action="home.html"><input type="submit" value="Back"></form></td>
                          </tr>
                        </table>
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
<%
pst2.close();
con.close();
%>
</body>
</html>
