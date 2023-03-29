<%-- 
    Document   : userpage
    Created on : 22-Dec-2017, 10:32:12
    Author     : hp
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="dbc.Dbcon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
    String id=session.getAttribute("lid").toString();
      dbc.Dbcon db=new Dbcon();
             Connection c=db.getcon();
             Statement st=c.createStatement();
             
             String str="select * from user where id='"+id+"'";
            ResultSet rs= st.executeQuery(str);
            String name="";
            if(rs.next())
            {
               name=rs.getString(2);
            }
    
    
    %>
    <body>
        <h1><%=name%></h1>
    <div align="right"><a href=""profile.jsp"" title="profle">Edit profile    </a><a href="index.jsp" title="logout">logout</a></div>
    <br>
    <br>
    <form action="trends.jsp" method="post">
      <div align="right">
        <input name="trends" type="submit" value="trends">
      </div>
    </form>
    <br>
     <form action="comparison.jsp" method="post">
       <div align="right">
         <input name="trends" type="submit" value="Brand Comparison">
       </div>
     </form>
     <div align="right"><br>
     </div>
    <form action="posts.jsp" method="post">
       <div align="right">
         <input name="trends" type="submit" value="Posts">
       </div>
    </form>
    </body>
</html>
