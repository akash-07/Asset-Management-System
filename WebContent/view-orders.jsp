<%@ page import = "java.io.*,java.util.*,java.sql.*" %>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>

<html>
<body>
	<%	
		try {
		//1. Get a connection to a database
		/* I don't know whether this statement is required */
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection myConn = DriverManager.getConnection("jdbc:mysql://localhost:3306/asset", "root", "SKY15b007");
		
		//2.Create a statement
		Statement myStmt = myConn.createStatement();
		
		//3.Execute a SQL query
		ResultSet res = myStmt.executeQuery("select * from orders");
		
	%>
	<h2>Orders</h2>
	<Table border = "2" style = "background-color: #ffffcc;">
	<TR>
	<td><b>Order Id</b></td>
	<td><b>Item Id</b></td>
	<td><b>Supplier</b></td>
	<td><b>Order Date</b></td>
	<td><b>Quantity</b></td>
	</TR>
	<%while (res.next()) {%>
	<TR>
	<td><%= res.getString(1)%></td>
	<td><%= res.getString(2)%></td>
	<td><%= res.getString(3)%></td>
	<td><%= res.getString(4)%></td>
	<td><%= res.getString(5)%></td>
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
	<a href="http://localhost:8080/asset_management/homepage.jsp">Homepage</a>
	<p> © 2017 Akash D </p>  
</footer>

</html>