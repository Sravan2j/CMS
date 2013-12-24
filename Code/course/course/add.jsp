<%@ page import="java.sql.*" %>

<%
String driver=application.getInitParameter("driver");
        String url=application.getInitParameter("url");
        String user=application.getInitParameter("user");
        String pswd=application.getInitParameter("pswd");
        Class.forName(driver);
        Connection con=DriverManager.getConnection(url,user,pswd);
String c= request.getParameter("cname");
String b= request.getParameter("bname");
String reg1= request.getParameter("creg");
String yr= request.getParameter("year");
String seat= request.getParameter("seats");
String reg=reg1.toUpperCase();
PreparedStatement pst = con.prepareStatement("select * from courseinfo where cname=? and bname=? and creg=?");
 pst.setString(1, c);
 pst.setString(2, b);
 pst.setString(3, reg);
 ResultSet rs = pst.executeQuery();
 try{
 if(rs.next()==true)
            {
   %>
     <jsp:forward page = "addcdemo.html"></jsp:forward>
    <%
    }
 else
            {
      PreparedStatement pst1 = con.prepareStatement("insert into courseinfo values(?,?,?,?,?)");
      pst1.setString(1, c);
	  pst1.setString(2, b);
      pst1.setString(3, reg);
      pst1.setString(4, yr);
      pst1.setString(5, seat);
int num=pst1.executeUpdate();
pst1.close();
%>
<%
if(num==1)
                {
%>
<jsp:forward page = "addc2.jsp"></jsp:forward>
<%
                }
%>
<%
if(num==0)
                {
%>
 <%= request.getParameter("cnm")%> Course doesnot inserted in Database due to some problem
<%
                }
            }
     }
catch(Exception e)
{ }
 pst.close();
con.close();

%>

