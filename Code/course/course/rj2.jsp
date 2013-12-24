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
.style25 {font-size: 22px}
.style26 {
	font-family: "Courier New", Courier, monospace;
	color: #666666;
	font-size: 18px;
	font-weight: bold;
}
.style28 {
	font-family: "Courier New", Courier, monospace;
	font-weight: bold;
	color: #666666;
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
String c= request.getParameter("cnm");
String b= request.getParameter("bch");
String cr= request.getParameter("creg");
ResultSet rs=null;
Statement st=null;
st=con.createStatement();
PreparedStatement pst3 = con.prepareStatement("select subcode from addsub where (cname=? and branch=? and creg=?)");
pst3.setString(1, c);
pst3.setString(2, b);
pst3.setString(3, cr);
ResultSet rs1 = pst3.executeQuery();
while(rs1.next())
    {
     PreparedStatement pst5 = con.prepareStatement("select sfname from file where sname=? ");
  pst5.setString(1,rs1.getString(1));
 ResultSet rs2 = pst5.executeQuery();
 while(rs2.next()){
  String pth=application.getInitParameter("path");
 File file=new File(pth+rs2.getString(1));
file.delete();
 }
    PreparedStatement pst4 = con.prepareStatement("delete from file where sname=? ");
    pst4.setString(1, rs1.getString(1));
    int num2=pst4.executeUpdate();

}
PreparedStatement pst = con.prepareStatement("DELETE from courseinfo where cname=? and bname=? and creg=?");
pst.setString(1, c);
pst.setString(2, b);
pst.setString(3, cr);
int num=pst.executeUpdate();
PreparedStatement pst1 = con.prepareStatement("DELETE from addsub where cname=? and branch=? and creg=?");
pst1.setString(1, c);
pst1.setString(2, b);
pst1.setString(3, cr);
int num1=pst1.executeUpdate();
pst.close();
pst1.close();
pst3.close();
con.close();
if(num==1)
{
%>
<table width="778" height="404" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="780" height="69" valign="bottom" background="images/header.gif"><div align="center" class="style14">
      <DIV align="center">Deleting a particular Branch</DIV>
    </div></td>
  </tr>
  <tr>
    <td height="201" valign="middle"><table width="764" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td bgcolor="#DADADA"><table width="756" height="203" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="764" bgcolor="#CCCCCC"><table width="749" height="207" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td valign="top" bgcolor="#FFFFFF"><p align="center">&nbsp;</p>
                    <p align="center" class="style25 style28">Sucessfully Deleted</p>
                    <center>
                      <h1 class="style20">&nbsp;</h1>
                    </center>
                    <table width="748" height="165" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                      <td height="81" valign="top" background="ch.JPG" bgcolor="#8AB06B"><div align="center">
                       <form ACTION="courses.html" method="post" >
            <button type="submit">Back to HOME PAGE</button>
            </form>
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
%>
<%
if(num==0)
{
%>

       <table width="778" height="404" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="780" height="69" valign="bottom" background="images/header.gif"><div align="center" class="style14">
      <DIV align="center"></DIV>
    </div></td>
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
                      <p class="style25">&nbsp;</p>
                      <span class="style26 style25"><span class="style25"><%= request.getParameter("cnm")%> Course on Regulation <%= request.getParameter("creg")%> with the branch <%= request.getParameter("bch")%>
doesnot exist in Database                      </span></span>
                    </center>
                    <p align="center" class="style19">&nbsp;</p>
                    <table width="748" height="165" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                      <td height="81" valign="top" background="ch.JPG" bgcolor="#8AB06B"><div align="center">

<TABLE align="center">
        <TR>
            <TD><form ACTION="r2.jsp" method="post" >
            <button type="submit">Back </button>      
            </form>            </TD>
<center>
           <TD><form ACTION="courses.html" method="post" >
            <button type="submit">Back to HOME PAGE</button>
            </form>                       </TD></center>
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
</body>
</html>

<%
}
%>
