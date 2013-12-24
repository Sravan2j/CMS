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
String cr= request.getParameter("creg");
String yr= request.getParameter("year");
String sm= request.getParameter("sem");
if(yr.equalsIgnoreCase("I") && c.equalsIgnoreCase("B.Tech"))
    {
    sm="-";
    }
String subc1= request.getParameter("subcode");
String subn1= request.getParameter("subname");
String prds= request.getParameter("prd");
String tuto= request.getParameter("tut");
String cred= request.getParameter("crd");
String subt;
if(yr.equalsIgnoreCase("IV") && c.equalsIgnoreCase("B.Tech"))
    {
  subt= request.getParameter("st");
    }
else if(c.equalsIgnoreCase("M.Tech")||c.equalsIgnoreCase("M.B.A")||c.equalsIgnoreCase("M.C.A"))
 {
  subt= request.getParameter("st");
    }
    else{
subt="R";
}
String subc=subc1.toUpperCase();
String subn=subn1.toUpperCase();
Statement st=null;
st=con.createStatement();
PreparedStatement pst = con.prepareStatement("select * from addsub where cname=? and branch=? and creg=? and year=? and sem=? and subcode=?");
 pst.setString(1, c);
 pst.setString(2, b);
  pst.setString(3, cr);
 pst.setString(4, yr);
 pst.setString(5, sm);
 pst.setString(6, subc);
 ResultSet rs = pst.executeQuery();
 try{
 if(rs.next()==true)
            {
   %>
     <jsp:forward page = "addsubdemo.jsp"></jsp:forward>
     <%
    }
 else
            {
PreparedStatement pst1 = con.prepareStatement("insert into addsub values(?,?,?,?,?,?,?,?,?,?,?)");

	  pst1.setString(1, c);
	  pst1.setString(2, b);
      pst1.setString(3, cr);
      pst1.setString(4, yr);
      pst1.setString(5, sm);
      pst1.setString(6, subc);
      pst1.setString(7, subn);
      pst1.setString(8, prds);
      pst1.setString(9, tuto);
      pst1.setString(10, cred);
      pst1.setString(11, subt);
int num=pst1.executeUpdate();
pst.close();
pst1.close();
%><jsp:forward page = "ac3.html"></jsp:forward>
<%}
}
 catch(Exception ex)
{}
    con.close();
%>