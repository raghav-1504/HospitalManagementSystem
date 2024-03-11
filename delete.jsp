<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%

String id=request.getParameter("id");
try
{
	Class.forName("com.mysql.jdbc.Driver");
	  Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Hospital","root","Raghav@1504");
Statement st=con.createStatement();
int i=st.executeUpdate("DELETE FROM appoint WHERE id="+id);
out.println("Data Deleted Successfully!");
response.sendRedirect("view.jsp");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>