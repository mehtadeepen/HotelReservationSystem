<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ page import="apimanager.*,java.util.*,beans.*,dao.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
  String username = (String)request.getParameter("username");
  String hotelIDajax = (String)request.getParameter("hotelIDajax");
  
  Likes l = new Likes();
  
  LikeManager likeManager = new LikeManager();
  
  l = likeManager.findLike(username, hotelIDajax);
  
  Boolean b = false;
  
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
  
  if(l == null)
  {
	  
	  likeManager.createLike(new Likes(username,hotelIDajax));
	  
	  b = true;
  }
  else
  {
	 int i = likeManager.removeLike(username, hotelIDajax);
	 
	 
  }
  
  
  
  
  

%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/bootstrap-theme.css" rel="stylesheet">
<link href="css/bootstrap-theme.min.css" rel="stylesheet">
<script type="text/javascript">
</script>
</head>

<body>
<%if (b == true) {%>
<div id="search-results3">
<input class="btn btn-warning form-control"  name="submit" value="UnLike" type="button" onclick="like();" />
</div>
<% } else { %>
<div id="search-results3">
<input class="btn btn-success form-control"  name="submit" value="Like" type="button" onclick="like();" />
</div>
<% } %>
</body>
</html>