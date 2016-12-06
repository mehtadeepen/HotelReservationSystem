<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ page import="apimanager.*,java.util.*,beans.*,dao.*"%>
      <%
    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
%>
You are not logged in<br/>
<a href="index.jsp">Please Login</a>
<%} else {%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/bootstrap-theme.css" rel="stylesheet">
<link href="css/bootstrap-theme.min.css" rel="stylesheet">
<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/bootstrap.js"></script>
</head>
<body>

<%
 
	Hotel hotel = (Hotel) request.getAttribute("hotel");
	Booking booked = (Booking) request.getAttribute("booking");
	
	System.out.println(hotel.toString());
	System.out.println(booked.toString());
	
	

%>
<% if (String.valueOf(session.getAttribute("role")).equals("Admin")) {%>
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="AdminHome.jsp">FindMyHotels.com</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="#"><%=hotel.getName() %></a></li>
            <li><a href="AdminHome.jsp">Find Hotels</a></li>
            <li><a href="AdminManageBooking.jsp">Manage booking</a></li>
             <li><a href="AdminManageReview.jsp">Manage Review</a></li>
            
          </ul>
          <ul class="nav navbar-nav navbar-right">
          <li><a href="AdminUserCreate.jsp">Create User</a></li>
            <li><a href="AdminProfile.jsp">My Profile</a></li>
            <li><a href="logout.jsp">Logout</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>
<% } else { %>

	
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="HomeSearch.jsp">FindMyHotels.com</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="#"><%=hotel.getName() %></a></li>
            <li><a href="HomeSearch.jsp">Find Hotels</a></li>
            <li><a href="#contact">Contact</a></li>
            
          </ul>
          <ul class="nav navbar-nav navbar-right">
             <li><a href="MyProfile.jsp">My Profile</a></li>
            <li><a href="logout.jsp">Logout</a></li>
            
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>
    <%} %>
	<div class="container" style="padding-top: 70px">
<div class="well well-lg">
<form action="HomeSearch.jsp" method="post">
<center>
            <table class="table"  width="30%" cellpadding="5">
                <thead>
                    <tr>
                        <th colspan="2">Booking Details </th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>First Name</td>
                        <td><%=booked.getFirstname() %></td>
                    </tr>
                    <tr>
                        <td>Last Name</td>
                        <td><%=booked.getLastname() %></td>
                    </tr>
                    <tr>
                        <td>Arrival Date</td>
                        <td>
						<%=booked.getArrivalDate() %>
                        </td>
                    </tr>
                    <tr>
                        <td>Departure Date</td>
                        <td>
                        <%=booked.getDepartureDate()%>
                    </td>
                    </tr>
                    
                    <tr>
                        <td>Room Type</td>
                        <td>
                        <%=booked.getRoomType()%>
                        </td>
                    </tr>
                    <tr>
                        <td>Price</td>
                        <td>
                        <%=booked.getPrice() %>
                        </td>
                    </tr>
                    <tr>
                        <td>Special request</td>
                        <td>
                        <%=booked.getSpecialrequest()%>
                        </td>
                    </tr>
                    <% if (String.valueOf(session.getAttribute("role")).equals("Admin")) {%>
                    <tr>
                     <td><a class="btn btn-warning" href="AdminHome.jsp">Make Another Booking</a></td>
                        <td>
                       <a class="btn btn-success" href="AdminProfile.jsp">My Profile</a>
                        </td>
                       
                    </tr>
                    <% } else { %>
                    <tr>
                     <td><a class="btn btn-warning" href="HomeSearch.jsp">Make Another Booking</a></td>
                        <td>
                       <a class="btn btn-success" href="MyProfile.jsp">My Profile</a>
                        </td>
                       
                    </tr>
                    <%} %>
                    
                </tbody>
            </table>
            </center>
</form>
</div>
</div>
</body>
</html>
<%}%>