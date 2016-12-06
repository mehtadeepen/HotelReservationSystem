<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="apimanager.*,java.util.*,beans.*,dao.*"%>
 <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "") || (session.getAttribute("role") == "User")) {
%>
You are not logged in<br/>
<a href="index.jsp">Please Login</a>
<%} else {%>
<%

RoleTypeManager manager = new RoleTypeManager();

List<RoleType> roles = manager.findAllRoleTypes();

%>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">
  
   <link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/bootstrap-theme.css" rel="stylesheet">
<link href="css/bootstrap-theme.min.css" rel="stylesheet">
  <script>
  $(function() {
    $( "#datepicker" ).datepicker({ dateFormat: 'yy-mm-dd' }).val();
  });
  </script>
    </head>
    <body><nav class="navbar navbar-default navbar-fixed-top" role="navigation">
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
            <li class="active"><a href="#">Create User</a></li>
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
    <center>
    <div class="well" >
    
        <form  class="form" method="post" action="reg.jsp">
            <center>
            <table class="table" width="30%" cellpadding="5">
                <thead>
                    <tr>
                        <th colspan="2">Enter Information Here</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>First Name</td>
                        <td><input class="form-control" type="text" name="fname" value="" /></td>
                    </tr>
                    <tr>
                        <td>Last Name</td>
                        <td><input class="form-control" type="text" name="lname" value="" /></td>
                    </tr>
                    <tr>
                        <td>DOB</td>
                        <td><input class="form-control" type="text" id="datepicker" name="dob" value="" /></td>
                    </tr>
                    <tr>
                        <td>User Name</td>
                        <td><input class="form-control" type="text" name="uname" value="" /></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input  class="form-control" type="password" name="pass" value="" /></td>
                    </tr>
                    <tr>
                        <td>Role</td>
                        <td><select  class="form-control" name="role" >
                        <% for( RoleType rt : roles) { %>
                        <option value="<%=rt.getType()%>"><%= rt.getType() %></option>
                        <%} %>
                        </select>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="submit" class="btn btn-success" value="Submit" /></td>
                        <td><input type="reset" value="Reset"  class="btn btn-danger"/></td>
                    </tr>
                    
                </tbody>
            </table>
            </center>
        </form>
        </div>
        </center>
        </div>
    </body>
    <%} %>
</html>
