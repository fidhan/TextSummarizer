<%@page import="dbc.Dbcon"%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
</head>
<body>
<form action="" method="post">
  <table width="376" border="1">
    <tr>
      <td width="61" height="68">Username</td>
      <td width="299"><label for="textfield"></label>
      <input type="text" name="textfield" id="textfield" /></td>
    </tr>
    <tr>
      <td height="62">Password</td>
      <td><label for="textfield2"></label>
      <input type="text" name="textfield2" id="textfield2" /></td>
    </tr>
    <tr>
      <td height="97" colspan="2" align="center" > <input type="submit" name="button" id="button" value="Submit"/></td>
    </tr>
  </table>
</form>

</body>
</html>
<%
    if(request.getParameter("button")!=null)
{        
            String un=request.getParameter("Username");
            String un1=request.getParameter("password");
            try{
             dbc.Dbcon db=new Dbcon();
             Connection c=db.getcon();
             Statement st=c.createStatement();
             
             String str="select * from rists where Username='"+un+"' and password='"+un1+"'";
            ResultSet rs= st.executeQuery(str);
            if(rs.next())
            {
                     response.sendRedirect("profile.jsp");

            }
           
         }catch(Exception e){}
            
         
}      


%>
