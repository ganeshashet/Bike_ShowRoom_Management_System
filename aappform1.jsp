<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*,java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <title>Receipt</title>
  <style>
  h1
  {
    letter-spacing:2px;
    border: 4px cyan;
    text-align:center;
    color:red;
    text-decoration: underline;
    text-transform: uppercase;
    text-shadow:5px 1px yellow;
     }
     .logo img
     {
     	margin-top: 25px;
    	margin-left: 60px;
    	float: left;
    	width: 100px;
    	height: auto;
	   }
   h2
   {
    color:tomoto;
    }
   table
    {
	margin-left: 39%;
      }
   body
   {
     background-image: linear-gradient(yellow, pink, green);
     }
     </style>
</head>
<body>
<%
  String sname=request.getParameter("sname"); 
  String snumber=request.getParameter("snumber");
  String city=request.getParameter("city");
  String cname=request.getParameter("cname");
  String cnumber=request.getParameter("cnumber");
  String Bmodel=request.getParameter("models");
  String Bcolor=request.getParameter("color");
  String date=request.getParameter("date");
  float cost=Float.parseFloat(request.getParameter("cost"));
  try
   {
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","project");
    Statement stmt=con.createStatement();
    String sql="insert into OnLin2(cname,cnumber,Bmodel,Bcolor,acost,adbooked_date) values ('"+cname+"','"+cnumber+"','"+Bmodel+"','"+Bcolor+"','"+cost+"','"+date+"')";
    stmt.executeUpdate(sql);
    System.out.println(",,,,,,,,,,inserted");
     }
    catch(Exception e)
     {
      e.printStackTrace();
      out.println(e);
      }
%>

 <h1 >Royal Enfield</h1>
 <center>  <label style="text-align:left"> Date:<%=date %></label></center>
 
  <h2 style ="text-align:center">SHOWROOM DETAILS</h2>
      <table border="1px center">
       <tr><td style="text-align:center:">Showroom Name:</td><td><%=sname %></td></tr>
       <tr><td>Showroom Number : </td><td><%=snumber %></td></tr>
       <tr><td>Showroom Location :  </td><td><%=city %></td></tr>
       </table>
       
  <h2 style ="text-align:center">CUSTOMER DETAILS</h2>
       <table border="1px center">
         <tr><td style="text-align:center;">Customer Name:</td><td><%=cname%></td></tr>
         <tr><td>Contact Number : </td><td><%=cnumber%></td></tr>
         </table>
  <h2 style ="text-align:center">Bike Details</h2>
       <table border="2px center">
         <tr><td>Bike Model:</td><td><%=Bmodel%></td></tr>
         <tr><td>Bike Color:</td><td><%=Bcolor%></td></tr>
         <tr><td>Bike Advance Pay:</td><td><%=cost %></td></tr>
       </table>
 <div class="logo">
         <a href="home.html">
         <img src="images/homebutton.png">
         </a>
     </div>  
     </body>

</html>