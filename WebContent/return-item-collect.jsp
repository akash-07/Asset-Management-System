<%@ page import = "java.io.*,java.util.*,java.sql.*" %>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>

<html>
<body>
	<h3 align = "center">---Return Item Result---</h3>
	<fieldset>
	<%	
		Connection myConn = null;
		String issue_id = request.getParameter("issue_id");
		String return_date = request.getParameter("return_date");
		try {
			//1. Get a connection to a database
			/* I don't know whether this statement is required */
			Class.forName("com.mysql.jdbc.Driver");
			
			myConn = DriverManager.getConnection("jdbc:mysql://localhost:3306/asset", "root", "SKY15b007");
			myConn.setAutoCommit(false);
			//2.Create a statement
			Statement myStmt = myConn.createStatement();
			String query;
			/*Need to do two things - 
			* 1) Increase quantity in lab_item table.
			* 2) Set return date in orders table. */
			query = "select * from issued_items where issue_id = '" + issue_id + "'";
			ResultSet res = myStmt.executeQuery(query);
			res.next();
			int issued_quantity = res.getInt("issued_quantity");
			String date_of_issue = res.getString("date_of_issue");
			if(return_date.compareTo(date_of_issue) >= 0)	{
				String item_id = res.getString("item_id");
				query = "select * from lab_item where item_id = '" + item_id + "'";
				res = myStmt.executeQuery(query);
				res.next();
				int old_quantity = res.getInt("item_quantity");
				old_quantity += issued_quantity;
				query = "update lab_item set item_quantity = " + String.valueOf(old_quantity) + " where item_id = '"
						+ item_id + "'";
				myStmt.executeUpdate(query);
				query = "update issued_items set return_date = '" + return_date + "' where issue_id = '" + 
					issue_id + "'";
				myStmt.executeUpdate(query);
				myConn.commit();
				out.println("Inventory and return date updated successfully\n");
				res.close();
				myStmt.close();
				myConn.setAutoCommit(true);
				myConn.close();
			}
			else {
				out.println("Return date: " + return_date + " < Date of Issue: " + date_of_issue);
			}
		}
		catch(Exception e)	{
			if(myConn != null)
				myConn.rollback();
			out.println(e.getMessage());
		}
		%>
</fieldset>
<br/><br/>	
</body>
<footer>
	<a href="http://localhost:8080/asset_management/homepage.jsp">Homepage</a>
	<p> <b>© 2017 Akash D </b></p>  
</footer>

</html>