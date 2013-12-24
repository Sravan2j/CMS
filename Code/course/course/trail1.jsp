<%@ page import="java.io.*" %>
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
.style25 {
	font-size: 26px;
	color: #666666;
	font-family: "Courier New", Courier, monospace;
}
.style26 {font-size: 20px}
.style27 {
	color: #666666;
	font-size: 18px;
	font-family: "Courier New", Courier, monospace;
}
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
String sn= request.getParameter("subname");
String cn= request.getParameter("cname");
String bn= request.getParameter("bname");
String cr= request.getParameter("creg");
String yr= request.getParameter("year");
String sm= request.getParameter("sem");
if(yr.equalsIgnoreCase("I") && cn.equalsIgnoreCase("B.Tech"))
    {
    sm="-";
    }
PreparedStatement pst1 = con.prepareStatement("select subcode from addsub where cname=? and creg=? and branch=? and year=? and sem=? and subname=?");
 pst1.setString(1, cn);
  pst1.setString(2, cr);
   pst1.setString(3, bn);
   pst1.setString(4, yr);
    pst1.setString(5, sm);
    pst1.setString(6, sn);
    ResultSet rs1 = pst1.executeQuery();
rs1.next();
      PreparedStatement pst = con.prepareStatement("select sfname from file where sname=? ");
 pst.setString(1, rs1.getString(1));
 ResultSet rs = pst.executeQuery();
 if(rs.next())
     {
 %>
    <table width="778" height="404" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="780" height="69" valign="bottom" background="images/header.gif"><div align="center" class="style14">View Syllabus </div></td>
  </tr>
  <tr>
    <td height="201" valign="middle"><table width="764" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td bgcolor="#DADADA"><table width="756" height="203" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="764" bgcolor="#CCCCCC"><table width="749" height="207" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td valign="top" bgcolor="#FFFFFF"><p align="center">&nbsp;</p>

 <center><h3><span class="style25">For Syllabus:</span><a href="syllabus/<%=rs.getString(1)%>" class="style26">click here</a></h3>
 </center>
        <p>&nbsp;</p>
        <table width="748" height="165" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                      <td height="81" valign="top" background="ch.JPG" bgcolor="#8AB06B"><div align="center">
                        <p>
                              <table width="200" border="0">
                          <tr>
                            <td width="100" align="center" valign="top">  <form ACTION="courses.html" >
            <button type="submit">Back to HOME PAGE</button>
                      </form></td>
                            <td width="100" align="center"> <form ACTION="tr.jsp" method="post" >
                   <button type="submit">Back</button> </form></td>
                          </tr>
                        </table>
                          
                        </p>
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
<%}
 else{
 %>
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
   <h3 class="style27">Sorry,Syllabus is not added for this.It will be added soon </h3>
 </center>
        <p>&nbsp;</p>
          <p>&nbsp;</p>
        <table width="748" height="165" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                      <td height="81" valign="top" background="ch.JPG" bgcolor="#8AB06B"><div align="center">
					   <table width="200" border="0">
                         <tr> 
						     <form ACTION="courses.html" method="post" >
                           <td><button type="submit">Back to HOME PAGE</button></td>  </form>
                         <form ACTION="tr.jsp" method="post" >
                           <td><button type="submit">Back</button></td>  </form>
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
 }%>

</body>
</html>