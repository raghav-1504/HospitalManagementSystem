<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
String id=request.getParameter("id");

try{
	Class.forName("com.mysql.jdbc.Driver");
	  Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Hospital","root","Raghav@1504");
Statement st=con.createStatement();
String sql ="select * from appoint where id="+id;
ResultSet resultSet = st.executeQuery(sql);
while(resultSet.next()){
%>
<!DOCTYPE html>
<html>
<body>
<h1></h1>
<form method="post" action="update-process.jsp">
<input type="hidden" name="id" value="<%=resultSet.getString("id") %>">
<input type="text" name="id" value="<%=resultSet.getString("id") %>">
<br>
name:<br>
<input type="text" name="name" value="<%=resultSet.getString("name") %>">
<br>
email:<br>
<input type="text" name="email" value="<%=resultSet.getString("email") %>">
<br>
phone:<br>
<input type="tel" name="phone" value="<%=resultSet.getString("phone") %>">
<br>
date:<br>
<input type="date" name="date" value="<%=resultSet.getString("dt") %>">
<br>
tm:<br>
<input type="time" name="tm" value="<%=resultSet.getString("tm") %>">
<br>
Consultation Type:
    <select id="consultation-type" name="ct" value="<%=resultSet.getString("ct") %>">
      <option value="general-checkup">General Checkup</option>
      <option value="specialist-consultation">Specialist Consultation</option>
      <option value="follow-up">Follow-up Appointment</option>
    </select><br><br>
<input type="text" name="ct" value="<%=resultSet.getString("ct") %>">
urgency:<br>
    <input type="radio" id="urgent" name="urgency" value="urgent">
    <label for="urgent">Urgent</label><br>
    <input type="radio" id="non-urgent" name="urgency" value="non-urgent">
    <label for="non-urgent">Non-Urgent</label><br><br>
    <input type="text" name="urgency" value="<%=resultSet.getString("urgency") %>">
    <br>
    Mode:
    <select id="mode-of-consultation" name="mode-of-consultation">
      <option value="in-person">In-Person</option>
      <option value="telemedicine">Telemedicine</option>
      <option value="video-call">Video Call</option>
    </select><br><br>
    <input type="text" name="mode" value="<%=resultSet.getString("mode") %>">
   <br>
   Preferred Doctor:
    <select id="preferred-doctor" name="preferred-doctor">
      <option value="none">No Preference</option>
      <option value="dr-john-doe">Dr. John Doe</option>
      <option value="dr-jane-doe">Dr. Jane Doe</option>
    </select><br><br>
    <input type="text" name="pd" value="<%=resultSet.getString("pd") %>">
  Message:<br>
    <textarea id="message" name="message" rows="5" cols="50" value="<%=resultSet.getString("msg") %>"></textarea><br><br>
<input type="submit" value="submit">
</form>
<%
}
con.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</body>
</html>
    