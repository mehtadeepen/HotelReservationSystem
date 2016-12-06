<%@page import="dao.RoomTypeManager"%>
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
String hotelID = (String) request.getParameter("hotelID");

Integer bookingID = Integer.parseInt((String) request.getParameter("bookingID")) ;


Booking booking = bookingManager.findByBookingID(bookingID);

RoomTypeManager rmt = new RoomTypeManager();

List<RoomType> types =  rmt.findAllRoomTypes();

WebServiceClient client = new WebServiceClient();
HotelInfo hotel = client.getHotelInfomation(hotelID);
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script>
  $(function() {
    $( "#datepicker1" ).datepicker({ dateFormat: 'mm/dd/yy' }).val();
    $( "#datepicker2" ).datepicker({ dateFormat: 'mm/dd/yy' }).val();
  });
  </script>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/bootstrap-theme.css" rel="stylesheet">
<link href="css/bootstrap-theme.min.css" rel="stylesheet">

<script src="js/bootstrap.js"></script>

<script>

function getprice()
{
	
	var type = $("#roomType").val();
	
	low = <%=hotel.getLowRate()%>;
	high = <%=hotel.getHighrate()%>;
	med = (low + high)/2;
	
	if(type == "Deluxe")
		{
		$("#price").val(low);
		}
	else if(type == "King")
		{
		$("#price").val(med);
		}
	else if(type == "Queen")
	{
		$("#price").val(high);
		}
	
	
	
}

$(document).ready(function() {

	$('#roomType').val(<%=booking.getRoomType()%>);

	});
    
	
	


</script>
</head>
<body>
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
            <li class="active"><a href="#">Edit Booking</a></li>
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
<div class="well well-lg">
<form action="AdminAfterBookingUpdate.jsp" method="post">
<center>
            <table class="table" width="30%" cellpadding="5" >
                <thead>
                    <tr>
                        <th colspan="2">Enter Information Here</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>First Name</td>
                        <td><input type="text" name="fname" value="<%=booking.getFirstname() %>" /></td>
                    </tr>
                    <tr>
                        <td>Last Name</td>
                        <td><input type="text" name="lname" value="<%=booking.getLastname() %>" /></td>
                    </tr>
                    <tr>
                        <td>Arrival Date</td>
                        <td><input type="text" readonly="readonly" id="datepicker1" name="arrival" value="<%=booking.getArrivalDate()%>" />
                        
			
                        </td>
                    </tr>
                    <tr>
                        <td>Departure Date</td>
                        <td>
                        <input type="text" readonly="readonly" id="datepicker2" name="ddate" value="<%=booking.getDepartureDate()%>" />
                   		
                    </td>
                    </tr>
                    
                    <tr>
                        <td>Room Type</td>
                        <td>
                        <select name="roomType" id="roomType"  onchange="getprice();">
                        <option value="-1">Select</option>
                        <%
                        for(RoomType t : types)
                        {
                        %>
                        <option  value="<%=t.getType()%>">
                        <%=t.getType()%>
                        </option>
                        <%} %>
                        </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Price</td>
                        <td><input type="text" id="price" name="price" value="<%=booking.getPrice()  %>" readonly="readonly"/></td>
                    </tr>
                    <tr>
                        <td>Special request</td>
                        <td><input type="text" name="srequest" value="<%=booking.getSpecialrequest() %>" /></td>
                    </tr>
                    <tr>
                     
                        <td colspan="2">
                        <input type="hidden" value="<%=bookingID%>" name="bookingID"/>
                        <input class="btn btn-success" type="submit" value="Update Booking" /></td>
                       
                    </tr>
                    
                </tbody>
            </table>
            </center>
</form>
</div>
</div>
</body>
</html>
<%
    }
%>