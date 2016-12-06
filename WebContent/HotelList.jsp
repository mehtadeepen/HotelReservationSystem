<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="apimanager.*,java.util.*,beans.*"%>
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
		String destination = (String) request.getParameter("destination");
		String arrivalDate = (String) request.getParameter("arrivalDate");
		String departureDate = (String) request
		.getParameter("departureDate");

		WebServiceClient client = new WebServiceClient();
		List<HotelInfo> hotels = client.hotellist(destination, arrivalDate,
		departureDate);

		System.out.println(hotels.size() + "In JSP");
		
		String appendImageURL = "http://images.travelnow.com/";
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
            <li class="active"><a href="#">Hotels in <%=destination %></a></li>
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
            <li class="active"><a href="#">Hotels in <%=destination %></a></li>
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
	<div class="well well=lg">
	<table class="table">
		<thead>
		
			<tr>
				<th>Image</th>
				<th>Name</th>
				<!-- <th>City</th>  -->
				<th>Address</th>
				<th>Description</th>
				<th>High Rate</th>
				<th>Low Rate</th>
				<th>Currency</th>
				<th>Details</th>
			</tr>
		</thead>
		<tbody>
			<%
				for (HotelInfo hotel : hotels) {
			%>
			<tr>
				<td><img src="<%=appendImageURL+hotel.getThumbnailURL()%>"></img></td>
				<td><%=hotel.getName()%></td>
				<!-- <td></td> -->
				<td><%=hotel.getAddress()%></td>
				<td><%=hotel.getShortDesc()%></td>
				<td><%=hotel.getHighrate()%></td>
				<td><%=hotel.getLowRate()%></td>
				<td><%=hotel.getCurrency()%></td>
				<td><form action="HotelInfo.jsp" method="post">
						<input name="hotelID" type="hidden" value="<%=hotel.getHotelID()%>"> <input
							type="submit" value="Info" class="btn btn-primary">
							<input name="arrivalDate" type="hidden" value="<%=hotel.getArrivalDate()%>">
							<input name="departureDate" type="hidden" value="<%=hotel.getDepartureDate()%>">
							
					</form></td>
			</tr>
			<%} %>
		</tbody>
	</table>
	</div></div>
	
</body>
</html>
<%} %>