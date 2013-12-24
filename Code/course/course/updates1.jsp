<%@ page import="java.sql.*" %>
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
.style26 {
	font-size: 22px;
	font-family: "Courier New", Courier, monospace;
	color: #666666;
	font-weight: bold;
}
-->
</style></head>
<body>
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
String yr= request.getParameter("year1");
String sm= request.getParameter("sem1");
String sn= request.getParameter("subname1");
String sc1= request.getParameter("subcode1");
String sbc1= request.getParameter("subc");
String sbc=sbc1.toUpperCase();
String prd1= request.getParameter("period");
String tut1= request.getParameter("tutorial");
String crd1= request.getParameter("credits");
Statement statement = con.createStatement();
int num= statement.executeUpdate("update addsub set subcode='"+sbc+"' where cname='"+c+"' and branch='"+b+"' and creg='"+crg1+"' and year='"+yr+"' and sem='"+sm+"' and subname='"+sn+"';");
Statement statement4 = con.createStatement();
int num4= statement4.executeUpdate("update file set sname='"+sbc+"' where sname='"+sc1+"';");
Statement statement1 = con.createStatement();
int num1= statement1.executeUpdate("update addsub set prd="+prd1+" where cname='"+c+"' and branch='"+b+"' and creg='"+crg1+"' and year='"+yr+"' and sem='"+sm+"' and subname='"+sn+"';");
Statement statement2 = con.createStatement();
int num2= statement2.executeUpdate("update addsub set tut="+tut1+" where cname='"+c+"' and branch='"+b+"' and creg='"+crg1+"' and year='"+yr+"' and sem='"+sm+"' and subname='"+sn+"';");
Statement statement3 = con.createStatement();
int num3= statement3.executeUpdate("update addsub set crd="+crd1+" where cname='"+c+"' and branch='"+b+"' and creg='"+crg1+"' and year='"+yr+"' and sem='"+sm+"' and subname='"+sn+"';");
 if((c.equalsIgnoreCase("B.Tech") && yr.equalsIgnoreCase("IV"))|| (c.equalsIgnoreCase("M.Tech"))||(c.equalsIgnoreCase("M.B.A"))||(c.equalsIgnoreCase("M.C.A")))
  {
String typ= request.getParameter("typ");
Statement statement5 = con.createStatement();
int num5= statement5.executeUpdate("update addsub set type='"+typ+"' where cname='"+c+"' and branch='"+b+"' and creg='"+crg1+"' and year='"+yr+"' and sem='"+sm+"' and subname='"+sn+"';");
}
statement.close();
statement1.close();
statement2.close();
statement3.close();
statement4.close();
con.close();
%>
<table width="778" height="404" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="780" height="69" valign="bottom" background="images/header.gif"><div align="center" class="style14">Subject Updation </div></td>
  </tr>
  <tr>
    <td height="201" valign="middle"><table width="764" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td bgcolor="#DADADA"><table width="756" height="203" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="764" bgcolor="#CCCCCC"><table width="749" height="207" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td valign="top" bgcolor="#FFFFFF"><p align="center">&nbsp;</p>
                    <p align="center"><span class="style26">UPDATED SUCCESSFULLY</span></p>
                    <center></center>
                    <TABLE align="center" cellpadding="10">
                      <TR>
                        <TD><form ACTION="updatec1.html" method="post" >
                            <button type="submit"><-- back</button>
                                 
                        </form></TD>
                        <TD><form ACTION="ac3.html" method="post" >
                            <button type="submit">TO UPDATE SYLLABUS</button>
                        </form></TD>
                      </TR>
                    </TABLE>
                    <table width="748" height="165" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                      <td height="81" valign="top" background="ch.JPG" bgcolor="#8AB06B"><div align="center">
                        <p>&nbsp;</p>
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
<%
}
catch(Exception ex){
    %>
    <center><h3>Sorry,The Values are not Updated.Because only Integer Values Should be Entered in periods,tutorials,credits fields.
</h3></center>
    <%}
%>
</body>
</html>