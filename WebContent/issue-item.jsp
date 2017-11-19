<%@ page import = "java.io.*,java.util.*,java.sql.*" %>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>

<html>
<body>
	<h3 align = "center">---ISSUE ITEM---</h3>
	<%	
		try {
		//1. Get a connection to a database
		/* I don't know whether this statement is required */
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection myConn = DriverManager.getConnection("jdbc:mysql://localhost:3306/asset", "root", "SKY15b007");
		
		//2.Create a statement
		Statement myStmt = myConn.createStatement();
		
		//3.Execute a SQL query
		ResultSet res = myStmt.executeQuery("select * from lab_item");
		
	%>
	<form action = "issue-item-collect.jsp" method = "post">
		<fieldset>
		<legend>Issue-Item-Form</legend>
		<p>
			<label> Select Item</label>
			<select name = "item_id">
			<%
			while(res.next())	{
			%>
				<option value = <%= res.getString("item_id")%>> <% out.print("(" + res.getString("item_id") +", " + res.getString("item_name")+ ")"); %></option>
			<%	
			}
			%>
			</select>
			<br/><br/>
			<%
				res = myStmt.executeQuery("select * from user");
			%>
			<label> Select Issuer</label>
			<select name = "user_id">
			<%
			while(res.next())	{
			%>
				<option value = <%= res.getString("user_id")%>> <% out.print("(" + res.getString("user_id") +", " + res.getString("user_name")+ ")"); %></option>
			<%	
			}
			%>
			</select>
			<br/><br/>
			<label>Quantity</label>
			<input type = "text" required name = "issued_quantity">
			<br/><br/>
			<label>Date Of Issue</label>
			<input type = "text" required placeholder = "YYYY-MM-DD" name = "date_of_issue">
			<br/><br/>
			<input type = "submit" value = "Issue">
			</fieldset>
	</form>
	
	<%	
		res.close();
		myStmt.close();
		myConn.close();
		}
		catch(Exception e)	{
			out.println(e.getMessage());
		}
		
	%>
	<br/><br/>	
</body>
<footer>
	<a href="http://localhost:8080/asset_management/homepage.jsp">Homepage</a>
	<br/><br/>
	© 2017 <u>Akash D</u>  
</footer>

</html>