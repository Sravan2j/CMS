<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<%@ page import="java.lang.*" %> 
<html>
<head>
<title>Course Management System</title>
<script>
     function fun(){
        var d=document.sub.subcode.value;
       document.sub.subcode.value=d.toUpperCase();
     var d=document.sub.subname.value;
       document.sub.subname.value=d.toUpperCase();
 }
    function f1(){
    if(document.sub.cname.value==0)
	{
        alert("please select course");
		return false;
    }
    if((document.sub.cname.value=='B.Tech')&(document.sub.bname.value=='-'))
	{
        alert("please select Branch");
		return false;
    }
    if(document.sub.creg.value==0)
        {
        alert("Please select course regulation");
		return false;
		}
 if(document.sub.year.value==0)
        {
        alert("Please select year");
		return false;
		}
        if((document.sub.cname.value!='B.Tech')||(document.sub.year.value!='I')|(document.sub.sem.value!='-'))
	{
        if(document.sub.sem.value=='-'){
	 alert("please select sem");
		return false;}
    }
        if(document.sub.subcode.value==0)
        {
        alert("Please enter subject code");
		return false;
		}
       
        if(document.sub.subname.value==0)
        {
      alert("Please enter subject name");
		return false;
		}

        if(isNaN(document.sub.subname.value)==false)
       {alert("Subject Name should contain alphabets only");
       return false;
   }
    if((document.sub.cname.value=='B.Tech')&(document.sub.year.value=='IV')&(document.sub.st.value==0))
            {
                 alert("please select subject type");
                    return false;

             }
         if(document.sub.prd.value==0)
        {
      alert("Please select number of periods");
		return false;
        }
        if(document.sub.tut.value=='-')
        {
      alert("Please select number of tutorials");
		return false;
		}if(document.sub.crd.value==0)
        {
      alert("Please select number of credits");
		return false;
		}
          
  
    return true;

}</script>
<style type="text/css">
<!--
body {
	background-color: #EBEBEB;
}
.style2 {
	font-size: 20px;
	font-weight: bold;
	color: #5691B1;
	font-family: "Courier New", Courier, monospace;
}
a:link {
	color: #72AACF;
	text-decoration: none;
}
a:visited {
	text-decoration: none;
	color: #639DC3;
}
a:hover {
	text-decoration: underline;
	color: #5D97BC;
}
a:active {
	text-decoration: none;
	color: #508BB3;
}
.style1 {	font-size: 18px;
	font-weight: bold;
}
.style14 {
	font-family: "Courier New", Courier, monospace;
	color: #666666;
	font-size: 18px;
}
.style15 {color: #666666}
.style16 {font-size: 18px}
.style17 {
	font-family: "Courier New", Courier, monospace;
	color: #666666;
}
-->
</style></head>

<body>
    <script language="javascript">
function dis()
{
var cc=document.sub.cname.value;
var yy=document.sub.year.value;
if((cc=='B.Tech')&(yy=='I'))
{

document.getElementById("textfield").disabled = true;
}
else
{
document.getElementById("textfield").disabled = false;
}
if((cc=='B.Tech')&(yy=='IV'))
{

document.getElementById("textfield1").disabled = false;
}
else if((cc=="M.Tech")||cc=="M.B.A"||cc=="M.C.A")
 {
 document.getElementById("textfield1").disabled = false;
    }
else
{
document.getElementById("textfield1").disabled = true;
}
}
</script>
<table width="778" height="317" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="780" height="69" valign="bottom" background="images/header.gif"><div align="center"><span class="style2"><span class="style1">Adding Subjects</span></span></div></td>
  </tr>
  <tr>
    <td height="201" valign="middle"><table width="764" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td bgcolor="#DADADA"><table width="756" height="203" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="764" bgcolor="#CCCCCC"><table width="749" height="207" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td valign="top" bgcolor="#FFFFFF"><%
   

           String driver=application.getInitParameter("driver");
        String url=application.getInitParameter("url");
        String user=application.getInitParameter("user");
        String pswd=application.getInitParameter("pswd");
        Class.forName(driver);
        Connection con=DriverManager.getConnection(url,user,pswd);
%>
				  <form name="sub" method="post" action="addsub.jsp" onSubmit="return f1()">
				    <p>&nbsp;</p>
				    <table width="370" border="0" align="center" cellpadding="10" cellspacing="0">
     <%
      PreparedStatement pst2 = con.prepareStatement("select distinct cname from courseinfo");

 ResultSet rs2 = pst2.executeQuery();
      %>
      <tr><td><span class="style15">Course: </span></td>
        <td><span class="style15">
          <select name="cname" onChange="dis()">
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
      <tr><td><span class="style15">Branch: </span></td>
        <td><span class="style15">
          <select name="bname">
            <option value="-">--------</option>
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
      <tr><td><span class="style15">Course Regulation: </span></td>
        <td><span class="style15">
          <select name="creg">
            <option value="0">-select-</option>
            <%
while (rs1.next()) {
    %>
            <option value="<%=rs1.getString(1)%>"><%=rs1.getString(1)%></option>
             <%   }%>
                </select>
        </span> </td>
      </tr>
     
    <tr>  <td><span class="style15">Year:</span></td>
      <td><span class="style15">
        <select name="year" onChange="dis()">
          <option value="0">-year-</option>
          <option value="I">I</option>
          <option value="II">II</option>
          <option value="III">III</option>
          <option value="IV">IV</option>
          </select>
      </span></td>
    </tr>
  <tr>
    <td><span class="style15">sem: </span></td>
    <td><span class="style15">
      <select name="sem" id="textfield">
        <option value="-" selected="selected">-- -- -- -- -- --</option>
        <option value="1">1</option>
        <option value="2">2</option>
      </select>
    </span></td>
  </tr>
  <tr>
    <td><span class="style15">Subject Code: </span></td>
    <td><input name="subcode" type="text" onkeyup="fun()"/></td>
  </tr>
  <tr>
    <td><span class="style15">Subject Name: </span></td>
    <td><input name="subname" type="text" onkeyup="fun()" /></td>
  </tr>
 <tr>
    <td><span class="style15">Subject Type: </span></td>
    <td><span class="style15">
      <select name="st" id="textfield1">
        <option value="0">-select-</option>
        <option value="R">Regular</option>
        <option value="E1">Elective1</option>
         <option value="E2">Elective2</option>
        <option value="E3">Elective3</option>
        <option value="E4">Elective4</option>
           </select>
    </span></td>
  </tr>
 
 
 <tr>


    <td> <span class="style15">
   
   
    No. Of Periods Per Week: </span></td>
    <td><select name="prd">
      <option value="0">-select-</option>
      <option value="1">1</option>
      <option value="2">2</option>
      <option value="3">3</option>
      <option value="4">4</option>
      <option value="5">5</option>
      <option value="6">6</option>
      <option value="7">7</option>
      <option value="8">8</option>
      <option value="9">9</option>
      <option value="10">10</option>
      <option value="11">11</option>
      <option value="12">12</option>
      <option value="13">13</option>
      <option value="14">14</option>
    </select></td>
  </tr>
  <tr>
    <td><span class="style15">No. Of Tutorials Per Week:</span></td>
    <td><span class="style15">
      <select name="tut">
        <option value="-">-select-</option>
         <option value="0">0</option>
        <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
        <option value="4">4</option>
        <option value="5">5</option>
        <option value="6">6</option>
      </select>
    </span></td>
  </tr>
  <tr>
    <td><span class="style15">No. Of Credits </span></td>
    <td><span class="style15">
      <select name="crd">
        <option value="0">-select-</option>
        <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
        <option value="4">4</option>
        <option value="5">5</option>
        <option value="6">6</option>
      </select>
    </span></td>
  </tr>
</table>
<p align="center">
  <input type="submit" name="Submit" value="add" />
</p>
</form>
                  
                    <table width="748" height="165" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                      <td height="81" valign="top" background="ch.JPG" bgcolor="#8AB06B"><div align="center"><span class="style14">SPECIFIED COURSE OR SUBJECT ALREADY EXISTS.FOR UPDATE:</span><a href="updates2.jsp">Click Here</a>
                            
                        </div>
                        <p align="center"><span class="style16">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="style17">TO ADD SYLLABUS FOR THIS EXISTING COURSE:</span></span><a href="ac3.html">Click Here</a></p></td>
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
  pst.close();
  pst2.close();
    pst1.close();
      con.close();
%>
</body>
</html>
