<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="apimanager.*,java.util.*,beans.*,dao.*"%>
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
<%
  String username = (String)request.getParameter("username");
  String hotelIDajax = (String)request.getParameter("hotelIDajax");
  String title = (String)request.getParameter("title");
  String review = (String)request.getParameter("review");
  String rating = (String)request.getParameter("rating");
  
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
  ReviewManager rvm = new ReviewManager();
  
  Review r = new Review();
  
  r.setHotelId(hotelIDajax);
  r.setUserName(username);
  r.setTitle(title);
  r.setReview(review);
  
  rvm.createReview(r);
  
  
  
  
  RateValueManager rateValueManager = new RateValueManager();
  
  List<RateValue> values = rateValueManager.findAllRateValues();
  
  
  
  List<Review> reviews = new ArrayList<Review>();
  
  reviews = (List<Review>)rvm.findAllReviewsForHotel(hotelIDajax);
  
  
  
  
  
  
  

%>
<body>
<br>
	<div id="all-reviews" class="well well-lg">
	<h4>Reviews</h4>
	<%for (int j =0;j<reviews.size();j++)  {%>
	<div id="review_<%=reviews.get(j).getReviewId() %>" class="well well-lg">
	<h4><em><%=reviews.get(j).getTitle() %></em></h4>
	<p><em><%=reviews.get(j).getReview() %></em></p>
	
	<p><em>User : <%= reviews.get(j).getUserName()%></em></p>
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

</body>
</html>