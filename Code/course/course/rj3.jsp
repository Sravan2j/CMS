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
	font-size: 22px;
	font-weight: bold;
}
.style29 {
	font-family: "Courier New", Courier, monospace;
	font-size: 18px;
	color: #666666;
	font-weight: bold;
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
String yr= request.getParameter("year");
Statement st=null;
st=con.createStatement();
PreparedStatement pst3 = con.prepareStatement("select subcode from addsub where (cname=? and branch=? and creg=? and year=?)");
pst3.setString(1, c);
pst3.setString(2, b);
pst3.setString(3, cr);
pst3.setString(4, yr);
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
PreparedStatement pst = con.prepareStatement("DELETE from addsub where (cname=? and branch=? and creg=? and year=?)");
pst.setString(1, c);
pst.setString(2, b);
pst.setString(3, cr);
pst.setString(4, yr);
int num=pst.executeUpdate();
if(num==1)
{
%>
<table width="778" height="404" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="780" height="69" valign="bottom" background="images/header.gif"><div align="center" class="style14">
      <DIV align="center">Deleting a particular Branch for Particular   Year </DIV>
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
                      <h1 class="style20"><span class="style23"><span class="style26">Sucessfully Deleted</span></span></h1>
                    </center>
                    <p align="center" class="style19 style25">&nbsp;</p>
 <%
 PreparedStatement pst1 = con.prepareStatement("select * from addsub where cname=? and branch=? and creg=?");
 pst1.setString(1, c);
 pst1.setString(2, b);
 pst1.setString(3, cr);
 ResultSet rs = pst1.executeQuery();
 try{
 if(rs.next()==false)
 {
   PreparedStatement pst2 = con.prepareStatement("delete from courseinfo where cname=? and bname=? and creg=? ");
   pst2.setString(1, c);
   pst2.setString(2, b);
    pst2.setString(3, cr);
   int num1=pst2.executeUpdate();
      if(num1==1){%>
	<div align="center" class="style29"><%= request.getParameter("cnm")%> Course on Regulation <%= request.getParameter("creg")%> with the branch <%= request.getParameter("bch")%> is also removed from entire database,Since it had removed for every year                    					  </div>
    <span class="style29">
    <%
   }
 pst2.close();
 }
 }
 catch(Exception e){}
 %>
    </span>
    <table width="748" height="165" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                      <td height="81" valign="top" background="ch.JPG" bgcolor="#8AB06B"><div align="center">  <p>&nbsp;</p>
                       <form ACTION="courses.html" method="post" >
            <button type="submit">Back to HOME PAGE</button>
            </form>
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
pst.close();
pst3.close();
con.close();
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
                      <span class="style26 style25"><span class="style25"><%= request.getParameter("cnm")%> Course on regulation <%= request.getParameter("creg")%> with the branch <%= request.getParameter("bch")%> for <%= request.getParameter("year")%> year
doesnot exist in Database                      </span></span>
                    </center>
                    <p align="center" class="style19">&nbsp;</p>
                    <table width="748" height="165" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                      <td height="81" valign="top" background="ch.JPG" bgcolor="#8AB06B"><div align="center">

<TABLE align="center">
        <TR>
            <TD><form ACTION="r3.jsp" method="post" >
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
else{
%>
<center><h2></h2></center>
<%
}

%>
