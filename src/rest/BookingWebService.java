package rest;

import java.util.List;










import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Application;
import javax.ws.rs.core.MediaType;

import dao.BookingManager;
import beans.*;

@Path("/bookings")
public class BookingWebService {

	
	@GET
	@Path("/")
	@Produces(MediaType.APPLICATION_JSON)
	public List<Booking> getAllBookings(){
		
		BookingManager bookingManager = new BookingManager();
		List<Booking> bookings = (List<Booking>)bookingManager.findAllBookings();
		
		return bookings;
		
		
	}
}
