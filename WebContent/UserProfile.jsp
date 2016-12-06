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




<%
HotelManager hotelManager = new HotelManager();
String otheruser = (String)request.getParameter("otheruser");

String username = (String)session.getAttribute("userid");

UserManager userManager = new UserManager();

System.out.println(username);

ReviewManager rvm = new ReviewManager();

List<Review> reviews = new ArrayList<Review>();

reviews = (List<Review>)rvm.findAllReviewsForUser(otheruser);

User user = userManager.findByUsername(otheruser);

FollowManager followManager = new FollowManager();

Follow follow = new Follow();

follow = followManager.findFollowing(username,otheruser);

Boolean b = false;

if (follow != null)
{
	b = true;
}

%>
<script type="text/javascript">

function togglefollow(i){
	
	var other = i;
	var username = "<%=username%>";
	
	$.ajax({
        url: "FollowAjax.jsp",
        type: "POST",
        data : {
        	otheruser : other,
        	username : username
        	
        },
        success : function(response){
             var content = $(response).filter('div#follow-btn').html();
         //   console.log(content);
                         $("#follow-btn").html(content);
                     
             }
    });
	
	
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
            <li class="active"><a href="#">User Profile</a></li>
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
                        <td colspan="2">
                        
                        <%if (b == false) { %>
                       <div id="follow-btn">
                        <input type="button" onclick="togglefollow('<%=otheruser %>');" class="btn btn-warning form-control" value="Follow"/>
                        </div>
                        <%} else { %>
                        <div id="follow-btn">
                        <input type="button"  onclick="togglefollow('<%=otheruser %>');" class="btn btn-primary form-control" value="UnFollow"/>
                        </div>
                        <%} %>
                        </td>
                    </tr>
                    
                </tbody>
            </table>
            </center>
            </div>
            <div class="well well-sm">
           <h4>Reviews</h4>
	<%for (int j =0;j<reviews.size();j++)  {%>
	<div id="review_<%=reviews.get(j).getReviewId() %>" class="well well-sm">
	<h4><em><%=reviews.get(j).getTitle() %></em></h4>
	<p><em><%=reviews.get(j).getReview() %></em></p>
	<p>Hotel : <a href="http://localhost:8080/HRS/HotelInformation.jsp?hotelID=<%=reviews.get(j).getHotelId()%>"><em><%=hotelManager.findHotelname(reviews.get(j).getHotelId()) %>,
	                <%=hotelManager.findHotellocation(reviews.get(j).getHotelId()) %></em></a></p>
	</div>
	
	<%} %>
	</div>
          </div>
          </div>
            
</body>
</html>
<%} %>