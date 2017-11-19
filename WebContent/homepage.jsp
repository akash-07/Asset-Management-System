<%@ page import = "java.io.*,java.util.*,java.sql.*" %>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>

<html>
<body>
<h2 align = "center">---ASSET MANAGEMENT SYSTEM---</h2>
<% if(request.getParameter("user_name") != null) {%>
<h3> Welcome <%= request.getParameter("user_name").toUpperCase() %></h3>
<% } %>
<fieldset>
<legend>What would you like to do?</legend>
<ul type = square>

<li><b>View</b>
<ul>
<li><a href="http://localhost:8080/asset_management/view-inventory.jsp?isAdmin=1">Inventory</a></li>
<li><a href="http://localhost:8080/asset_management/view-orders.jsp">Orders</a></li>
<li><a href="http://localhost:8080/asset_management/view-issued.jsp">Issued Items</a></li>
<li><a href="http://localhost:8080/asset_management/view-complaints.jsp">Complaints</a></li>
</ul>
</li>
<br/>
<li><b>Item</b>
<ul>
<li><a href="http://localhost:8080/asset_management/issue-item.jsp">Issue New Item</a></li>
<li><a href="http://localhost:8080/asset_management/return-item.jsp">Return Item</a></li>
<li><a href="http://localhost:8080/asset_management/add-order.jsp">Order new Item</a></li>
</ul>
</li>
<br/>
<li><b>Complaints</b>
<ul>
<li><a href="http://localhost:8080/asset_management/add-complain.jsp">Add a Complaint</a></li>
</ul>
</li>
</ul>
</fieldset>
</body>
<footer>
	<br/>
	Not you! - <a href="http://localhost:8080/asset_management/login.html">Login Again</a>
	<br/><br/>© 2017 <u>Akash D</u>
</footer>
</html>	