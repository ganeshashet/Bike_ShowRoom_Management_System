<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.text.DateFormat"%>
<%@ page import="java.util.*,java.sql.*" %>
<!DOCTYPE html>
<html>
 <head>
  <meta charset="ISO-8859-1">
  <title>Purchased Details</title>
  <style> 
   .logo img
    {
	  margin-top: 25px;
	  margin-left: 60px;
	  float: left;
	  width: 100px;
	  height: auto;
	  }
   </style>
 </head>
 <body style=background-color:white;>
 
 <%
 try
 {
   Class.forName("oracle.jdbc.driver.OracleDriver");
   Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","project");
   Statement stmt=con.createStatement();
   ResultSet rs=stmt.executeQuery("Select cname,cnumber,address,DLnumber,aadhar,Bmodel,Bcolor,Enumber,Knumber,Bnumber,cost,tax,booked_date from Customer_data ");
   %>
   
   <h1 style=color:dark red;><center>Booked details of Customer and Bike</center></h1>
 <table border="1px center">
 <tr style="color: red;
    text-decoration: underline;
    text-decoration-style: solid;
    text-align: center;">
 <th>Customer Name</th>
 <th>Contact Number</th>
 <th>Address</th>
 <th>DL Number</th>
 <th>Aadhaar Number</th>
 <th>Bike Model</th>
 <th>Bike Color</th>
 <th>Engine Number</th>
 <th>Key Number</th>
 <th>Battery Number</th>
 <th>Cost</th>
 <th>Tax</th>
 <th>Purchased Date</th></tr>
 <%
  DateFormat df=new SimpleDateFormat("dd-MM-yyyy");
  while(rs.next())
  {
    System.out.println("customer name:"+rs.getString("cname"));
    System.out.println("customer number:"+rs.getString("cnumber"));
    System.out.println("Bike Model:"+rs.getString("Bmodel"));
    System.out.println("Bike color:"+rs.getString("Bcolor"));
    System.out.println("Advance cost:"+rs.getString("Enumber"));
    System.out.println("date of advance:"+rs.getString("booked_date"));
     %>
    <tr style="text-align:center;
     color:black;">
    <td> <%=rs.getString("cname")%></td>
    <td> <%=rs.getString("cnumber")%></td>
    <td> <%=rs.getString("address")%></td>
    <td> <%=rs.getString("DLnumber")%></td>
    <td> <%=rs.getString("aadhar")%></td>
    <td> <%=rs.getString("Bmodel")%></td>
    <td> <%=rs.getString("Bcolor")%></td>
    <td> <%=rs.getString("Enumber")%></td>
    <td> <%=rs.getString("Knumber")%></td>
    <td> <%=rs.getString("Bnumber")%></td>
    <td> <%=rs.getString("cost")%></td>
    <td> <%=rs.getString("tax")%></td>
    <td> <%=df.format(rs.getDate("BOOKED_DATE"))%></td> 
    </tr>
   <%  
    }
    %>
   </table>
   <%
    stmt.close();
     }
   catch(Exception e)
    {
	 e.printStackTrace();
     }
  %>
  <div class="logo">
         <a href="home.html">
         <img src="images/homebutton.png">
         </a>
     </div>   
</body>
</html>