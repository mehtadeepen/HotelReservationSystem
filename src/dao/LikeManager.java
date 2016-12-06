package dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import beans.Likes;


public class LikeManager {

	EntityManagerFactory factory = Persistence.createEntityManagerFactory("HRS");
	EntityManager em = null;
	
	public LikeManager() {
		em = factory.createEntityManager();
		}
	
	public Likes findLike(String username, String hotelID) {
		Likes like = null;
		
		em = factory.createEntityManager();
		em.getTransaction().begin();
		
		// like = em.find(Like.class, new LikePK(username, hotelID));
		
		Query query = em.createQuery("SELECT l FROM Likes l "
				+ "WHERE l.username = :UserName AND l.hotelID = :hotelID");
		query.setParameter("UserName", username);
		query.setParameter("hotelID", hotelID);
		try {
			like = (Likes) query.getSingleResult();
		} catch (Exception e) {
			like = null;
			System.out.println(like);
		}
		em.getTransaction().commit();
		em.close();
		if(like == null)
			return null;
		else
		return like;
	}
	
	public List<Likes> findAllLikesForUser(String username) {
		List<Likes> likes = new ArrayList<Likes>();

		em = factory.createEntityManager();
		em.getTransaction().begin();

		Query query = em.createQuery("SELECT l FROM Likes l "
				+ "WHERE l.username = :UserName");
		query.setParameter("UserName", username);
		likes = query.getResultList();

		em.getTransaction().commit();
		em.close();

		return likes;
	}
	
	public List<Likes> findAllLikesForHotel(String hotelId) {
		List<Likes> likes = new ArrayList<Likes>();

		em = factory.createEntityManager();
		em.getTransaction().begin();

		Query query = em.createQuery("SELECT l FROM Likes l "
				+ "WHERE l.hotelID = :hotel");
		query.setParameter("hotel", hotelId);
		likes = query.getResultList();

		em.getTransaction().commit();
		em.close();

		return likes;
	}
	
	public Likes createLike(Likes like) {

		em = factory.createEntityManager();
		em.getTransaction().begin();

		em.persist(like);

		em.getTransaction().commit();
		em.close();

		return like;
	}
	
	public int removeLike(String username, String hotelID) {
		
		em = factory.createEntityManager();
		em.getTransaction().begin();
		
		Query query = em.createQuery("DELETE FROM Likes l WHERE "
				+ "l.username = :UserName AND l.hotelID = :hotel");
		query.setParameter("UserName", username);
		query.setParameter("hotel", hotelID);
		int deletedCount = query.executeUpdate();
		
		em.getTransaction().commit();
		em.close();
		
		return deletedCount;
	}
	
	public static void main(String[] args) {
		
		LikeManager manager = new  LikeManager();
	
		Likes like = new Likes();
		
		like = manager.findLike("m", "1");
		
		List<Likes> likes = manager.findAllLikesForUser("m");
		
		 
		 System.out.println(like.toString());
		 
		 System.out.println(like.getUserName());
		 
		 System.out.println(likes.size());
	}
}
