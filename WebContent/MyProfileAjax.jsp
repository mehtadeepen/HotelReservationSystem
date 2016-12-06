<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="apimanager.*,java.util.*,beans.*,dao.*"%>
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




<%

String username = (String)request.getParameter("username");

String ajaxlocation = (String)request.getParameter("location");

UserManager userManager = new UserManager();

User user = userManager.findByUsername(username);

BookingManager bookingManager = new BookingManager();

List<Booking> bookings = bookingManager.findAllBookingsForUser(username);

HotelManager hotelManager = new HotelManager();

List<String> locations = new LinkedList<String>();


locations = bookingManager.findallhotellocationforUser(username);




%>
<script type="text/javascript">
function ajaxBookingdetails(){
	
	var location = $("#location").val();
	var username = <%= username%>;
	
	if (location != -1)
	{
		$.ajax({
            url: "MyProfile.jsp",
            type: "POST",
            data : {
            	location : location,
            	username : username
            	
            },
            success : function(response){
                 var content = $(response).filter('div#booking-details').html();
             //   console.log(content);
                             $("#booking-details").html(content);
                          //   findDataAndNotifyResponse(response);
              //  $('input#txtEduInst').attr('data-source',instload);
               //  $('.typeahead').typeahead();
               // $('input#txtEduInst').typeahead();
                 }
        });
		
		
	}
}
</script>
</head>
<body>
<div id="booking-details" class="well well=sm">
            <table style="left:-1" class="table" width="30%" cellpadding="5">
                <thead>
                    <tr>
                        <th colspan="12">Booking Details</th>
                    </tr>
                    <tr>
                    <th> Booking ID </th>
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
                <%if(hotelManager.findHotellocation(b.getHotelID()).equals(ajaxlocation)) {%>
                <% if(b.getActive() == 1) { %>
                <tr>
                <% } else { %>
                <tr class="danger">
                <%} %>
                
                 <td><%=b.getBookingID() %></td>
                <td><a href="http://localhost:8080/HRS/HotelInformation.jsp?hotelID=<%=b.getHotelID()%>"><%=hotelManager.findHotelname(b.getHotelID()) %></a></td>
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
                <form action="UpdateBooking.jsp" method="POST">
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
                <form action="MyProfileAfterCancel.jsp" method="POST">
                <input type="hidden" name="bookingID" value="<%= b.getBookingID()%>"/>
                
                <input type="submit" class="btn btn-danger" value="Cancel"/>
                </form> 
                <%} else { %>
                Cancelled
                <%} %>
                </td>
                </tr>
                <%} } } else {%>
                <tr>
                <td colspan="12">
                No Records Found
                </td>
                </tr>
                <%} %>
                </tbody>
            </table>
            </div>
          
            
</body>
</html> 