<html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<head>
	<title>Appointments</title>
	<style>
		table {
			border-collapse: collapse;
			width: 100%;
		}
		th, td {
			padding: 8px;
			text-align: left;
			border-bottom: 1px solid #ddd;
		}
		tr:hover {
			background-color: #f5f5f5;
		}
		a {
			text-decoration: none;
			color: #007bff;
		}
	</style>
</head>
<body>
<h1>Appointments</h1>
<body>
<h1></h1>
<table border="1">
<tr>
<td>id</td>
<td>Name</td>
<td>E-mail</td>
<td>Phone</td>
<td>Date</td>
<td>Time</td>
<td>Consultation-Type</td>
<td>Urgency</td>
<td>Mode</td>
<td>Preferred doctor</td>
<td>Message</td>
</tr>
<%
try{
	Class.forName("com.mysql.jdbc.Driver");
	  Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Hospital","root","Raghav@1504");
Statement st =con.createStatement();
String sql ="select * from appoint";
ResultSet res = st.executeQuery(sql);
while(res.next()){
%>
<tr>
<td><%=res.getString("id") %></td>
<td><%=res.getString("name") %></td>
<td><%=res.getString("email") %></td>
<td><%=res.getString("phone") %></td>
<td><%=res.getString("dt") %></td>
<td><%=res.getString("tm") %></td>
<td><%=res.getString("ct") %></td>
<td><%=res.getString("urgency") %></td>
<td><%=res.getString("mode") %></td>
<td><%=res.getString("pd") %></td>
<td><%=res.getString("msg") %></td>
<td><a href="update.jsp?id=<%=res.getString("id")%>">update</a> </td>
<td><a href="delete.jsp?id=<%=res.getString("id") %>">Delete</a></td>



<%
}
con.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
<li><a href="tram.html">Home</a></li>
</body>
</html>
    