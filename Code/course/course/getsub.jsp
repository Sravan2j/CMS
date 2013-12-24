<%@ page import="java.sql.*" %> 
<%
String cname = request.getParameter("cname").toString();
String bname = request.getParameter("bname").toString();
String creg = request.getParameter("creg").toString();
String year = request.getParameter("year").toString();
String sem = request.getParameter("sem").toString();
String data =":";
    int sumcount=0; 
	Statement st;
    try {
   //   Class.forName("com.mysql.jdbc.Driver");
//Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/admin","root","");
		String driver=application.getInitParameter("driver");
        String url=application.getInitParameter("url");
        String user=application.getInitParameter("user");
        String pswd=application.getInitParameter("pswd");
        Class.forName(driver);
        Connection con=DriverManager.getConnection(url,user,pswd);
	    String query = "select subname from addsub where cname='"+cname+"' and branch='"+bname+"' and creg='"+creg+"' and year='"+year+"' and sem='"+sem+"'";
	
       st = con.createStatement();
	   ResultSet  rs = st.executeQuery(query);
	   while(rs.next())
		{
		    
			data = data + rs.getString(1) + ":";
		}
		
      out.println(data);
	}
	catch (Exception e) {
      e.printStackTrace();
    }
 %>