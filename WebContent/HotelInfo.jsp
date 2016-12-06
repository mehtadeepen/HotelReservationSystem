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
	 String username = (String)session.getAttribute("userid");
	String hotelID = (String) request.getParameter("hotelID");
String arrivalDate = (String) request.getParameter("arrivalDate");
String departureDate = (String) request
.getParameter("departureDate");

RatingManager manager = new RatingManager();



Rating  getrating = manager.findAllRatingsForHotelandUser(username,hotelID);

Boolean r = false;

if ( getrating != null)
	r = true;

List<Rating> avgrat = manager.findAllRatingsForHotel(hotelID);
Integer averagerating = 0;

if(avgrat.size()>0){
	
	for(Rating ra : avgrat){
		
		averagerating += ra.getValue();
	}
	
	averagerating = averagerating/avgrat.size();
}

HotelManager hotelManager = new  HotelManager();

	WebServiceClient client = new WebServiceClient();
	HotelInfo hotel = client.getHotelInfomation(hotelID);
	hotel.setArrivalDate(arrivalDate);
	hotel.setDepartureDate(departureDate);
	

	System.out.println("In HotelInfo JSP");
	
	String appendImageURL = "http://images.travelnow.com/";
	
	int i = 0;
	
	 
	  String hotelIDajax = (String)request.getParameter("hotelIDajax");
	  
	  Likes l = new Likes();
	  
	  LikeManager likeManager = new LikeManager();
	  
	  l = likeManager.findLike(username, hotelID);
	  
	  Boolean b ;
	  
	  if(l == null)
	  {
		  b = true;
		  System.out.println("No like found");
	  }
	  else
		  b = false;
	  
	  RateValueManager rateValueManager = new RateValueManager();
	  
	  List<RateValue> values = rateValueManager.findAllRateValues();
	  
	  ReviewManager rvm = new ReviewManager();
	  
	  List<Review> reviews = new ArrayList<Review>();
	  
	  reviews = (List<Review>)rvm.findAllReviewsForHotel(hotelID);
	  
	  System.out.println(reviews.size());
	  
	  
	  
	 
	  
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
<%if(getrating != null){ %>
<script type="text/javascript">
$( document ).ready(function() {
    $("#ratingvalue").val("<%=getrating.getValue()%>");
});
</script>
<% } %>
</head>
<script>
	function submitOtherUser(otheruser){
		
		
		$("#otheruser").val(otheruser);
		
		var o = $("#otheruser").val();
		$("#userInfo").submit();
	}
	
	function ajaxaddRating(){
		
		var rating = $("#ratingvalue").val();
		var hotelIDajax =$("#hotelIDajax").val();
	    var username = $("#username").val();
		if(rating != -1)
			{
			 $.ajax({
			        url: "RateIt.jsp",
			        type: "POST",
			        data : {
			            username : username,
			            hotelIDajax : hotelIDajax,
			            rating : rating
			        },
			        success : function(response){
			             var content = $(response).filter('div#rating').html();
			         
			                         $("#rating").html(content);
			                         
			             }
			    });
			
			
			}
	}
	
    function like()
    {  //alert("Hi")
        var hotelIDajax =$("#hotelIDajax").val();
     	var username = $("#username").val();
       // alert(hotelIDajax);
      //  alert(username);
     
        $.ajax({
        url: "Like.jsp",
        type: "POST",
        data : {
            username : username,
            hotelIDajax : hotelIDajax
        },
        success : function(response){
             var content = $(response).filter('div#search-results3').html();
         
                         $("#search-results3").html(content);
                         findDataAndNotifyResponse(response);
             }
    });
    }
    
    
    function ajaxAddReview(){
    	
        var hotelIDajax =$("#hotelIDajax").val();
      	var username = $("#username").val();
    	var title = $("#title").val();
    	var review = $.trim($("textarea").val());
    	var rating = $("#rating").val();
    	
    	$.ajax({
            url: "Review.jsp",
            type: "POST",
            data : {
            	hotelIDajax : hotelIDajax,
            	username : username,
            	title : title,
            	review : review,
            	rating : rating
            },
            success : function(response){
                 var content = $(response).filter('div#all-reviews').html();
             
                             $("#all-reviews").html(content);
                         
                 }
        });
    	
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
	<center>
	<div class="well well-sm" style="width: 350px; height: 300px;">
	
		<div id="carousel-example-generic" class="carousel slide"
			data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<%for ( i = 0; i < 10;i++){ %>
				<li data-target="#carousel-example-generic" data-slide-to="<%=i %>"
					class="active"></li>
				<%} %>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
				<%for ( i = 0; i < hotel.getImagesURL().size();i++) { %>
				<%if (i==1)
    	{%>
				<div class="item active">
					<img src="<%=hotel.getImagesURL().get(i) %>" alt="..."
						class="img-rounded" style="width: 300px; height: 250px;">
					<div class="carousel-caption"></div>
				</div>
				<%} else {%>
				<div class="item">
					<img src="<%=hotel.getImagesURL().get(i) %>" alt="..."
						class="img-rounded" style="width: 300px; height: 250px;">
					<div class="carousel-caption"></div>
				</div>
				<%} }%>

			</div>

		</div>

		<!-- Controls -->
		<a style="width: 1082px; height: 453px;" class="carousel-control"
			href="#carousel-example-generic" role="button" data-slide="prev">
			<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
			<span class="sr-only">Previous</span>
		</a> <a style="width: 1609px; height: 453px;" class="carousel-control"
			href="#carousel-example-generic" role="button" data-slide="next">
			<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>

	</div>
	</center>
	<div class="jumbotron">
		<h1><%=hotel.getName() %></h1>
		<div id="change-rating"><h3>
		<%if (averagerating == 0) { %>
		<em>Average Rating : -/5 </em>
		<%} else { %>
		<em>Average Rating : <%=averagerating %>/5 </em>
		<%} %>
		</h3></div>
		<%=hotel.getPropertyDesc() %>

		<form method="post" action="BookingForm.jsp">
			<input name="hotelID" value="<%=hotelID%>" type="hidden" /> <input
				name="arrivalDate" type="hidden" value="<%=hotel.getArrivalDate()%>">
			<input name="departureDate" type="hidden"
				value="<%=hotel.getDepartureDate()%>"> <input
				class="btn btn-primary form-control"   name="submit" value="Book" type="submit" />
		</form>
		<br>
		<% if (String.valueOf(session.getAttribute("role")).equals("User")) {%>
		<form method="post" action="index.jsp">
			<input name="hotelID" value="<%=hotelID%>" type="hidden" /> 
			<%if (b == true) { %>
			<div id="search-results3">
			<input
				class="btn btn-success form-control" name="submit" value="Like" type="button" onclick="like();" />
			</div>
			<%} else { %>
			<div id="search-results3">
<input class="btn btn-warning form-control"  name="submit" value="UnLike" type="button" onclick="like();" />
</div>
<%} %>
		</form>
		
<input name="hotelIDajax" id="hotelIDajax" value="<%=hotelID%>" type="hidden" />
<input name="username"  id="username" value="<%=(String)session.getAttribute("userid")%>" type="hidden" />

	</div>
	<div id="rating" class="span4">
   		<label>Rate It :</label>
      <select
      <%if(r == true) { %>
      disabled="disabled"
      <%} %>
       onchange="ajaxaddRating();" class="form-control" id="ratingvalue" name="rating">
      <option value="-1">Rate it.!!</option>
      <%for(RateValue rv : values) { %>
     
      <option value="<%=rv.getValue()%>"><%=rv.getValue() %></option>
     
      <%} %>
      </select>
   
  </div>
	<br>
	<div id="all-reviews" class="well well-sm">
	<h4>Reviews</h4>
	<%if(reviews.size() == 0) { %>
	<p>No Reviews Found</p>
	<%} %>
	<%for (int j =0;j<reviews.size();j++)  {%>
	<div id="review_<%=reviews.get(j).getReviewId() %>" class="well well-sm">
	<h4><em><%=reviews.get(j).getTitle() %></em></h4>
	<p><em><%=reviews.get(j).getReview() %></em></p>
	<%if (!(String.valueOf(session.getAttribute("userid")).equals(reviews.get(j).getUserName()))) {%>
	<p><a onclick="submitOtherUser('<%= reviews.get(j).getUserName()%>');"><em>User : <%= reviews.get(j).getUserName() %></em></a></p>
	<% } else { %>
	<p><em>User : <%= reviews.get(j).getUserName() %></em></p>
	<%} %>
	</div>
	
	<%} %>
	<div>
	<h4>Add Reviews</h4>

  <div class="form-group">
    <label for="exampleInputEmail1">Title</label>
    <input type="text" class="form-control" id="title" placeholder="Title">
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Review</label>
    <textarea  class="form-control" id="review">
    </textarea>
  </div>
  
  
  <button type="submit" class="btn btn-success form-control" onclick="ajaxAddReview();">Submit</button>

	</div>
	</div>
	</div>
	<%} %>
	</div>
	<form action="UserProfile.jsp" id="userInfo" name="userInfo" method="post">
	<input name="otheruser" id="otheruser" value="" type="hidden"/>
	</form>
</body>


</html>
<%
    }
%>