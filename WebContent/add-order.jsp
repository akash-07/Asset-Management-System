<%@ page import = "java.io.*,java.util.*,java.sql.*" %>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>

<html>
<body>
<H3 align = "center">---Add Order---</H3>
<i>(<b>Note</b>: Only received orders should be added)</i>
<br/><br/>
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
<legend>Add Order Form</legend>
<form action = "add-order-collect.jsp" method = "post">	
<label>Item Id: </label>
<select name = "item_id">
	<%	while(res.next())	{ %>
	<option value = <%= res.getString("item_id") %>> <%= res.getString("item_id") %></option>
	<% } %>
</select>
<br/><br/>
Supplier: <input type = "text" required name = "supplier">
<br/><br/>
Order-Date: <input type = "text" required placeholder = "YYYY-MM-DD" name =  "order_date">
<br/><br/>
Quantity: <input type = "text" required name =  "order_quantity">
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
	