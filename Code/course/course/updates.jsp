<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<%@ page import="java.lang.*" %> 
<html>
   <head>
<title>Course Management System</title>
<script>
   function fun(){
        var d=document.up.subc.value;
       document.up.subc.value=d.toUpperCase();
     var d=document.up.typ.value;
       document.up.typ.value=d.toUpperCase();
 }

   function f1(){
if(document.up.subc.value==0)
	{
        alert("please enter subject code");
		return false;
    }
     
	if(document.up.period.value==0)
	{
        alert("please enter No. of Periods");
		return false;
    }
       if(isNaN(document.up.period.value))
       {alert("periods should be number");
       return false;
   }
    if((document.up.tutorial.value==0))
	{
        alert("please enter No. of Tutorials");
		return false;
    }
      if(isNaN(document.up.tutorial.value))
       {alert("Tutorials should be number");
       return false;
   }
 if(document.up.credits.value==0)
        {
        alert("Please enter No. of Credits");
		return false;
		}
          if(isNaN(document.up.credits.value))
       {alert("Credits should be number");
       return false;
   }
       
  return true;
}</script>
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
.style17 {font-size: 18px}
.style18 {
	font-size: 22px;
	font-family: "Courier New", Courier, monospace;
	color: #666666;
}
.style19 {font-size: 22px}
.style20 {font-family: "Courier New", Courier, monospace}
.style21 {color: #666666}
-->
</style>
</head>
<body>
    <form name="update1" method="post" action="updates.jsp" onSubmit="return f1()">

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
String sn1= request.getParameter("subname");
String sn=sn1.toUpperCase();
PreparedStatement pst = con.prepareStatement("select subcode,prd,tut,crd,type from addsub where cname=? and branch=? and creg=? and year=? and sem=? and subname=?");
 pst.setString(1, c);
 pst.setString(2, b);
 pst.setString(3, cr);
 pst.setString(4, yr);
 pst.setString(5, sm);
  pst.setString(6, sn);

 ResultSet rs1 = pst.executeQuery();
%>
<form ACTION="courses.html" method="post" >
                        <input type="hidden" name="hiddenField">
                          </form>
<form ACTION="updates1.jsp" method="post" name="up" onSubmit="return f1()">
  <%
if(rs1.next()){
    %>
	<table width="778" height="404" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="780" height="69" valign="bottom" background="images/header.gif"><div align="center" class="style14 style17"> To Update:Remove Existing and Replace the Text Field with New</div></td>
  </tr>
  <tr>
    <td height="201" valign="middle">
        <table width="764" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td bgcolor="#DADADA"><table width="756" height="203" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="764" bgcolor="#CCCCCC"><table width="749" height="207" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td valign="top" bgcolor="#FFFFFF">
   <p>
     <%
    ResultSet rs = pst.executeQuery();
while (rs.next()) {

    %>
       <input type="hidden" name="cname1" value="<%=c%>"/>
       <input type="hidden" name="bname1" value="<%=b%>"/>
       <input type="hidden" name="creg1" value="<%=cr%>"/>
       <input type="hidden" name="year1" value="<%=yr%>"/>
       <input type="hidden" name="sem1" value="<%=sm%>"/>
       <input type="hidden" name="subname1" value="<%=sn%>"/>
       <input type="hidden" name="subcode1" value="<%=rs.getString(1)%>"/>
   </p>
   <p>&nbsp;</p>
   <table width="399" border="0" align="center" cellpadding="10">
  <tr>
    <td width="171"><span class="style21">Subject Code:</span></td>
    <td width="182"><input name="subc" type="text" class="style21" value="<%=rs.getString(1)%>" size="10" onKeyUp="fun()"/></td>
  </tr>
  <tr>
    <td><span class="style21">No. Of Periods Per Week: </span></td>
    <td><input name="period" type="text" class="style21" value="<%=rs.getString(2)%>" size="10"/></td>
  </tr>
  <tr>
    <td><span class="style21">No. Of Tutorials Per Week: </span></td>
    <td><input name="tutorial" type="text" class="style21" value="<%=rs.getString(3)%>" size="10"/></td>
  </tr>
  <tr>
    <td><span class="style21">No. Of Credits: </span></td>
    <td><input name="credits" type="text" class="style21" value="<%=rs.getString(4)%>" size="10"/></td>
  </tr>
  <%
  if((c.equalsIgnoreCase("B.Tech") && yr.equalsIgnoreCase("IV"))|| (c.equalsIgnoreCase("M.Tech"))||(c.equalsIgnoreCase("M.B.A"))||(c.equalsIgnoreCase("M.C.A")))
  {%>
                         <tr>
    <td valign="top"><span class="style21">Type: </span></td>
    <td><input name="typ" type="text" class="style21" value="<%=rs.getString(5)%>" size="10" onKeyUp="fun()"/>
      <span class="style21">(ex:R=Regular,E1=ElectiveI )</span></td>
    </tr>
                         
 <% }
 %>

</table>
   
<table align="center" cellpadding="10">
<tr><td valign="top"> <button type="submit">Update</button></td>
</form>
<form ACTION="updates2.jsp" method="post" >
<td>
    <button type="submit">Cancel</button></form>
</td>
</tr>
</table>



 <%
}
}
else
    {
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
                      <h1 class="style20 style25 style18">Selected Course or Subject doesnot Exists.</h1>
                      <span class="style27 style19 style20 style21"><strong>To Create Course</strong>:</span><a href="addc.html">Click Here</a>
                    </center>
                    <p align="center" class="style19">&nbsp;</p>


<%   }
 pst.close();
con.close();
 }

   catch (Exception ex) {out.println(ex);}
     %>
 <table width="748" height="165" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                      <td height="81" valign="top" background="ch.JPG" bgcolor="#8AB06B"><div align="center">
                          <form ACTION="courses.html" method="post" >
                        <input type="hidden" name="hiddenField">
                          </form>
                        <TABLE align="center" cellpadding="10">
        <TR>
            <TD>
                <form ACTION="updates2.jsp" method="post" >
            <button type="submit">Back</button></form>
            </TD>
        
            <TD valign="top"><form ACTION="courses.html" method="post" >
              <button type="submit">Back to HOME PAGE</button>
            </form>
            </TD>
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
</form>
</body>
</html>
