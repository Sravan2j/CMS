
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
.style19 {color: #666666; font-family: "Times New Roman", Times, serif; font-size: 28px;}
.style20 {
	font-family: "Courier New", Courier, monospace;
	font-size: 18px;
	color: #666666;
}
.style30 {color: #666666; font-weight: bold; }
.style32 {font-family: "Courier New", Courier, monospace; font-size: 18px; color: #81A068; }
.style36 {color: #666666; font-weight: bold; font-family: "Courier New", Courier, monospace; font-size: 17px; }
-->
</style>
</head>
<script>
    function fun()
    {
        window.alert("Sorry,Syllabus is not added.It will be added soon");
    }
    </script>
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
String yr= request.getParameter("year");
String sm= request.getParameter("sem");
if(yr.equalsIgnoreCase("I") && c.equalsIgnoreCase("B.Tech"))
    {
    sm="-";
    }
PreparedStatement pst = con.prepareStatement("select subname,subcode,prd,tut,crd,type from addsub where cname=? and branch=? and creg=? and year=? and sem=?");
 pst.setString(1, c);
 pst.setString(2, b);
 pst.setString(3, cr);
  pst.setString(4, yr);
 pst.setString(5, sm);
 ResultSet rs1 = pst.executeQuery();
if(rs1.next()==false)
    {%>
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
                    <center>
                      <h1 class="style20">SORRY,SUBJECTS ARE NOT ADDED FOR THIS. THEY WILL BE ADDED SOON</h1>
                    </center>
                    <p align="center" class="style19">&nbsp;</p>
                    <table width="748" height="165" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                      <td height="81" valign="top" background="ch.JPG" bgcolor="#8AB06B"><div align="center">
                        <table width="200" border="0" cellpadding="15">
                          <tr>
                            <td><TABLE align="center">
                              <TR>
                                <TD><form ACTION="v3.jsp" method="post" >
                                    <button type="submit"><-- back</button>
                                </form></TD>
                              </TR>
                            </TABLE></td>
                            <td><form ACTION="courses.html" method="post" >
                                    <button type="submit">Back to HOME PAGE</button>
                                </form></td>
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
    }
 else{
 %>
 <table width="778" height="404" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="780" height="69" valign="bottom" background="images/header.gif"><div align="center" class="style14">Available Subjects </div></td>
  </tr>
  <tr>
    <td height="201" valign="middle"><table width="764" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td bgcolor="#DADADA"><table width="756" height="203" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="764" bgcolor="#CCCCCC"><table width="749" height="207" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td valign="top" bgcolor="#FFFFFF"><p align="center">&nbsp;</p>
                    <center>
                      <h1 class="style32">Subjects for <%=c%>,<%=b%> <%=yr%> year - <%=sm%> sem </h1>
                    </center>
                    <TABLE cellpadding="15" border="0" style="background-color: #ffffff;" align="center">
                      <TR bgcolor="#D9E7CF">
                        <TD><span class="style36">SUBJECT</span></TD>
                        <TD><span class="style36">SUBJECT CODE</span></TD>
                        <TD><span class="style36">PERIODS</span></TD>
                        <TD><span class="style36">TUTORIALS</span></TD>
                        <TD><span class="style36">CREDITS</span></TD>
                        <%
                        if((c.equalsIgnoreCase("B.Tech") && yr.equalsIgnoreCase("IV"))|| (c.equalsIgnoreCase("M.Tech"))||(c.equalsIgnoreCase("M.B.A"))||(c.equalsIgnoreCase("M.C.A")))
                            {%>
                           <TD><span class="style36">TYPE</span></TD> 
                       <% }
                        %>
                     </TR>
                      <%
    ResultSet rs = pst.executeQuery();
       while (rs.next()) {
            PreparedStatement ps = con.prepareStatement("select sfname from file where sname=?");
   ps.setString(1, rs.getString(2));
   ResultSet r = ps.executeQuery();
   if(r.next())
       {
    %>
                      <TR bgcolor="#D9E7CF">
                        <TD><span class="style30"><a href="syllabus/<%=r.getString(1)%>"><%=rs.getString(1)%></a></span></TD>
                        <TD><span class="style30"><%=rs.getString(2)%></span></TD>
                        <TD><span class="style30"><%=rs.getInt(3)%></span></TD>
                        <TD><span class="style30"><%=rs.getInt(4)%> </span></TD>
                        <TD><span class="style30"><%=rs.getInt(5)%></span></TD>
                     <%
                        if((c.equalsIgnoreCase("B.Tech") && yr.equalsIgnoreCase("IV"))|| (c.equalsIgnoreCase("M.Tech"))||(c.equalsIgnoreCase("M.B.A"))||(c.equalsIgnoreCase("M.C.A")))
                            {%>
                           <TD><span class="style30"><%=rs.getString(6)%></span></TD> 
                       <% }
                        %>
                     </TR>
                      <%   }
    else{
    %>
     <TR bgcolor="#D9E7CF">
                        <TD><span class="style30"><a href="#"><p onClick="fun()"><%=rs.getString(1)%></p></a></span></TD>
                        <TD><span class="style30"><%=rs.getString(2)%></span></TD>
                        <TD><span class="style30"><%=rs.getInt(3)%></span></TD>
                        <TD><span class="style30"><%=rs.getInt(4)%> </span></TD>
                        <TD><span class="style30"><%=rs.getInt(5)%></span></TD>
                      <%
                        if((c.equalsIgnoreCase("B.Tech") && yr.equalsIgnoreCase("IV"))|| (c.equalsIgnoreCase("M.Tech"))||(c.equalsIgnoreCase("M.B.A"))||(c.equalsIgnoreCase("M.C.A")))
                            {%>
                           <TD><span class="style30"><%=rs.getString(6)%></span></TD> 
                       <% }
                        %>
                     </TR>
                      <%   }}

   %>
                        </TABLE> 
                    <table width="748" height="165" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                      <td height="81" valign="top" background="ch.JPG" bgcolor="#8AB06B"><div align="center">
                      
                       <%
                        if((c.equalsIgnoreCase("B.Tech") && yr.equalsIgnoreCase("IV"))|| (c.equalsIgnoreCase("M.Tech"))||(c.equalsIgnoreCase("M.B.A"))||(c.equalsIgnoreCase("M.C.A")))
                            {%>
                          <h1 class="style36"> R-Regular ; E-Electives</h1>
                       <% }
                        %>
                         <p>&nbsp;</p>
<TABLE align="center">
                          <TR>
                            <TD><form ACTION="viewc.html" method="post" >
                                <button type="submit"><-- back</button>
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
pst.close();
 con.close();

} catch (Exception ex) {
    %>
                      <font size="+3" color="red"><b>
                      <%
            out.println("Unable to connect to database.");
        }
        %>
                        </b></font>
</body>
</html>