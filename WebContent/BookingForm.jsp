<%@page import="dao.RoomTypeManager"%>
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
<%

UserManager userManager = new UserManager();
List<User> users = userManager.findAllUsers();

String hotelID = (String) request.getParameter("hotelID");
String arrivalDate = (String) request.getParameter("arrivalDate");
String departureDate = (String) request
.getParameter("departureDate");

RoomTypeManager rmt = new RoomTypeManager();

List<RoomType> types =  rmt.findAllRoomTypes();
WebServiceClient client = new WebServiceClient();
HotelInfo hotel = client.getHotelInfomation(hotelID);
hotel.setArrivalDate(arrivalDate);
hotel.setDepartureDate(departureDate);


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
</script>
</head>
<body>
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
<form action="ConfirmBooking.jsp" method="post">
<center>
            <table class="table"  width="30%" cellpadding="5">
                <thead>
                    <tr>
                        <th colspan="2">Enter Information Here</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>First Name</td>
                        <td><input class="form-control" type="text" name="fname" value="" /></td>
                    </tr>
                    <tr>
                        <td>Last Name</td>
                        <td><input class="form-control" type="text" name="lname" value="" /></td>
                    </tr>
                    <tr>
                        <td>Arrival Date</td>
                        <td><input class="form-control" type="text" readonly="readonly"  name="arrival" value="<%=arrivalDate%>" />
                        <input name="hotelID" value="<%=hotelID%>" type="hidden" /> 
                        <input
				name="arrivalDate" type="hidden" value="<%=arrivalDate%>">
			
                        </td>
                    </tr>
                    <tr>
                        <td>Departure Date</td>
                        <td>
                        <input class="form-control" type="text" readonly="readonly" name="ddate" value="<%=departureDate%>" />
                   		<input name="departureDate" type="hidden" value="<%=departureDate%>" />
                    </td>
                    </tr>
                    
                    <tr>
                        <td>Room Type</td>
                        <td>
                        <select class="form-control" name="roomType" id="roomType" onchange="getprice();">
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
                        <td><input class="form-control" type="text" id="price" name="price" value="" readonly="readonly"/></td>
                    </tr>
                    <tr>
                        <td>Special request</td>
                        <td><input class="form-control" type="text" name="srequest" value="" /></td>
                    </tr>
                    <% if (String.valueOf(session.getAttribute("role")).equals("Admin")) {%>
                    <tr>
                     <td>Book for User : </td>
                        <td>
                       
                        <select name="extusername" id="extusername">
                         <%for(User u1 : users) {%>
                        <option value="<%=u1.getUsername()%>"><%=u1.getUsername()%></option>
                       <%} %>
                        </select>
                        
                        </td>
                    
                    </tr>
                    <%} %>
                    <tr>
                     <td><input class="btn btn-danger form-control" type="reset" value="Reset" /></td>
                        <td><input class="btn btn-success form-control" type="submit" value="Book" /></td>
                       
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