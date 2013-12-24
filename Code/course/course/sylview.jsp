<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<%@ page import="java.lang.*" %> 
<html>
<head>
<title>Course Management System</title>
<script>function f1(){
if(document.syv1.cname.value==0)
	{
        alert("please select course");
		return false;
    }
     if((document.syv1.cname.value=='B.Tech')&(document.syv1.bname.value=='-'))
	{
        alert("please select Branch");
		return false;
    }
    if(document.syv1.creg.value==0)
	{
        alert("please select Course Regulation");
		return false;
    }
if(document.syv1.year.value==0)
	{
        alert("please select year");
		return false;
    }
       if((document.syv1.cname.value!='B.Tech')||(document.syv1.year.value!='I')|(document.syv1.sem.value!='-'))
	{
        if(document.syv1.sem.value=='-'){
	 alert("please select sem");
		return false;}
    }
 if(document.syv1.subname.value=="-")
	{
        alert("please select Subject");
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
.style1 {	font-size: 22px;
	font-weight: bold;
}
.style25 {color: #666666}
-->
</style></head>

<body>

    <form name="syv1" method="post" action="sylview2.jsp" onSubmit="return f1()">
<table width="778" height="404" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="780" height="69" valign="bottom" background="images/header.gif"><div align="center" class="style14"><span class="style1">Select Options To View Syllabus</span></div></td>
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
                      <table width="312" border="0" align="center" cellpadding="12" cellspacing="0">
                        <%

     String driver=application.getInitParameter("driver");
        String url=application.getInitParameter("url");
        String user=application.getInitParameter("user");
        String pswd=application.getInitParameter("pswd");
        Class.forName(driver);
        Connection con=DriverManager.getConnection(url,user,pswd);

    PreparedStatement pst2 = con.prepareStatement("select distinct cname from courseinfo");
ResultSet rs2 = pst2.executeQuery();
      %>
                        <tr>
                          <td><span class="style25">Course: </span></td>
                          <td><span class="style25">
                            <select name="cname" id="cname" onChange="popu();">
                              <option value="0">-select-</option>
                              <%
while (rs2.next()) {
    %>
                              <option value="<%=rs2.getString(1)%>"><%=rs2.getString(1)%></option>
                              <%   }%>
                            </select>
                          </span> </td>
                        </tr>
                        <%
      PreparedStatement pst = con.prepareStatement("select distinct bname from courseinfo");

 ResultSet rs = pst.executeQuery();
      %>
                        <tr>
                          <td><span class="style25">Branch: </span></td>
                          <td><span class="style25">
                            <select name="bname" id="bname" onChange="popu();">
                              <option value="-">-------</option>
                              <%
while (rs.next()) {
    %>
                              <option value="<%=rs.getString(1)%>"><%=rs.getString(1)%></option>
                              <%   }%>
                            </select>
                          </span> </td>
                        </tr>
                        <%
      PreparedStatement pst1 = con.prepareStatement("select distinct creg from courseinfo");

 ResultSet rs1 = pst1.executeQuery();
      %>
                        <tr>
                          <td><span class="style25">Course Regulation: </span></td>
                          <td><span class="style25">
                            <select name="creg" id="creg" onChange="popu();">
                              <option value="0">-select-</option>
                              <%
while (rs1.next()) {
    %>
                              <option value="<%=rs1.getString(1)%>"><%=rs1.getString(1)%></option>
                              <%   }%>
                            </select>
                          </span> </td>
                        </tr>


                        <tr>
                          <td><span class="style25">Year:</span></td>
                          <td><span class="style25">
                            <select name="year"  id="year" onChange="popu();">
                              <option value="0">-year-</option>
                              <option value="I">I</option>
                              <option value="II">II</option>
                              <option value="III">III</option>
                              <option value="IV">IV</option>
                            </select>
                          </span></td>
                        </tr>
                        <tr>
                          <td><span class="style25">sem: </span></td>
                          <td><span class="style25">
                            <select name="sem" id="sem" onChange="popu();">
                              <option value="-" selected="selected">-- -- -- -- -- --</option>
                              <option value="1">1</option>
                              <option value="2">2</option>
                            </select>
                          </span></td>
                        </tr>
                        <tr>
                          <td><span class="style25">Subject Name: </span></td>
                          <td> <div id="sub">
  <select name=subname id=subname>
			<option value=- selected=selected>-- -- -- -- -- --</option>
                             </select>
                                                        </div></td>
                        </tr>
                      </table>
                      </center>
                    <table width="748" height="165" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                      <td height="81" valign="top" background="ch.JPG" bgcolor="#8AB06B"><div align="center">
                        <p>&nbsp;                          </p>
                       <table width="200" border="0">
                          <tr>
                            <td width="100" align="center" valign="top"><input type="submit" name="Submit" value="Show" /></form></td>
                            <td width="100" align="center"><form action="home.html"><input type="submit" value="Back"></form></td>
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

<script type="text/javascript">
function popu()
{
    if((document.syv1.cname.value=='B.Tech')&(document.syv1.year.value=='I'))
{

document.getElementById("sem").disabled = true;
}
else
{
document.getElementById("sem").disabled = false;
}
	var cname = document.syv1.cname.value;
	var bname = document.syv1.bname.value;
	var creg = document.syv1.creg.value;
	var year = document.syv1.year.value;

if((document.syv1.cname.value=='B.Tech')&(document.syv1.year.value=='I'))
	{
       var sem="-";
    }
    else
       {
           var sem = document.syv1.sem.value;
       }
 xmlHttp=GetXmlHttpObject();
if (xmlHttp==null)
 {
 alert ("Browser does not support HTTP Request");
 return
 }
var url="getsub.jsp";
url=url+"?cname="+cname+"&bname="+bname+"&creg="+creg+"&year="+year+"&sem="+sem
xmlHttp.onreadystatechange=stateChanged;
xmlHttp.open("GET",url,true);
xmlHttp.send(null);
}

function stateChanged()
{
if (xmlHttp.readyState==4  || xmlHttp.readyState=="complete")
 {
  var showdata = xmlHttp.responseText;
  var strar = showdata.split(":");
if(strar.length>1)
	 {
		var count=0;
        count =strar.length;
        var i;
		var a;
		var b;
		var c;
		var d=null;
		a= "<select name=subname id=subname>";
			b= "<option value=- selected=selected>-- -- -- -- -- --</option>";
		for(i=1;i<count-1;i++)
		{

				d = d+"<option value="+strar[i]+">"+strar[i]+"</option>";


		}
         c="</select>";
		document.getElementById("sub").innerHTML=a+b+d+c;

	 }

 }
}

function GetXmlHttpObject()
{
var xmlHttp=null;
try
 {
 // Firefox, Opera 8.0+, Safari
 xmlHttp=new XMLHttpRequest();
 }
catch (e)
 {
 //Internet Explorer
 try
  {
 xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
  }
 catch (e)
  {
 xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
 }
 return xmlHttp;
}
</script>
</body>
</html>
