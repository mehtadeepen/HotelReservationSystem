package dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import beans.Follow;
import beans.Likes;

public class FollowManager {
	
	EntityManagerFactory factory = Persistence.createEntityManagerFactory("HRS");
	EntityManager em = null;
	
	public Follow findFollowing(String follower, String followed) {
		Follow follow = null;
		
		em = factory.createEntityManager();
		em.getTransaction().begin();
		
		Query query = em.createQuery("SELECT f FROM Follow f "
				+ "WHERE f.followerID = :Follower AND f.followedID = :Followed");
		query.setParameter("Follower", follower);
		query.setParameter("Followed", followed);
		try {
			follow = (Follow) query.getSingleResult();
			System.out.println(follow.getFollowerID()+follow.getFollowedID());
		} catch (Exception e) {
			follow = null;
		}
		em.getTransaction().commit();
		em.close();
		
		return follow;
	}
	
	public List<Follow> findAllFollowersForUser(String username) {
		List<Follow> followers = new ArrayList<Follow>();

		em = factory.createEntityManager();
		em.getTransaction().begin();

		Query query = em.createQuery("SELECT f FROM Follow f "
				+ "WHERE f.followedID = :UserName");
		query.setParameter("UserName", username);
		followers = query.getResultList();

		em.getTransaction().commit();
		em.close();

		return followers;
	}
	
	// Returns the list of all users that this user is following
	public List<Follow> findFollowingOfUser(String username) {
		List<Follow> followedList = new ArrayList<Follow>();

		em = factory.createEntityManager();
		em.getTransaction().begin();

		Query query = em.createQuery("SELECT f FROM Follow f "
				+ "WHERE f.followerID = :UserName");
		query.setParameter("UserName", username);
		followedList = query.getResultList();

		em.getTransaction().commit();
		em.close();

		return followedList;
	}
	
	public Follow createFollowing(Follow follow) {

		em = factory.createEntityManager();
		em.getTransaction().begin();

		em.persist(follow);

		em.getTransaction().commit();
		em.close();

		return follow;
	}
	
	public int removeFollowing(String follower, String followed) {
		
		em = factory.createEntityManager();
		em.getTransaction().begin();
		
		Query query = em.createQuery("DELETE FROM Follow f WHERE "
				+ "f.followerID = :Follower AND f.followedID = :Followed");
		query.setParameter("Follower", follower);
		query.setParameter("Followed", followed);
		int deletedCount = query.executeUpdate();
		
		em.getTransaction().commit();
		em.close();
		
		return deletedCount;
	}
	
	public static void main(String[] args) {
		
		FollowManager followManager = new FollowManager();
		
		Follow follow = followManager.findFollowing("m", "f");
		
		System.out.println(follow.getFollowedID()+follow.getFollowerID());
	}
}
