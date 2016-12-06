package dao;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;


import beans.Booking;
import beans.Rating;
import beans.User;


public class BookingManager {
	
	EntityManagerFactory factory = Persistence.createEntityManagerFactory("HRS");
	EntityManager em = null;

	public BookingManager() {
	em = factory.createEntityManager();
	}
	
	public Booking createBooking(Booking booking)
	{
	/*em.getTransaction().begin();
	booking = em.persist(booking);
	em.getTransaction().commit();*/
	
	
	em = factory.createEntityManager();
	em.getTransaction().begin();

	em.persist(booking);
	
	
	em.getTransaction().commit();
	em.close();
	return booking;
	}
	
	public List<Booking> findAllBookingsForUser(String username) {
		List<Booking> bookings = new ArrayList<Booking>();

		em = factory.createEntityManager();
		em.getTransaction().begin();

		Query query = em.createQuery("SELECT b FROM Booking b "
				+ "WHERE b.username = :UserName");
		query.setParameter("UserName", username);
		bookings = query.getResultList();

		em.getTransaction().commit();
		em.close();

		return bookings;
	}
	

	public List<Booking> findAllBookings() {
		List<Booking> bookings = new ArrayList<Booking>();

		em = factory.createEntityManager();
		em.getTransaction().begin();

		Query query = em.createQuery("SELECT b FROM Booking b ");
	
		bookings = query.getResultList();

		em.getTransaction().commit();
		em.close();

		return bookings;
	}
	
	public Booking deleteByBookingID(Integer bookingID)
	{
		System.out.println("BookingManager.deleteByBookingID()");
	Booking booking = null;
	em.getTransaction().begin();
	booking= em.find(Booking.class, bookingID);
	if(booking != null && booking.getUsername() != null)
	{
		booking.setActive(0);
		em.getTransaction().commit();
		return booking;
	}
	else
		return null;
	}
	
	
	public Booking findByBookingID(Integer bookingID)
	{

		System.out.println("BookingManager.findByBookingID()");
		Booking booking = null;
		em.getTransaction().begin();
		booking= em.find(Booking.class, bookingID);
		if(booking != null && booking.getUsername() != null)
		{

			return booking;
		}
		else
			return null;
	}
	
	
	public Booking updateByBookingID(Booking updatebooking)
	{
		System.out.println("UserManager.findByUsername()");
	Booking booking = null;
	em.getTransaction().begin();
	booking= em.find(Booking.class, updatebooking.getBookingID());
	if(booking != null && booking.getUsername() != null)
	{
	    
		booking.setFirstname(updatebooking.getFirstname());
		booking.setLastname(updatebooking.getLastname());
		booking.setArrivalDate(updatebooking.getArrivalDate());
		booking.setDepartureDate(updatebooking.getDepartureDate());
		booking.setRoomType(updatebooking.getRoomType());
		booking.setPrice(updatebooking.getPrice());
		booking.setSpecialrequest(updatebooking.getSpecialrequest());
		em.getTransaction().commit();
		return booking;
	}
	else
		return null;
	}
	
	public List<String> findallhotellocationforUser(String username)
	{
		List<Booking> bookings = new ArrayList<Booking>();

		em = factory.createEntityManager();
		em.getTransaction().begin();

		Query query = em.createQuery("SELECT b FROM Booking b "
				+ "WHERE b.username = :UserName");
		query.setParameter("UserName", username);
		bookings = query.getResultList();

		em.getTransaction().commit();
		em.close();
		
					

		List<String> list = new ArrayList<String>();
		HashSet hs = new HashSet();
		
		if(bookings != null)
		{
		for( Booking b : bookings) {
			
			HotelManager hotelManager = new HotelManager();
			
			String location = hotelManager.findHotellocation(b.getHotelID());
			
			list.add(location);
					
		}
		hs.addAll(list);
		list.clear();
		list.addAll(hs);
		}
		
		return list;
	}
	
	
	
	

}
