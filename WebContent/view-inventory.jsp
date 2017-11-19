<%@ page import = "java.io.*,java.util.*,java.sql.*" %>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>

<html>
<body>
	<%	
		String isAdmin = request.getParameter("isAdmin");
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
	<h2>Inventory</h2>
	<Table border = "2" style = "background-color: #ffffcc;">
	<TR>
	<td><b>item_name</b></td>
	<td><b>item_id</b></td>
	<td><b>item_quantity</b></td>
	</TR>
	<%while (res.next()) {%>
	<TR>
	<td><%= res.getString(1)%></td>
	<td><%= res.getString(2)%></td>
	<td><%= res.getInt(3)%></td>
	</TR>
	<%} %>
	</Table>
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
	<% 
		if(isAdmin != null)	{
	%>
	<a href="http://localhost:8080/asset_management/homepage.jsp">Homepage</a>
	<%
		}
		else {
	%>
	<a href="http://localhost:8080/asset_management/login.html">Back</a>
	<%	} %>
	<p> © 2017 <u>Akash D</u> </p>  
</footer>

</html>