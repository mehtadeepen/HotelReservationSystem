package dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import beans.Review;

public class ReviewManager {

	EntityManagerFactory factory = Persistence.createEntityManagerFactory("HRS");
	EntityManager em = null;
	
	public List<Review> findAllReviewsForUser(String username) {
		List<Review> reviews = new ArrayList<Review>();

		em = factory.createEntityManager();
		em.getTransaction().begin();

		Query query = em.createQuery("SELECT rev FROM Review rev "
				+ "WHERE rev.username = :UserName");
		query.setParameter("UserName", username);
		reviews = query.getResultList();

		em.getTransaction().commit();
		em.close();

		return reviews;
	}
	
	public List<Review> findAllReviewsForHotel(String hotelId) {
		List<Review> reviews = new ArrayList<Review>();

		em = factory.createEntityManager();
		em.getTransaction().begin();

		Query query = em.createQuery("SELECT rev FROM Review rev "
				+ "WHERE rev.hotelID = :hotel");
		query.setParameter("hotel", hotelId);
		reviews = query.getResultList();

		em.getTransaction().commit();
		em.close();

		return reviews;
	}
	
	public List<Review> findAllReviews() {
		List<Review> reviews = new ArrayList<Review>();

		em = factory.createEntityManager();
		em.getTransaction().begin();

		Query query = em.createQuery("SELECT rev FROM Review rev ");
		
		reviews = query.getResultList();

		em.getTransaction().commit();
		em.close();

		return reviews;
	}
	
public int removeReview(Integer reviewID) {
		
		em = factory.createEntityManager();
		em.getTransaction().begin();
		
		Query query = em.createQuery("DELETE FROM Review r WHERE r.reviewID = :reviewID ");
		query.setParameter("reviewID", reviewID);
		
		int deletedCount = query.executeUpdate();
		
		em.getTransaction().commit();
		em.close();
		
		return deletedCount;
	}
	
	public Review createReview(Review review) {
		
		em = factory.createEntityManager();
		em.getTransaction().begin();

		em.persist(review);
		
		em.getTransaction().commit();
		em.close();
		
		return review;
	}
	 
	public static void main(String[] args) {
		
		ReviewManager rvm = new ReviewManager();
		
		List<Review> l = rvm.findAllReviewsForHotel("251086");
		
		System.out.println(l.size());
		
		l.get(0).getReviewDate();
		
		System.out.println(l.get(0).getReviewDate());
		
	}
}
