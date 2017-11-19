<%@ page import = "java.io.*,java.util.*,java.sql.*" %>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>

<html>
<body>
		<h3 align = "center">---Return Item---</h3>
	<%	
		Connection myConn = null;
		try {
		//1. Get a connection to a database
		/* I don't know whether this statement is required */
		Class.forName("com.mysql.jdbc.Driver");
		
		myConn = DriverManager.getConnection("jdbc:mysql://localhost:3306/asset", "root", "SKY15b007");
		
		//2.Create a statement
		Statement myStmt = myConn.createStatement();
		
		//3.Execute a SQL query
		ResultSet res = myStmt.executeQuery("select * from issued_items");
		
	%>
	<form action = "return-item-collect.jsp" method = "post">
		<fieldset>
		<legend>Return-Item-Form</legend>
		<p>
			<label> Select Issued Item</label>
			<select name = "issue_id">
			<%
			
			while(res.next())	{
				String issue_id = res.getString("issue_id");
				String user_id = res.getString("user_id");
				String item_id = res.getString("item_id");
				String date_of_issue = res.getString("date_of_issue");
				String return_date = res.getString("return_date");
				if(return_date == null)	{
			%>	
				<option value = <%= issue_id%>> <% out.println("(" + issue_id + ", " + user_id + ", " + item_id 
						+ ", " + date_of_issue + ")"); %></option>
			<%
				}
			}
			%>
			</select>
			<br/><br/>
			<label>Return Date</label>
			<input type = "text" required placeholder = "YYYY-MM-DD" name = "return_date">
			<br/><br/>
			<input type = "submit" value = "Return">
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
	<p> © 2017 Akash D </p>  
</footer>

</html>