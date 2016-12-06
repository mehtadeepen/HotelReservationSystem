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
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">
  
  <link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/bootstrap-theme.css" rel="stylesheet">
<link href="css/bootstrap-theme.min.css" rel="stylesheet">
<script type="text/javascript">
function removeReview(i){
	
	$("#reviewID").val(i);
	
	var o = $("#reviewID").val();
//	alert(o);
	$("#deleteReview").submit();
}

</script>
</head>
<%
HotelManager hotelManager = new HotelManager();
List<Review> reviews = new ArrayList<Review>();

ReviewManager rvm = new ReviewManager();

reviews = (List<Review>)rvm.findAllReviews();
%>
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
            <li class="active"><a href="#">Manage Review</a></li>
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
	
	<div class="well well-sm">

 <div class="well well-sm">
           <h4>Reviews</h4>
	<%for (int j =0;j<reviews.size();j++)  {%>
	<div id="review_<%=reviews.get(j).getReviewId() %>" class="well well-sm">
	<h4><em><%=reviews.get(j).getTitle() %></em></h4>
	<p><em><%=reviews.get(j).getReview() %></em></p>
	<p>Hotel : <a href="http://localhost:8080/HRS/HotelInformation.jsp?hotelID=<%=reviews.get(j).getHotelId()%>"><em><%=hotelManager.findHotelname(reviews.get(j).getHotelId()) %>,
	                <%=hotelManager.findHotellocation(reviews.get(j).getHotelId()) %></em></a></p>
	<a class="btn btn-primary" onclick="removeReview('<%=reviews.get(j).getReviewId()%>');" >Delete</a>
	</div>
	
	<%} %>
	</div>
          </div>
          </div>
          
<form name="deleteReview"  id="deleteReview" action="AdminDeleteReview.jsp" method="post">
<input type="hidden" id="reviewID" name="reviewID" value="" />
</form>
</body>
</html>
<% } %>