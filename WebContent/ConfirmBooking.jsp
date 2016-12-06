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
<body>
<%
   
    String firstname = (String)request.getParameter("fname");
    String lastname = (String)request.getParameter("lname");
   
    String price = (String)request.getParameter("price");
    String roomType = (String)request.getParameter("roomType");
    String specialrequest = (String)request.getParameter("srequest");
    String hotelID = (String) request.getParameter("hotelID");
    String arrivalDate = (String) request.getParameter("arrivalDate");
    String departureDate = (String) request
    .getParameter("departureDate");
    String extusername = (String)request.getParameter("extusername");
   
    Booking booking = new Booking();
    booking.setFirstname(firstname);
    booking.setLastname(lastname);
    booking.setPrice(price);
    if (extusername == null)
    booking.setUsername((String)session.getAttribute("userid"));
    else
    	booking.setUsername(extusername);
    booking.setRoomType(roomType);
    booking.setHotelID(hotelID);
    booking.setArrivalDate(arrivalDate);
    booking.setDepartureDate(departureDate);
    booking.setSpecialrequest(specialrequest);
    
    System.out.println(booking.toString());
    
    HotelManager hotelManager = new HotelManager();
    
    Hotel hotel = hotelManager.findHotel(hotelID);
    
    if(hotel != null)
	{
		System.out.println(hotel.getHotelId());
		
		BookingManager bookingManager = new BookingManager();
		
		Booking booked = bookingManager.createBooking(booking);
		
		request.setAttribute("hotel", hotel);
		request.setAttribute("booking", booked);
		 getServletContext().getRequestDispatcher("/BookingDetail.jsp").forward(request,response);
		
		
	}
	else
		{
		WebServiceClient client = new WebServiceClient();
		HotelInfo hotelinfo  = new HotelInfo();
		hotelinfo = client.getHotelInfomation(hotelID);
		
		Hotel newhotel = new Hotel();
		newhotel.setHotelId(hotelinfo.getHotelID());
		newhotel.setName(hotelinfo.getName());
		newhotel.setLocation(hotelinfo.getCity());
		
		newhotel = hotelManager.createHotel(newhotel);
		
        BookingManager bookingManager = new BookingManager();
		
		Booking booked = bookingManager.createBooking(booking);
		
		request.setAttribute("hotel", newhotel);
		request.setAttribute("booking", booked);
		 getServletContext().getRequestDispatcher("/BookingDetail.jsp").forward(request,response);
	
		}
		
        //response.sendRedirect("index.jsp");
    
    
%>
</body>
</html>
<%}%>