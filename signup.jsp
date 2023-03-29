<%@page import="dbc.Dbcon"%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
</head>

<body>
<form action="" method="post"><table width="358" border="1">
  <tr>
    <td width="167">Name</td>
    <td width="175"><label for="textfield"></label>
      <input type="text" name="textfield" id="textfield" /></td>
  </tr>
  <tr>
    <td>Password</td>
    <td><label for="textfield1"></label>
      <input type="password" name="textfield1" id="textfield1" /></td>
  </tr>
  <tr>
    <td>Age</td>
    <td><label for="textfield2"></label>
      <input type="text" name="textfield2" id="textfield2" /></td>
  </tr>

  <tr>
    <td>Gender</td>
    <td><input name="gen" type="radio" id="radio" value="radio" checked="checked" />
      Male
        <label for="radio">
        <input type="radio" name="gen" id="radio2" value="radio2" />
      Female</label></td>
  </tr>
    <tr>
    <td>Phone No</td>
    <td><label for="textfield3"></label>
      <input type="text" name="textfield3" id="textfield3" /></td>
  </tr>
  <tr>
    <td>Email ID</td>
    <td><label for="textfield4"></label>
      <input type="text" name="textfield4" id="textfield4" /></td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;</td>
    </tr>
  <tr>
    <td colspan="2" align="center"><input type="submit" name="button" id="button" value="Register" /></td>
    </tr>
</table>
</form>
<p>&nbsp;</p>
<p>&nbsp;</p>
</body>
</html>
<%
if(request.getParameter("button")!=null)
{
   
    String name=request.getParameter("textfield");
    String pwd=request.getParameter("textfield1");
    String age=request.getParameter("textfield2");
    String gender=request.getParameter("gen");
    String phone=request.getParameter("textfield3");
    String email=request.getParameter("textfield4");
 out.print(name);

   try{
             dbc.Dbcon db=new Dbcon();
             Connection c=db.getcon();
             Statement st=c.createStatement();
             st.executeUpdate("insert into login(Username,password)values('"+name+"','"+pwd+"')");
            
              ResultSet res=st.executeQuery("select max(id)from login");
              if(res.next())
              {
                  String lid=res.getString(1);
              
             
            int i= st.executeUpdate("insert into signup(name,age,gender,phone,email,lid) values('"+name+"','"+age+"','"+gender+"','"+phone+"','"+email+"','"+lid+"')");
              
            if(i>0)
            {
                 response.sendRedirect("newjsp.jsp");
            }}
            
         }catch(Exception e){}
    
}
%>