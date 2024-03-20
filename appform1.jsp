<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*,java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Receipt</title>
 <style>
  label
  {
    padding :275px;
   }
  .logo img
   {
	 margin-top: 25px;
	 margin-left: 60px;
	 float: left;
	 width: 100px;
	 height: auto;
	}
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
  h2
  {
   color:blue;
   }
  table
   {
	margin-left: 39%;
    }
   img 
   {
    opacity: 0.5;
    filter: alpha(opacity=50); /* For IE8 and earlier */
    }
  body
  {
     background:transparent;
     }
  lable
  {
    margin:55px;
   }
   .li
   {
    text-align:center;
   }
   td
   {
    color:brown;
   }
 </style>
</head>
<body style="background-image: linear-gradient(red, yellow, green);">
 <%
   String date=request.getParameter("date");
   String bill=request.getParameter("bill");
   String sname=request.getParameter("sname");
   String snumber=request.getParameter("snumber");
   String city=request.getParameter("city");
   String cname=request.getParameter("cname");
   String cnumber=request.getParameter("cnumber");
   String address=request.getParameter("address");
   String DLnumber=request.getParameter("DLnumber");
   String adnumber=request.getParameter("adnumber");
   String Bmodel=request.getParameter("models");
   String Bcolor=request.getParameter("color");
   String Enumber=request.getParameter("Enumber");
   String Knumber=request.getParameter("Knumber");
   String Bnumber=request.getParameter("Bnumber"); 
   float cost=Float.parseFloat(request.getParameter("cost")); 
   System.out.println("date-----------------"+date);
   float tax = 0;
   try
     {
	   tax=(cost*20)/100; 
       Class.forName("oracle.jdbc.driver.OracleDriver");
       Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","project");
       Statement stmt=con.createStatement();
	   String sql = "insert into Customer_data(cname,cnumber,address,DLnumber,aadhar,Bmodel,Bcolor,Enumber,Knumber,Bnumber,cost,tax,booked_date) values ('"
				        + cname + "','" + cnumber + "','" + address + "','" + DLnumber + "','" + adnumber + "','"
				        + Bmodel + "','" + Bcolor + "','" + Enumber + "','" + Knumber + "','" + Bnumber + "','" + cost + "','" + tax + "','"+date+"')";
				
	   stmt.executeUpdate(sql);
 	   System.out.println(",,,,,,,,,,inserted-------"+tax);
	    }
    catch (Exception e) 
     {
		e.printStackTrace();
		out.println(e);
	   }
%>

  <h1 >ROYAL ENFIELD</h1>
     <label style="text-align:right; color:green">Bill Number:<%=bill %></label>
     <label style="text-align:left"> Date:<span id="date"><%=date %></span></label>
 
  <h2 style ="text-align:center">SHOWROOM DETAILS</h2>
      <table border="1px center">
       <tr><td style="text-align:center:">Showroom Name:</td><td><%=sname %></td></tr>
       <tr><td>Showroom Number : </td><td><%=snumber %></td></tr>
       <tr><td>Showroom Location :  </td><td><%=city %></td></tr>
       </table>
 
  <h2 style ="text-align:center">Customer Details</h2>
    <table border="2px center">
      <tr><td>Customer Name : </td><td><%=cname %></td></tr>
      <tr><td>Contact Number:</td><td><%=cnumber %></td></tr>
      <tr><td>Address:</td><td><%=address %></td></tr>
      <tr><td>DL Number:</td><td><%=DLnumber %></td></tr>
      <tr><td>Aadhaar Number:</td><td><%=adnumber %></td></tr>
      </table>
 
  <h2 style ="text-align:center">Bike Details</h2>
    <table border="2px "center">
      <tr><td>Bike Model:</td><td><%=Bmodel %></td></tr>
      <tr><td>Bike Color:</td><td><%=Bcolor %></td></tr>
      <tr><td>Engine Number:</td><td><%=Enumber %></td></tr>
      <tr><td>Key Number:</td><td><%=Knumber %></td></tr>
      <tr><td>Battery Number:</td><td><%=Bnumber %></td></tr>
      <tr><td>Bike Cost:</td><td><%=cost %></td></tr>
      <tr><td>Road Tax:</td><td><%= tax%></td></tr>
      </table>
  <div class="logo">
         <a href="home.html">
         <img src="images/homebutton.png">
         </a>
     </div>    
 </body>


</html>