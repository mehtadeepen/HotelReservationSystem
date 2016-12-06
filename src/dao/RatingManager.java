package dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import beans.Booking;
import beans.Rating;

public class RatingManager {
	
	EntityManagerFactory factory = Persistence.createEntityManagerFactory("HRS");
	EntityManager em = null;
	
	
	
	public Rating findAllRatingsForHotelandUser(String username, String hotelID) {
		
		Rating rating = null;

		em = factory.createEntityManager();
		em.getTransaction().begin();

		Query query = em.createQuery("SELECT r FROM Rating r "
				+ "WHERE r.username = :UserName and r.hotelID = :hotelID");
		query.setParameter("UserName", username);
		query.setParameter("hotelID", hotelID);
		try{
		rating =  (Rating) query.getSingleResult();
		}
		catch (Exception e) {
			rating = null;
		}
		em.getTransaction().commit();
		em.close();
		
		
			return rating;
	}
	
	
	public List<Rating> findAllRatingsForUser(String username) {
		List<Rating> ratings = new ArrayList<Rating>();

		em = factory.createEntityManager();
		em.getTransaction().begin();

		Query query = em.createQuery("SELECT r FROM Rating r "
				+ "WHERE r.username = :UserName");
		query.setParameter("UserName", username);
		ratings = query.getResultList();

		em.getTransaction().commit();
		em.close();

		return ratings;
	}
	
	public List<Rating> findAllRatingsForHotel(String hotelID) {
		List<Rating> ratings = new ArrayList<Rating>();

		em = factory.createEntityManager();
		em.getTransaction().begin();

		Query query = em.createQuery("SELECT r FROM Rating r "
				+ "WHERE r.hotelID = :hotel");
		query.setParameter("hotel", hotelID);
		ratings = query.getResultList();

		em.getTransaction().commit();
		em.close();

		return ratings;
	}
	
	public Rating createRating(Rating rating)
	{
	/*em.getTransaction().begin();
	booking = em.persist(booking);
	em.getTransaction().commit();*/
	
	
	em = factory.createEntityManager();
	em.getTransaction().begin();

	em.persist(rating);
	
	
	em.getTransaction().commit();
	em.close();
	return rating;
	}
	
	public static void main(String[] args) {
		
		RatingManager ratingManager = new RatingManager();
		
		Rating rating  = ratingManager.findAllRatingsForHotelandUser("m", "1");
		
		System.out.println(rating.getValue());
	}
}
