<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import ="java.sql.*,beans.*,dao.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
    String username = (String)request.getParameter("uname");    
    String pwd = (String)request.getParameter("pass");
    
    UserManager userManager = new UserManager();
    
    User user = new User();
    
    user = userManager.findByUsername(username, pwd);
    
   // System.out.println(user.getFirstname() + "In JSP");
    
    if (user == null) {
    	out.println("Invalid password <a href='index.jsp'>try again</a>");
        
    } else 
    
    {
    	session.setAttribute("userid", user.getUsername());
    	session.setAttribute("name", user.getFirstname()+" "+user.getLastname());
    	session.setAttribute("role", user.getRoletype());
        //out.println("welcome " + userid);
        //out.println("<a href='logout.jsp'>Log out</a>");
        if(user.getRoletype().equals("User"))
        response.sendRedirect("HomeSearch.jsp");
        else if(user.getRoletype().equals("Admin"))
        	response.sendRedirect("AdminHome.jsp");
        
    }
%>
</body>
</html>