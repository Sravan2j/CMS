
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 

<html><head>
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
.style30 {color: #666666; font-weight: bold; }
.style31 {font-family: "Courier New", Courier, monospace; font-size: 19px; color: #666666; }
.style87 {font-size: 18px}
.style89 {font-family: "Courier New", Courier, monospace; color: #81A068; }
.style91 {color: #666666; font-weight: bold; font-size: 17px; font-family: "Courier New", Courier, monospace; }
-->
</style></head>
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
                      <h1 class="style31">SORRY,SUBJECTS ARE NOT ADDED FOR THIS. THEY WILL BE ADDED SOON</h1>
                    </center>
                    <p align="center" class="style19">&nbsp;</p>
                    <table width="748" height="165" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                      <td height="81" valign="top" background="ch.JPG" bgcolor="#8AB06B"><div align="center">
                        <table width="200" border="0" cellpadding="15">
                          <tr>
                            <td><TABLE width="69" align="center">
                              <TR>
                                <TD width="49"><form ACTION="subview.jsp" method="post" >
                                    <button type="submit"><--back</button>
                                </form></TD>
                              </TR>
                            </TABLE></td>
                            <td><form ACTION="home.html" method="post" >
                                    <button type="submit">HOME</button>
                                </form></td>
                          </tr>
                        </table>
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
                      <h1><span class="style89"><span class="style87">Subjects for <%=c%>,<%=b%> <%=yr%> year - <%=sm%> sem</span></span> </h1>
                    </center>
                    <TABLE cellpadding="15" border="0" style="background-color: #ffffff;" align="center">
                      <TR  bgcolor="#D9E7CF">
                        <TD><span class="style91">SUBJECT</span></TD>
                        <TD><span class="style91">SUBJECT CODE</span></TD>
                        <TD><span class="style91">PERIODS</span></TD>
                        <TD><span class="style91">TUTORIALS</span></TD>
                        <TD><span class="style91">CREDITS</span></TD>
                       <%
                        if((c.equalsIgnoreCase("B.Tech") && yr.equalsIgnoreCase("IV"))|| (c.equalsIgnoreCase("M.Tech"))||(c.equalsIgnoreCase("M.B.A"))||(c.equalsIgnoreCase("M.C.A")))
                            {%>
                           <TD><span class="style91">TYPE</span></TD>
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
                        <TD ><span class="style30"><a href="#"><p onClick="fun()"><%=rs.getString(1)%></p></a></span></TD>
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
                          <h1 class="style31"> R-Regular ; E-Electives</h1>
                       <% }
                        %>
                        
                        <TABLE align="center" cellpadding="20">
                          <TR>
                            <TD><form ACTION="subview.jsp" method="post" >
                                <button type="submit"><-- back</button>
                            </form></TD>
                            <TD><form ACTION="home.html" method="post" >
                                <button type="submit">Home</button>
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
            out.println("Unable to connect to database."+ex);
        }
        %>
                        </b></font>
</body>
</html>