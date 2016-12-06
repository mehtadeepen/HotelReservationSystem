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
    String fname = (String)request.getParameter("fname");
    String lname = (String)request.getParameter("lname");
    String dob = (String)request.getParameter("dob");
    
    
    UserManager dao = new UserManager();
    User u1 = new User(username,pwd,fname,lname,dob,"User");
    User u2 = dao.createUser(u1);
    
    if (u2 != null) {
        //session.setAttribute("userid", user);
      //  response.sendRedirect("HomeSearch.jsp");
        out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
    } else {
        response.sendRedirect("index.jsp");
    }
%>
</body>
</html>