<%@ page import = "java.io.*,java.util.*,java.sql.*" %>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>

<html>
<body>
	<h3 align = "center">---Issue Item Result---</h3>
	<fieldset>
	<%	
		String item_id = request.getParameter("item_id") ;	
		String user_id = request.getParameter("user_id") ;	
		String date_of_issue = request.getParameter("date_of_issue");
		String issued_quantity = request.getParameter("issued_quantity");
		Connection myConn = null;
		try {
			//1. Get a connection to a database
			/* I don't know whether this statement is required */
			Class.forName("com.mysql.jdbc.Driver");
			
			myConn = DriverManager.getConnection("jdbc:mysql://localhost:3306/asset", "root", "SKY15b007");
			//setting auto_commit to false, it will not commit unless explicitly told
			myConn.setAutoCommit(false);
			
			//2.Create a statement
			String query = "select item_quantity from lab_item where item_id = '" + item_id + "'";
			Statement myStmt = myConn.createStatement();
			ResultSet res;
			
			//3.Execute a SQL query	
			query = "select * from lab_item where item_id	 = '" + item_id + "'";
			res = myStmt.executeQuery(query);
			res.next();
			int old_item_quantity = Integer.parseInt(res.getString("item_quantity"));
			int Item_quantity = Integer.parseInt(issued_quantity);	
			if(old_item_quantity >= Item_quantity)	{	
				old_item_quantity -= Item_quantity;
				query = "update lab_item set item_quantity = " + String.valueOf(old_item_quantity) + " where item_id = '" + item_id + "'";
				myStmt.executeUpdate(query);
				query = "insert into issued_items (user_id, item_id, issued_quantity, date_of_issue) values ('"
						+ user_id + "','" + item_id + "'," + String.valueOf(Item_quantity) + ",'" + 
						date_of_issue +"')";
				myStmt.executeUpdate(query);
				//Commiting transactions
				myConn.commit();
				out.println("Item issued: Inventory and ");
				out.println("Issued Items' Table Updated succesfully.<br/>");
			}
			else {
				out.println("ERROR: Issue Items > Items in Inventory");
			}
			res.close();
			myStmt.close();
			myConn.setAutoCommit(true);
			myConn.close();
		}
		catch(Exception e)	{
			//rolling back transactions
			if(myConn != null)
				myConn.rollback();
			out.println(e.getMessage() + "<br/>");
			out.println("Transactions rolled back!");
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