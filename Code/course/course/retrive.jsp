<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
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
	font-size: 20px;
	font-family: "Courier New", Courier, monospace;
	font-weight: bold;
}
.style19 {
	font-size: 20px;
	font-family: "Courier New", Courier, monospace;
	color: #666666;
	font-weight: bold;
}
.style20 {
	color: #5691B1;
	font-weight: bold;
}
.style21 {
	color: #666666;
	font-weight: bold;
}
-->
</style></head>

<body>
<table width="778" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="778" height="69" valign="bottom" background="images/header.gif"><div align="center" class="style14">AVAILABLE COURSES AND BRANCHES IN THE COLLEGE</div></td>
  </tr>
  <tr>
    <td height="201" valign="middle"><table width="764" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td bgcolor="#DADADA"><table width="756" height="203" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="764" bgcolor="#CCCCCC"><table width="749" height="207" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td valign="top" bgcolor="#FFFFFF"><p>&nbsp;</p>
                  <p align="center">
                    <%
     try {

          String driver=application.getInitParameter("driver");
        String url=application.getInitParameter("url");
        String user=application.getInitParameter("user");
        String pswd=application.getInitParameter("pswd");
        Class.forName(driver);
        Connection connection=DriverManager.getConnection(url,user,pswd);
Statement statement = null;
statement = connection.createStatement();
String QueryString9 = "SELECT distinct cname,bname from courseinfo";
ResultSet rs9 =null;
rs9=statement.executeQuery(QueryString9);
if(rs9.next()==true){
%>
</p>
                    <center>
                      <TABLE cellpadding="15" border="0" style="background-color: #ffffff;" align="center" WIDTH="500">
    <TR bgcolor="#D9E7CF">
        <TD><span class="style20">COURSES</span></TD>
        <TD><span class="style20">BRANCHES</span></TD>
            </TR>
    <%
    String QueryString = "SELECT distinct cname,bname from courseinfo where cname='B.Tech'";
ResultSet rs = statement.executeQuery(QueryString);
while (rs.next()) {
    %>
    <TR bgcolor="#D9E7CF">
        <TD><span class="style21"><%=rs.getString(1)%></span></TD>
        <TD><span class="style21"><%=rs.getString(2)%></span></TD>
    </TR>
    <%   }%>
    </TABLE><br>
    <%  String QueryString1 = "SELECT distinct cname,bname from courseinfo where cname='M.C.A'";
rs = statement.executeQuery(QueryString1);
%>
<TABLE cellpadding="15" border="0" style="background-color: #ffffff;" align="center" WIDTH="500">
       <%


    while (rs.next()) {
    %>
    <TR>
        <TD width="199" bgcolor="#D9E7CF"><span class="style21"><%=rs.getString(1)%></span></TD>
        <TD width="229" bgcolor="#D9E7CF"><span class="style21"><%=rs.getString(2)%></span></TD>
            </TR>
    <%   }%>
</TABLE><br>
    <%  String QueryString2 = "SELECT distinct cname,bname from courseinfo where cname='M.B.A'";
rs = statement.executeQuery(QueryString2);
%>
<TABLE cellpadding="15" border="0" style="background-color: #ffffff;" align="center" WIDTH="500">
       <%
while (rs.next()) {
    %>
    <TR>
        <TD width="200" bgcolor="#D9E7CF"><span class="style21"><%=rs.getString(1)%></span></TD>
        <TD width="228" bgcolor="#D9E7CF"><span class="style21"><%=rs.getString(2)%></span></TD>
            </TR>
    <%   }%>
</TABLE><br>
    <%  String QueryString3 = "SELECT distinct cname,bname from courseinfo where cname='M.Tech'";
rs = statement.executeQuery(QueryString3);
%>
<TABLE cellpadding="15" border="0" style="background-color: #ffffff;" align="center" width="500">
       <%
while (rs.next()) {
    %>
    <TR>
        <TD width="201" bgcolor="#D9E7CF"><span class="style21"><%=rs.getString(1)%></span></TD>
        <TD width="227" bgcolor="#D9E7CF"><span class="style21"><%=rs.getString(2)%></span></TD>
                   </TR>
    <%   }%>
</TABLE><br>
  
    </center>
                    <table width="748" height="165" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                      <td height="81" valign="top" background="ch.JPG" bgcolor="#8AB06B"><div align="center">
                        <p>&nbsp;</p>
                        <TABLE align="center">
        <TR>
            <TD><form ACTION="viewc.html" method="post" >
            <button type="submit"><-- back</button>
            </form>
            </TD>
        </TR>
    </TABLE>
                      </div></td>
                    </tr>
                  </table>
      <%}
else{%>
        <span class="style19">Courses are not added or Courses doesnot exists</span>
              
                    <table width="748" height="165" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                      <td height="81" valign="top" background="ch.JPG" bgcolor="#8AB06B"><div align="center">
                        <p>&nbsp;</p>
                        <TABLE align="center">
        <TR>
            <TD><form ACTION="courses.html" method="post" >
            <button type="submit">Back to HOME PAGE</button>
            </form>
            </TD>
        </TR>
    </TABLE>
                      </div></td>
                    </tr>
                  </table>
        <%}
    // close all the connections.
  
    statement.close();
    connection.close();
} catch (Exception ex) {
    %>
      <font size="+3" color="red"><b>
        <%
            out.println("Unable to connect to database."+ex);
        }
        %>
        </b></font>
        </td>
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
