<%@ page import="java.sql.*" %>

<%
try{
String driver=application.getInitParameter("driver");
        String url=application.getInitParameter("url");
        String user=application.getInitParameter("user");
        String pswd=application.getInitParameter("pswd");
        Class.forName(driver);
        Connection con=DriverManager.getConnection(url,user,pswd);
String c= request.getParameter("cname1");
String b= request.getParameter("bname1");
String crg1= request.getParameter("creg1");
String crg2= request.getParameter("creg");
String crg=crg2.toUpperCase();
String yr= request.getParameter("year");
String seat= request.getParameter("seats");
Statement statement = con.createStatement();
int num= statement.executeUpdate("update courseinfo set creg='"+crg+"' where cname='"+c+"' and bname='"+b+"' and creg='"+crg1+"';");
Statement statement3 = con.createStatement();
int num3= statement3.executeUpdate("update addsub set creg='"+crg+"' where cname='"+c+"' and branch='"+b+"' and creg='"+crg1+"';");
Statement statement1 = con.createStatement();
int num1= statement1.executeUpdate("update courseinfo set year="+yr+" where cname='"+c+"' and bname='"+b+"' and creg='"+crg1+"';");
Statement statement2 = con.createStatement();
int num2= statement2.executeUpdate("update courseinfo set seats="+seat+" where cname='"+c+"' and bname='"+b+"' and creg='"+crg1+"';");
statement.close();
statement1.close();
statement2.close();
statement3.close();
con.close();
%>
<html>
<head>
<title>Course Management System</title>
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
.style19 {color: #666666; font-family: "Times New Roman", Times, serif; font-size: 26px;}
-->
</style></head>

<body>
<table width="778" height="404" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="780" height="69" valign="bottom" background="images/header.gif"><div align="center" class="style14">Branch Updation </div></td>
  </tr>
  <tr>
    <td height="201" valign="middle"><table width="764" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td bgcolor="#DADADA"><table width="756" height="203" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="764" bgcolor="#CCCCCC"><table width="749" height="207" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td valign="top" bgcolor="#FFFFFF"><p align="center">&nbsp;</p>
                    <p align="center" class="style19">Updated Successfully </p>
                    <p align="center">&nbsp;</p>
                    <table width="748" height="165" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                      <td height="81" valign="top" background="ch.JPG" bgcolor="#8AB06B"><div align="center">
                        <p>&nbsp;</p>
                        <TABLE align="center">
                          <TR>
                            <TD><form ACTION="updatec1.html" method="post" >
                                <button type="submit"><-- back</button>
                            </form></TD>
                          </TR>
                        </TABLE>
                        <p>&nbsp;</p>
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
</body>
</html>


<%
}
catch(Exception ex){
    %>
    <center><h3>Sorry,The Values are not Updated.Because Only Integer Values Should be Entered in Seats and Year fields.
    </h3></center>
    <%}
%>
       