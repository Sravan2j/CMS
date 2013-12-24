<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<%
String contentType = request.getContentType();
System.out.println("Content type is :: " +contentType);
if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0))
{
DataInputStream in = new DataInputStream(request.getInputStream());
int formDataLength = request.getContentLength();
byte dataBytes[] = new byte[formDataLength];
int byteRead = 0;
int totalBytesRead = 0;
while (totalBytesRead < formDataLength)
{
byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
totalBytesRead += byteRead;
}
String file = new String(dataBytes);
String saveFile = file.substring(file.indexOf("filename=\"") + 10);
//out.print("FileName:" + saveFile.toString());
saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
//out.print("FileName:" + saveFile.toString());
saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1,saveFile.indexOf("\""));

//out.print("FileName:" + saveFile.toString());
//out.print(dataBytes);
int lastIndex = contentType.lastIndexOf("=");
String boundary = contentType.substring(lastIndex + 1,contentType.length());
//out.println(boundary);
int pos;
pos = file.indexOf("filename=\"");
pos = file.indexOf("\n", pos) + 1;
pos = file.indexOf("\n", pos) + 1;
pos = file.indexOf("\n", pos) + 1;
int boundaryLocation = file.indexOf(boundary, pos) - 4;
int startPos = ((file.substring(0, pos)).getBytes()).length;
int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;
int n=saveFile.length();
String s1=saveFile.substring(0, n-4);
String s=s1.toUpperCase();
String sf=saveFile;
 String pth=application.getInitParameter("path");
saveFile = pth + saveFile;
String saveF=saveFile;
FileOutputStream fileOut = new FileOutputStream(saveFile);
//fileOut.write(dataBytes);
fileOut.write(dataBytes, startPos, (endPos - startPos));
fileOut.flush();
fileOut.close();
 %>
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
.style15 {font-family: "Courier New", Courier, monospace}
.style16 {color: #666666}
.style17 {
	color: #FF0000;
	font-size: 18px;
}
-->
</style></head>

<body>
<table width="778" height="404" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="780" height="69" valign="bottom" background="images/header.gif"><div align="center" class="style14"></div></td>
  </tr>
  <tr>
    <td valign="bottom"><table width="764" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td bgcolor="#DADADA"><table width="756" height="203" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="764" bgcolor="#CCCCCC"><table width="749" height="207" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td valign="top" bgcolor="#FFFFFF"><p align="center">&nbsp;</p>
				    <span class="style17">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;File saved as </span>:
<span class="style16">
<%=saveFile%>
</span>
                   <CENTER><H3 class="style15">&nbsp;</H3>
                     <H3 class="style15"><span class="style16"><strong>TO ADD ANOTHER SUBJECT</strong>:</span><a href="addc2.jsp">CLICK HERE</a></H3>
                   </CENTER>
                   <table width="748" height="165" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                      <td height="81" valign="top" background="ch.JPG" bgcolor="#8AB06B"><div align="center">
                        <p>&nbsp;</p>
                        <TABLE align="center">
                          <TR>
                            <TD><form ACTION="courses.html" method="post" >
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
</body>
</html>

<%
              try{
            String driver=application.getInitParameter("driver");
        String url=application.getInitParameter("url");
        String user=application.getInitParameter("user");
        String pswd=application.getInitParameter("pswd");
        Class.forName(driver);
        Connection con=DriverManager.getConnection(url,user,pswd);
Statement st=null;
st=con.createStatement();
PreparedStatement pst = con.prepareStatement("insert into FILE values(?,?,?)");
pst.setString(1, s);
pst.setString(2, sf);
pst.setString(3, saveF);
int num=pst.executeUpdate();
pst.close();
con.close();
          }
catch(Exception e)  {
  
}
    }
%>
