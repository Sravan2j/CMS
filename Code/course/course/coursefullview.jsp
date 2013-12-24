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
	font-size: 22px;
	font-family: "Courier New", Courier, monospace;
	font-weight: bold;
}
.style31 {font-size: 18px}
.style33 {
	font-size: 22.5px;
	font-family: "Courier New", Courier, monospace;
	font-weight: bold;
	color: #666666;
}
.style36 {font-weight: bold}
.style37 {color: #5691B1; font-weight: bold; }
.style47 {font-size: 25px}
.style49 {font-size: 16px; font-weight: bold; color: #666666; }
-->
    </style></head>

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
PreparedStatement pst9 = con.prepareStatement("select * from courseinfo");
ResultSet rs9 = pst9.executeQuery();
if(rs9.next()){
    %>
<table width="778" height="404" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="778" height="69" valign="bottom" background="images/header.gif"><div align="center" class="style14 style31">AVAILABLE COURSES WITH COMPLETE INFORMATION</div></td>
  </tr>
  <tr>
    <td height="201" valign="middle"><table width="764" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td bgcolor="#DADADA"><table width="756" height="203" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="764" bgcolor="#CCCCCC"><table width="749" height="207" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td valign="top" bgcolor="#FFFFFF">
                      <p>&nbsp;</p>
                      <TABLE cellpadding="15" border="0" style="background-color: #ffffff;" align="center" WIDTH="500">
                    <TR bgcolor="#D9E7CF"><TD><span class="style37">COURSES</span></TD>
                      <TD><span class="style37">BRANCHES</span></TD>
                      <TD><span class="style37">REGULATION</span></TD>
                      <TD><span class="style37">YEAR</span></TD>
                      <TD><span class="style37">SEATS</span></TD>
                    </TR>
                    <%
PreparedStatement pst1 = con.prepareStatement("select distinct creg from courseinfo");
ResultSet rs1 = pst1.executeQuery();
while(rs1.next())    {
PreparedStatement pst = con.prepareStatement("select * from courseinfo where cname='B.Tech' and creg=?");
 pst.setString(1, rs1.getString(1));
ResultSet rs = pst.executeQuery();
  while (rs.next()) {
    %>
                    <TR bgcolor="#D9E7CF">
                      <TD><span class="style49"><%=rs.getString(1)%></span></TD>
                      <TD><span class="style49"><%=rs.getString(2)%></span></TD>
                      <TD><span class="style49"><%=rs.getString(3)%></span></TD>
                      <TD><span class="style49"><%=rs.getInt(4)%></span></TD>
                      <TD><span class="style49"><%=rs.getInt(5)%></span></TD>
                    </TR>
                                    <%   }
}%>
 </TABLE><br>
<%
PreparedStatement pst2 = con.prepareStatement("select distinct creg from courseinfo");
ResultSet rs2 = pst2.executeQuery();
while(rs2.next())
    {
    PreparedStatement pst = con.prepareStatement("select * from courseinfo where cname='M.C.A' and creg=?");
 pst.setString(1, rs2.getString(1));
ResultSet rs = pst.executeQuery();
%>

                    <TABLE cellpadding="15" border="0" style="background-color: #ffffff;" align="center" WIDTH="534">
                      <%
    while (rs.next()) {
    %>
                      <TR bgcolor="#D9E7CF">
                        <TD width="74" bgcolor="#D9E7CF"><span class="style49"><%=rs.getString(1)%></span></TD>
                        <TD width="88" bgcolor="#D9E7CF"><span class="style49"><%=rs.getString(2)%></span></TD>
                        <TD width="106" bgcolor="#D9E7CF"><span class="style49"><%=rs.getString(3)%></span></TD>
                        <TD width="43" bgcolor="#D9E7CF"><span class="style49"><%=rs.getInt(4)%></span></TD>
                        <TD width="49" bgcolor="#D9E7CF"><span class="style49"><%=rs.getInt(5)%></span></TD>
                      </TR>
                                           <%   }
}
%>
 </TABLE><br>
<%
PreparedStatement pst3 = con.prepareStatement("select distinct creg from courseinfo");
ResultSet rs3 = pst3.executeQuery();
while(rs3.next())
    {
    PreparedStatement pst = con.prepareStatement("select * from courseinfo where cname='M.B.A' and creg=?");
 pst.setString(1, rs3.getString(1));
ResultSet rs = pst.executeQuery();
%>

                    <TABLE cellpadding="15" border="0" style="background-color: #ffffff;" align="center" WIDTH="534">
                      <%
while (rs.next()) {
    %>
                      <TR>
                        <TD width="74" bgcolor="#D9E7CF"><span class="style49"><%=rs.getString(1)%></span></TD>
                        <TD width="88" bgcolor="#D9E7CF"><span class="style49"><%=rs.getString(2)%></span></TD>
                        <TD width="106" bgcolor="#D9E7CF"><span class="style49"><%=rs.getString(3)%></span></TD>
                        <TD width="43" bgcolor="#D9E7CF"><span class="style49"><%=rs.getInt(4)%></span></TD>
                        <TD width="49" bgcolor="#D9E7CF"><span class="style49"><%=rs.getInt(5)%></span></TD>
                      </TR>
                                            <%   }}
%>
   </TABLE><br>
<%
PreparedStatement pst4 = con.prepareStatement("select distinct creg from courseinfo");
ResultSet rs4 = pst4.executeQuery();
while(rs4.next())
    {
   PreparedStatement pst = con.prepareStatement("select * from courseinfo where cname='M.Tech' and creg=?");
 pst.setString(1, rs4.getString(1));
ResultSet rs = pst.executeQuery();
%>

                    <TABLE cellpadding="15" border="0" style="background-color: #ffffff;" align="center" width="534">
                      <%
while (rs.next()) {
    %>
                      <TR>
                        <TD width="74" bgcolor="#D9E7CF"><span class="style49"><%=rs.getString(1)%></span></TD>
                        <TD width="87" bgcolor="#D9E7CF"><span class="style49"><%=rs.getString(2)%></span></TD>
                        <TD width="107" bgcolor="#D9E7CF"><span class="style49"><%=rs.getString(3)%></span></TD>
                        <TD width="43" bgcolor="#D9E7CF"><span class="style49"><%=rs.getInt(4)%></span></TD>
                        <TD width="49" bgcolor="#D9E7CF"><span class="style49"><%=rs.getInt(5)%></span></TD>
                      </TR>

                      <%  } }%>
                    </TABLE><br>
                    <table width="748" height="165" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                      <td height="81" valign="top" background="ch.JPG" bgcolor="#8AB06B"><div align="center">
                        <p>&nbsp;</p>
                        <TABLE align="center">
                          <TR>
                            <TD><form ACTION="home.html" method="post" >
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
<%
}
else{
    %>
	<table width="778" height="404" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="780" height="69" valign="bottom" background="images/header.gif"><div align="center" class="style14 style31"></div></td>
  </tr>
  <tr>
    <td height="201" valign="middle"><table width="764" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td bgcolor="#DADADA"><table width="756" height="203" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="764" bgcolor="#CCCCCC"><table width="749" height="207" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td valign="top" bgcolor="#FFFFFF"><p>&nbsp;</p>
                    <div align="center" class="style36">
                      <p class="style33">Course details are not added <span class="style47">or</span> Courses doesnot exists                    </p>
                      <p>&nbsp;</p>
                    </div>
                    <table width="748" height="165" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                      <td height="81" valign="top" background="ch.JPG" bgcolor="#8AB06B"><div align="center">
                        <p>&nbsp;</p>
                        <TABLE align="center">
                          <TR>
                            <TD><form ACTION="home.html" method="post" >
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
<%
}
pst9.close();
      con.close();
     }catch (Exception ex) {
    %>
        <font size="+3" color="red"><b>
        <%
            out.println("Unable to connect to database."+ex);
        }

        %></b></font>

</body>
    </html>