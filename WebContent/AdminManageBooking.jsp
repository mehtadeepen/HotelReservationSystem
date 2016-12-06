<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="apimanager.*,java.util.*,beans.*,dao.*"%>
    <%
    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "") || (session.getAttribute("role") == "User")) {
%>
You are not logged in<br/>
<a href="index.jsp">Please Login</a>
<%} else {%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<%
BookingManager bookingManager = new BookingManager();

List<Booking> bookings = bookingManager.findAllBookings();

HotelManager hotelManager = new HotelManager();

%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/bootstrap-theme.css" rel="stylesheet">
<link href="css/bootstrap-theme.min.css" rel="stylesheet">
<script src="js/jquery-1.11.1.min.js"></script>

<style type="text/css">
.table td {
   text-align: center;   
}

.table th {
   text-align: center;   
}
</style>
</head>

 <body><nav class="navbar navbar-default navbar-fixed-top" role="navigation">
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
            <li class="active"><a href="#">Manage Booking</a></li>
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
<div class="container" style="padding-top: 70px">
    <center>
    <div class="well well-lg" >
  <div id="booking-details" class="well well-sm">
            <table class="table"  cellpadding="5" width="30%">
                <thead>
                    <tr>
                        <th colspan="12">Booking Details</th>
                    </tr>
                    <tr>
                    <th> Booking ID </th>
                    <th> Username </th>
                    <th> Hotel Name </th>
                    <th> Location </th>
                    <th> First Name </th>
                    <th> Last Name </th>
                    <th> Check In Date </th>
                    <th> Check Out Date </th>
                    <th> Room Type</th>
                    <th> Price </th>
                    <th> Status </th>
                    <th> Edit </th>
                    <th> Cancel </th>
                    </tr>
                </thead>
                
                <tbody>
                <% if (bookings.size() > 0 ) {
                for (Booking b : bookings) {%>
                <% if(b.getActive() == 1) { %>
                <tr>
                <% } else { %>
                <tr class="danger">
                <%} %>
                
                 <td><%=b.getBookingID() %></td>
                 <td><%=b.getUsername() %></td>
                <td><%=hotelManager.findHotelname(b.getHotelID()) %></td>
                <td><%=hotelManager.findHotellocation(b.getHotelID()) %></td>
               
                <td><%=b.getFirstname() %></td>
                <td><%=b.getLastname() %></td>
                <td><%=b.getArrivalDate() %></td>
                <td><%=b.getDepartureDate() %></td>
                <td><%=b.getRoomType() %></td>
                <td><%=b.getPrice() %></td>
                <td><% if(b.getActive() == 1) { %>
                Active 
                <%} else { %>
                Cancelled
                <%} %>
                </td>
                <td>
                <% if(b.getActive() == 1) { %>
                <form action="AdminUpdateBooking.jsp" method="POST">
                <input type="hidden" name="bookingID" value="<%= b.getBookingID()%>"/>
                <input type="hidden" name="hotelID" value="<%= b.getHotelID()%>"/>
                <input type="submit" class="btn btn-warning" value="Update"/>
                </form> 
                <%} else { %>
                Cancelled
                <%} %>
                </td>
                <td>
                <% if(b.getActive() == 1) { %>
                <form action="AdminCancelBooking.jsp" method="POST">
                <input type="hidden" name="bookingID" value="<%= b.getBookingID()%>"/>
                
                <input type="submit" class="btn btn-danger" value="Cancel"/>
                </form> 
                <%} else { %>
                Cancelled
                <%} %>
                </td>
                </tr>
                <%} } else {%>
                <tr>
                <td colspan="12">
                No Records Found
                </td>
                </tr>
                <%} %>
                </tbody>
            </table>
            </div>
          </div>
          </center>
          </div>
           
           
</body>
</html>
<%}%>