<%@ page import = "java.io.*,java.util.*,java.sql.*" %>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>

<html>
<body>
<H3 align = "center">---Add Complain---</H3>
<br/>
<%	
	/* Set Driver */
	Class.forName("com.mysql.jdbc.Driver");
	
	/* Get connection	*/
	Connection myConn = DriverManager.getConnection("jdbc:mysql://localhost:3306/asset", "root", "SKY15b007");
	
	/* Create a statement*/
	Statement myStmt = myConn.createStatement();
	
	/* Execute query*/
	String query = "select * from lab_item";
	
	ResultSet res = myStmt.executeQuery(query);
%>
<fieldset>
<legend>Add Complain Form</legend>
<form action = "add-complain-collect.jsp" method = "post">	
<label>Item Id: </label>
<select name = "item_id">
	<%	while(res.next())	{ %>
	<option value = <%= res.getString("item_id") %>> <%= res.getString("item_id") %></option>
	<% } %>
</select>
<br/><br/>
Description: <input type = "text" required name = "description">
<br/><br/>
Date Of Complain: <input type = "text" required placeholder = "YYYY-MM-DD" name =  "date_of_complain">
<br/><br/>
Quantity: <input type = "text" required name =  "quantity">
<br/><br/>
<input type = "submit" value = "Submit" >
</form>
</fieldset>
</body>
<footer>
	<br/>
	<a href="http://localhost:8080/asset_management/homepage.jsp">Homepage</a>
	<br/><br/>© 2017 <u>Akash D</u>
</footer>
</html>
	