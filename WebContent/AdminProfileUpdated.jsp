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
</head>
<body>
<%
String fname = (String)request.getParameter("fname");
String lname = (String)request.getParameter("lname");
String dob = (String)request.getParameter("dob");

User updateUser = new User();
updateUser.setFirstname(fname);
updateUser.setLastname(lname);
updateUser.setDob(dob);
updateUser.setUsername((String)session.getAttribute("userid"));

UserManager userManager = new UserManager();

User newuser = userManager.updateByUsername(updateUser);

newuser = userManager.findByUsername((String)session.getAttribute("userid"));

response.sendRedirect("MyProfile.jsp");

%>
</body>
</html>
<%
    }
%>