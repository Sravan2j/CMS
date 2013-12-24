<%@ page import="java.sql.*" %>
<%
String driver=application.getInitParameter("driver");
        String url=application.getInitParameter("url");
        String user=application.getInitParameter("user");
        String pswd=application.getInitParameter("pswd");
        Class.forName(driver);
        Connection con=DriverManager.getConnection(url,user,pswd);
String u=request.getParameter("uname");
String p=request.getParameter("pass");
Statement stmt=con.createStatement();
ResultSet rs=stmt.executeQuery("select * from login");
int flag=0;
while(rs.next())
{
    String name = rs.getString(1);
    String pas=rs.getString(2);
    if(name.equals(u))
    {
        if(p.equals(pas))
        {
%>
    <jsp:forward page = "courses.html"></jsp:forward>
<%flag=1;

        }
    }
}
if(flag==0)
{
%>
 <jsp:forward page = "fail.html"></jsp:forward>
<%
}
stmt.close();
con.close();
%>
