<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String n=request.getParameter("name");
String e=request.getParameter("email");
String p=request.getParameter("phone");
String d=request.getParameter("date");
String t=request.getParameter("time");
//String a=request.getParameter("allergies");
String c=request.getParameter("consultation-type");
String u=request.getParameter("urgency");
String m=request.getParameter("mode-of-consultation");
String pd=request.getParameter("preferred-doctor");
//String tc=request.getParameter("terms-and-conditions");
String msg=request.getParameter("message");
try
{
	Class.forName("com.mysql.cj.jdbc.Driver");
	  Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Hospital","root","Raghav@1504");
Statement st=con.createStatement();

int i=st.executeUpdate("insert into appoint(name,email,phone,dt,tm,ct,urgency,mode,pd,msg)values('"+n+"','"+e+"','"+p+"','"+d+"','"+t+"','"+c+"','"+u+"','"+m+"','"+pd+"','"+msg+"')");
out.println("Data is successfully inserted!");
response.sendRedirect("view.jsp");
}
catch(Exception ex)
{
System.out.print(ex);
ex.printStackTrace();
}
%>