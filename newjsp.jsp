<%-- 
    Document   : newjsp
    Created on : 10-Sep-2017, 10:25:15
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
    <body>
        <form id="form1" name="form1" method="post" >   
        <p>
          <label for="name"></label>
          user id
          <input type="text" name="name" id="name">
        </p>
        <p>password
          <label for="pass"></label>
          <input type="password" name="pass" id="pass">
        </p>
        <p>
          <input type="submit" name="login" id="login" value="Login">
        </p>
        </form>
    </body>
</html>
<%
    if(request.getParameter("login")!=null)
{        
            String un=request.getParameter("name");
            String un1=request.getParameter("pass");
            try{
             dbc.Dbcon db=new Dbcon();
             Connection c=db.getcon();
             Statement st=c.createStatement();
             
             String str="select * from user where username='"+un+"' and password='"+un1+"'";
            ResultSet rs= st.executeQuery(str);
            if(rs.next())
            {
                 response.sendRedirect("userpage.jsp");
                 session.setAttribute("lid", rs.getString(1));
            }
            else
            {
                %>
                <script>
                    alert("Invalid user name or password")
                </script>    
                <%   
            }
            
         }catch(Exception e){}
            
         
}      
        %>
