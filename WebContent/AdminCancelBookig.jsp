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
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>

<%
BookingManager bookingManager = new BookingManager();

Integer bookingID = Integer.parseInt((String) request.getParameter("bookingID")) ;


bookingManager.deleteByBookingID(bookingID);



String username = (String)session.getAttribute("userid");

UserManager userManager = new UserManager();

User user = userManager.findByUsername(username);



List<Booking> bookings = bookingManager.findAllBookingsForUser(username);

HotelManager hotelManager = new HotelManager();


response.sendRedirect("AdminProfile.jsp");
%>
<body>

</body>
</html>
<%}
%>