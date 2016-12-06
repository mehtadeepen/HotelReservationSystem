package dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;


import beans.Hotel;

public class HotelManager {

	EntityManagerFactory factory = Persistence.createEntityManagerFactory("HRS");
	EntityManager em = null;
	
	
	public HotelManager() {
		em = factory.createEntityManager();
		}
	
	
	public Hotel findHotel(String hotelId) {
		Hotel hotel = null;
		
		em = factory.createEntityManager();
		em.getTransaction().begin();
		
		hotel = em.find(Hotel.class, hotelId);
		
		em.getTransaction().commit();
		em.close();
		
		if(hotel == null)
		{
			return null;
		}
		else
		return hotel;
	}
	
	
	public String findHotelname(String hotelId) {
		Hotel hotel = null;
		
		em = factory.createEntityManager();
		em.getTransaction().begin();
		
		hotel = em.find(Hotel.class, hotelId);
		
		em.getTransaction().commit();
		em.close();
		
		if(hotel == null)
		{
			return null;
		}
		else
		return hotel.getName();
	}
	
	public String findHotellocation(String location) {
		Hotel hotel = null;
		
		em = factory.createEntityManager();
		em.getTransaction().begin();
		
		hotel = em.find(Hotel.class, location);
		
		em.getTransaction().commit();
		em.close();
		
		if(hotel == null)
		{
			return null;
		}
		else
		return hotel.getLocation();
	}
	
	public List<Hotel> findAllHotels() {
		List<Hotel> hotels = new ArrayList<Hotel>();
		
		em = factory.createEntityManager();
		em.getTransaction().begin();
		
		Query query = em.createQuery("SELECT h FROM hotel h");
		hotels = query.getResultList();
		
		em.getTransaction().commit();
		em.close();

		return hotels;
	}
	
	public List<Hotel> findAllHotelsForLocation(String location) {
		List<Hotel> hotels = new ArrayList<Hotel>();
		
		em = factory.createEntityManager();
		em.getTransaction().begin();
		
		Query query = em.createQuery("SELECT h FROM hotel h "
				+ "WHERE h.location = :loc");
		query.setParameter("loc", location);
		hotels = query.getResultList();
		
		em.getTransaction().commit();
		em.close();

		return hotels;
	}
	
	public Hotel createHotel(Hotel hotel) {
		

		em = factory.createEntityManager();
		em.getTransaction().begin();

		em.persist(hotel);
		
		
		em.getTransaction().commit();
		em.close();
		
		return hotel;
	}
	
	public static void main(String[] args) {
		
		HotelManager  manager = new HotelManager();
		
		Hotel hotel = new Hotel();
		
		hotel = manager.findHotel("2");
		
		if(hotel != null)
		{
			System.out.println(hotel.getHotelId());
		}
		else
			System.out.println("NULL");
	}
	
}
