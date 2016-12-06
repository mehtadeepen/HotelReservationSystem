<%@page import="dao.RoomTypeManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="apimanager.*,java.util.*,beans.*,dao.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
String hotelID = (String) request.getParameter("hotelID");
String arrivalDate = (String) request.getParameter("arrivalDate");
String departureDate = (String) request
.getParameter("departureDate");

RoomTypeManager rmt = new RoomTypeManager();

List<RoomType> types =  rmt.findAllRoomTypes();
WebServiceClient client = new WebServiceClient();
HotelInfo hotel = client.getHotelInfomation(hotelID);
hotel.setArrivalDate(arrivalDate);
hotel.setDepartureDate(departureDate);

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

<script>
function getprice()
{
	
	var type = $("#roomType").val();
	
	low = <%=hotel.getLowRate()%>;
	high = <%=hotel.getHighrate()%>;
	med = (low + high)/2;
	
	if(type == "Deluxe")
		{
		$("#price").val(low);
		}
	else if(type == "King")
		{
		$("#price").val(med);
		}
	else if(type == "Queen")
	{
		$("#price").val(high);
		}
	
	
	
}
</script>
</head>
<body>

<form action="ConfirmBooking.jsp" method="post">
<center>
            <table class="table" border="1" width="30%" cellpadding="5">
                <thead>
                    <tr>
                        <th colspan="2">Enter Information Here</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>First Name</td>
                        <td><input type="text" name="fname" value="" /></td>
                    </tr>
                    <tr>
                        <td>Last Name</td>
                        <td><input type="text" name="lname" value="" /></td>
                    </tr>
                    <tr>
                        <td>Arrival Date</td>
                        <td><input type="text" readonly="readonly"  name="arrival" value="<%=arrivalDate%>" />
                        <input name="hotelID" value="<%=hotelID%>" type="hidden" /> 
                        <input
				name="arrivalDate" type="hidden" value="<%=arrivalDate%>">
			
                        </td>
                    </tr>
                    <tr>
                        <td>Departure Date</td>
                        <td>
                        <input type="text" readonly="readonly" name="ddate" value="<%=departureDate%>" />
                   		<input name="departureDate" type="hidden" value="<%=departureDate%>" />
                    </td>
                    </tr>
                    
                    <tr>
                        <td>Room Type</td>
                        <td>
                        <select name="roomType" id="roomType" onchange="getprice();">
                        <option value="-1">Select</option>
                        <%
                        for(RoomType t : types)
                        {
                        %>
                        <option  value="<%=t.getType()%>">
                        <%=t.getType()%>
                        </option>
                        <%} %>
                        </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Price</td>
                        <td><input type="text" id="price" name="price" value="" readonly="readonly"/></td>
                    </tr>
                    <tr>
                        <td>Special request</td>
                        <td><input type="text" name="srequest" value="" /></td>
                    </tr>
                    <tr>
                     <td><input class="btn btn-danger" type="reset" value="Reset" /></td>
                        <td><input class="btn btn-success" type="submit" value="Book" /></td>
                       
                    </tr>
                    
                </tbody>
            </table>
            </center>
</form>
</body>
</html>