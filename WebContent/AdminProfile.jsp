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
    var url ="http://localhost:8080/HotelReservationSystem/HotelInfo.jsp?hotelID=";
    
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
                 </div>
          </div>
            
</body>
</html>
<%
    }
%>