<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<%@ page import="java.lang.*" %> 
<html>
<head>
<title>Course Management System</title>
<script>function f1(){
if(document.remove3.cnm.value==0)
	{
        alert("please select course");
		return false;
    }
     if((document.remove3.cnm.value=='B.Tech')&(document.remove3.bch.value=='-'))
	{
        alert("please select Branch");
		return false;
    }
     if(document.remove3.creg.value==0)
	{
        alert("please select Course Regulation");
		return false;
    }

 if(document.remove3.year.value==0)
	{
        alert("please select year");
		return false;
    }
var r=confirm("Are you sure,you want to delete?");
    if (r==true)
  {
  return true;
  }
else
  {
   return false;
  }
}</script>

<style type="text/css">
<!--
body {
	background-color: #EBEBEB;
}
.style2 {
	font-size: 18px;
	font-weight: bold;
	color: #5691B1;
	font-family: "Courier New", Courier, monospace;
}
.style10 {color: #666666}
-->
</style></head>

<body>
<%
    String driver=application.getInitParameter("driver");
        String url=application.getInitParameter("url");
        String user=application.getInitParameter("user");
        String pswd=application.getInitParameter("pswd");
        Class.forName(driver);
        Connection con=DriverManager.getConnection(url,user,pswd);
%>
<form name="remove3" method="post" action="rj3.jsp" onSubmit="return f1()">
  <table width="778" height="317" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="780" height="69" valign="bottom" background="images/header.gif"><div align="center"><span class="style2">Deleting a particular Branch for Particular Year </span></div></td>
  </tr>
  <tr>
    <td height="201" valign="middle"><table width="764" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td bgcolor="#DADADA"><table width="756" height="203" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="764" bgcolor="#CCCCCC"><table width="749" height="207" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td valign="top" bgcolor="#FFFFFF"><p>&nbsp;</p>
                    <table width="260" height="79" border="0" align="center" cellpadding="12" cellspacing="0">
                      <%
      PreparedStatement pst2 = con.prepareStatement("select distinct cname from courseinfo");

 ResultSet rs2 = pst2.executeQuery();
      %>
                      <tr>
                        <td><span class="style10">Course: </span></td>
                        <td><span class="style10">
                          <select name="cnm">
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
                        <td><span class="style10">Branch: </span></td>
                        <td><span class="style10">
                          <select name="bch">
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
                        <td><span class="style10">Course Regulation: </span></td>
                        <td><span class="style10">
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
                        <td><span class="style10">Year:</span></td>
                        <td><span class="style10">
                          <select name="year">
                            <option value="0">-select-</option>
                            <option value="I">I</option>
                            <option value="II">II</option>
                            <option value="III">III</option>
                            <option value="IV">IV</option>
                          </select>
                        </span></td>
                      </tr>
                    </table>
                    <table width="748" height="165" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                      <td height="81" valign="top" background="ch.JPG" bgcolor="#8AB06B"><div align="center">
                        <p>&nbsp;                          </p>
                       <table width="200" border="0">
                          <tr>
                            <td width="100" align="center" valign="top">  <input name="Submit" type="submit" id="Submit" value="Delete" /></form></td>
                            <td width="100" align="center"><form action="rmc.html"><input type="submit" value="Back"></form></td>
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
pst1.close();
pst.close();
 con.close();
%>
</body>
</html>
