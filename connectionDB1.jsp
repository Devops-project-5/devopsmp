<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%@page import ="javax.servlet.ServletException" %>
<%
String user=request.getParameter("user");
out.print(user);

session.putValue("user",user);
String pwd=request.getParameter("pwd");
out.print(pwd);
Class.forName("com.sql.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:sql://localhost:8181/DB","system","root");
Statement st= con.createStatement();
ResultSet rs=st.executeQuery("select *from student1 where user= 'vasudha' ");
try{
if(rs.next())
{
   out.print(rs.getString(2));
out.print(rs.getString(1));
 if(rs.getString(2).equals(pwd) && rs.getString(1).equals(user))
{
out.println("Welcome " +user);
}
else
{
out.println("Invalid password or username.");
}
}
con.close();
}
catch (Exception e) {
e.printStackTrace();
}
%>

