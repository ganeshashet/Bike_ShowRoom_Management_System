<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*,java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Advance Booking Details</title>
<style>
  .logo1 img
   {
	 margin-top: 25px;
	 margin-left: 500px;
	 float: left;
	 width: 100px;
	 height: auto;
	}
	.logo2 img
   {
	 margin-top: 25px;
	 margin-right: 500px;
	 float: right;
	 width: 150px;
	 height: auto;
	 
	}
	h2
{
	background: transparent;
	border: none;
	outline: none;
	color: black;
	background: green;
	padding: 10px 20px;
	cursor: pointer;
	border-radius: 5px;
}
	</style>
 </head>
  <body style="    color: gold;
    font-style: italic;
    background-color:black ">
    <h1><center>Advance Booked Details</center></h1>
<%

  try
  {
   Class.forName("oracle.jdbc.driver.OracleDriver");
   Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","project");
   Statement stmt=con.createStatement();
   ResultSet rs=stmt.executeQuery("Select cname,cnumber,Bmodel,Bcolor,acost,adbooked_date from OnLin2 ");
 %>
  <center><table border="1px center"  style="text-align: center;">
   <tr style=" color: red;text-decoration: underline;">
   <th>Customer Name</th>
   <th>Contact Number</th>
   <th>Bike Model</th>
   <th>Bike Color</th>
   <th>Advance Cost</th>
   <th>Booking Date</th></tr>

 <%
 DateFormat df=new SimpleDateFormat("dd-MM-yyyy");
  while(rs.next())
   {
     System.out.println("customer name:"+rs.getString("cname"));
     System.out.println("customer number:"+rs.getString("cnumber"));
     System.out.println("Bike Model:"+rs.getString("Bmodel"));
     System.out.println("Bike color:"+rs.getString("Bcolor"));
     System.out.println("Advance cost:"+rs.getString("acost"));
     
    %>
    <tr style="text-align:center">
    <td> <%=rs.getString("cname")%></td>
    <td> <%=rs.getString("cnumber")%></td>
    <td> <%=rs.getString("Bmodel")%></td>
    <td> <%=rs.getString("Bcolor")%></td>
    <td> <%=rs.getString("acost")%></td>
    <td> <%=df.format(rs.getDate("adbooked_date"))%></td> 
    </tr>
   <% 
     }
    %>
     </table></center>
     <%
      stmt.close();
      }
  catch(Exception e)
  {
	 e.printStackTrace();
   }
  %>
 <div class="logo1">
         <a href="home.html">
         <img src="images/homebutton.png">
         </a>
     </div> 
    <div class="logo2"></center>
         <a href="appform2.html">
         <img src="images/buy.png">
         </a>
     </div> 
</body>
</html>