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

<style type="text/css">
.table td {
   text-align: center;   
}

.table th {
   text-align: center;   
}
</style>


<%

String username = (String)session.getAttribute("userid");

UserManager userManager = new UserManager();

User user = userManager.findByUsername(username);

BookingManager bookingManager = new BookingManager();

List<Booking> bookings = bookingManager.findAllBookingsForUser(username);

HotelManager hotelManager = new HotelManager();

List<String> locations = new LinkedList<String>();


locations = bookingManager.findallhotellocationforUser(username);

ReviewManager rvm = new ReviewManager();

List<Review> reviews = new ArrayList<Review>();

reviews = (List<Review>)rvm.findAllReviewsForUser(username);

FollowManager followManager = new FollowManager();

List<Follow> followers = followManager.findAllFollowersForUser(username);

List<Follow> followed = followManager.findFollowingOfUser(username);




%>
<script type="text/javascript">

function submitOtherUser(otheruser){
	
	
	$("#otheruser").val(otheruser);
	
	var o = $("#otheruser").val();
	$("#userInfo").submit();
}

function gotohotel(id)
{
    var url ="http://localhost:8080/HotelReservationSystem/HotelInformation.jsp?hotelID=";
    
    alert(url);
    url = url
    //window.location.href = url;
}
function ajaxBookingdetails(){
	
	var location = $("#location").val();
	var username = "<%= username%>";
	
	if (location != -1)
	{
		$.ajax({
            url: "MyProfileAjax.jsp",
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
            <li class="active"><a href="#">Basic Profile</a></li>
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
	<div class="container" style="padding-top: 70px">
	<div class="well well=lg">
	<div class="well well=sm">
<center>

            <table class="table" width="30%" cellpadding="5">
                <thead>
                    <tr>
                        <th colspan="2">Profile Details</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>First Name</td>
                        <td><%=user.getFirstname() %></td>
                    </tr>
                    <tr>
                        <td>Last Name</td>
                        <td><%=user.getLastname()%></td>
                    </tr>
                    <tr>
                        <td>DOB</td>
                        <td><%=user.getDob()%></td>
                    </tr>
                                        <tr>
                        <td>
                        <form method="post" action="EditProfile.jsp">
                        <input type="hidden" value="<%=username %>"/> 
                        <input type="submit" class="btn btn-primary" value="Edit"/>
                        </form>
                        </td>
                        <td><form method="post" action="ChangePassword.jsp">
                        <input type="hidden" value="<%=username %>"/> 
                        <input type="submit" class="btn btn-primary" value="Change Password"/>
                        </form></td>
                    </tr>
                    
                </tbody>
            </table>
            </center>
            </div>
            <br>
            <br>
            <%if (locations.size()> 0) { %>
            <nav class="navbar navbar-default" role="navigation">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">Filter By Location</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      
      <form class="navbar-form navbar-left" role="search">
        <div class="form-group">
          <select onchange="ajaxBookingdetails();" class="form-control" id="location">
          <option value="-1">Select Location</option>
          <%for ( String s : locations) { %>
          <option value="<%=s%>"><%=s %>
          </option>
          <%} %>
          </select>
        </div>
      
      </form>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="MyProfile.jsp">All Bookings</a></li>
        
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
<%} %>
<br>
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
            
            <h4>Reviews</h4>
	<%for (int j =0;j<reviews.size();j++)  {%>
	<div id="review_<%=reviews.get(j).getReviewId() %>" class="well well-sm">
	<h4><em><%=reviews.get(j).getTitle() %></em></h4>
	<p><em><%=reviews.get(j).getReview() %></em></p>
	<p>Hotel : <a href="http://localhost:8080/HRS/HotelInformation.jsp?hotelID=<%=reviews.get(j).getHotelId()%>"><em><%=hotelManager.findHotelname(reviews.get(j).getHotelId()) %>,
	                <%=hotelManager.findHotellocation(reviews.get(j).getHotelId()) %></em></a></p>
	</div>
	
	<%} %>
	
	<div id="followers" class="well well-sm">
	<table class="table">
	
	<thead>
	<tr>
	<th colspan="2" align="center">
	Followers
	</th>
	</tr>
	<tr>
	<th>
	Username
	</th>
	<th>
	Name
	</th>
	</tr>
	</thead>
	<%for ( Follow f : followers) {%>
	<tbody>
	<tr>
	<td>
	<a onclick="submitOtherUser('<%=f.getFollowerID() %>');"><%=f.getFollowerID() %></a>
	</td>
	<td>
	<%=userManager.findNameByUsername(f.getFollowerID()) %>
	</td>
	</tr>
	</tbody>
	<%} %>
	</table>
	</div>
	
	
	<div id="following" class="well well-sm">
	<table class="table" align="center">
	
	<thead>
	<tr>
	<th colspan="2" align="center">
	Following
	</th>
	</tr>
	<tr>
	<th>
	Username
	</th>
	<th>
	Name
	</th>
	</tr>
	</thead>
	<%for ( Follow f2 : followed) {%>
	<tbody>
	
	<tr>
	<td>
	<a onclick="submitOtherUser('<%=f2.getFollowedID() %>');"><%=f2.getFollowedID()%></a>
	</td>
	<td>
	<%=userManager.findNameByUsername(f2.getFollowedID()) %>
	</td>
	</tr>
	</tbody>
	<%} %>
	</table>
	
	</div>
	<form action="UserProfile.jsp" id="userInfo" name="userInfo" method="post">
	<input name="otheruser" id="otheruser" value="" type="hidden"/>
	</form>
          </div>
          </div>
            
</body>
</html>
<%} %>