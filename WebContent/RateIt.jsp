<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="apimanager.*,java.util.*,beans.*,dao.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%

String username = (String)request.getParameter("username");
String hotelIDajax = (String)request.getParameter("hotelIDajax");
Integer ratingvalue = Integer.parseInt(String.valueOf(request.getParameter("rating")));

RateValueManager rateValueManager = new RateValueManager();

List<RateValue> values = rateValueManager.findAllRateValues();

HotelManager hotelManager = new HotelManager();

Hotel hotel = hotelManager.findHotel(hotelIDajax);

if(hotel == null)
	{
	    WebServiceClient client = new WebServiceClient();
		HotelInfo hotelinfo  = new HotelInfo();
		hotelinfo = client.getHotelInfomation(hotelIDajax);
		
		Hotel newhotel = new Hotel();
		newhotel.setHotelId(hotelinfo.getHotelID());
		newhotel.setName(hotelinfo.getName());
		newhotel.setLocation(hotelinfo.getCity());
		
		newhotel = hotelManager.createHotel(newhotel);
		
	}

RatingManager manager = new RatingManager();

Rating rating = new Rating();


	
	rating.setHotelId(hotelIDajax);
	rating.setUserName(username);
	rating.setValue(ratingvalue);
	Rating getrating = manager.createRating(rating);
	



%>
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
<div id="rating" class="span4">
   
      <select disabled="disabled" class="form-control" id="ratingvalue" name="rating">
      <option value="-1">Rate it.!!</option>
      <%for(RateValue rv : values) { %>
     
      <option value="<%=rv.getValue()%>"><%=rv.getValue() %></option>
     
      <%} %>
      </select>
   <script type="text/javascript">
$( document ).ready(function() {
    $("#ratingvalue").val("<%=getrating.getValue()%>");
});
</script>
  </div>
</body>
</html>