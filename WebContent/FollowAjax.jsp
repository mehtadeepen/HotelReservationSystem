<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="apimanager.*,java.util.*,beans.*,dao.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%

String otheruser = (String)request.getParameter("otheruser");

String username = (String)session.getAttribute("userid");

UserManager userManager = new UserManager();

System.out.println(username);
User user = userManager.findByUsername(otheruser);

FollowManager followManager = new FollowManager();

Follow follow = null;

follow = followManager.findFollowing(username,otheruser);

Boolean b = false;

if (follow != null)
{
	
	
	int i = followManager.removeFollowing(username,otheruser);
	
	
}

else
{
	Follow follow2 = new  Follow();
	follow2.setFollowedID(otheruser);
	follow2.setFollowerID(username);
	
	followManager.createFollowing(follow2);
	b = true;
}

%>

</body>

<%if (b == false) { %>
                       <div id="follow-btn">
                        <input type="button" onclick="togglefollow('<%=otheruser %>');" class="btn btn-warning form-control" value="Follow"/>
                        </div>
                        <%} else { %>
                        <div id="follow-btn">
                        <input type="button"  onclick="togglefollow('<%=otheruser %>');" class="btn btn-primary form-control" value="UnFollow"/>
                        </div>
                        <%} %>
</html>