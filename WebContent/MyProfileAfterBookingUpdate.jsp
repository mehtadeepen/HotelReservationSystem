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
</head>
<%
   
	Integer bookingID = Integer.parseInt((String) request.getParameter("bookingID")) ;
    String firstname = (String)request.getParameter("fname");
    String lastname = (String)request.getParameter("lname");
   
    String price = (String)request.getParameter("price");
    String roomType = (String)request.getParameter("roomType");
    String specialrequest = (String)request.getParameter("srequest");
    String hotelID = (String) request.getParameter("hotelID");
    String arrivalDate = (String) request.getParameter("arrival");
    String departureDate = (String) request
    .getParameter("ddate");
   
    Booking booking = new Booking();
    booking.setBookingID(bookingID);
    booking.setFirstname(firstname);
    booking.setLastname(lastname);
    booking.setPrice(price);
    booking.setUsername((String)session.getAttribute("userid"));
    booking.setRoomType(roomType);
    booking.setHotelID(hotelID);
    booking.setArrivalDate(arrivalDate);
    booking.setDepartureDate(departureDate);
    booking.setSpecialrequest(specialrequest);
    
    BookingManager bookingManager = new BookingManager();
    
    bookingManager.updateByBookingID(booking);
    
    response.sendRedirect("MyProfile.jsp");
    %>
<body>

</body>
</html>
<%} %>