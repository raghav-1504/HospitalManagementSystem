<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
String id = request.getParameter("id");
String n=request.getParameter("name");
String e=request.getParameter("email");
String p=request.getParameter("phone");
String d=request.getParameter("date");
String t=request.getParameter("tm");
//String a=request.getParameter("allergies");
String c=request.getParameter("ct");
String u=request.getParameter("urgency");
String m=request.getParameter("mode");
String pd=request.getParameter("pd");
//String tc=request.getParameter("terms-and-conditions");
String msg=request.getParameter("message");
if(id != null)
{  

int personID = Integer.parseInt(id);
}
try
{
	Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Hospital","root","Raghav@1504");
String sql="Update appoint set id=?,name=?,email=?,phone=?,dt=?,tm=?,ct=?,urgency=?,mode=?,pd=?,msg=? where id="+id;
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1,id);
ps.setString(2,n);
ps.setString(3, e);
ps.setString(4, p);
ps.setString(5, d);
ps.setString(6,t);
ps.setString(7,c);
ps.setString(8, u);
ps.setString(9, m);
ps.setString(10, pd);
ps.setString(11,msg);
int i = ps.executeUpdate();
if(i > 0)
{
response.sendRedirect("view.jsp");
}
else
{
out.print("There is a problem in updating Record.");
}
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
%>
    