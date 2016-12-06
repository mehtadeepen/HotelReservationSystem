package dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import beans.RoomType;

public class RoomTypeManager {
	
	EntityManagerFactory factory = Persistence.createEntityManagerFactory("HRS");
	EntityManager em = null;
	
	public RoomTypeManager() {
		em = factory.createEntityManager();
		}
	
	public List<RoomType> findAllRoomTypes() {
		List<RoomType> roomTypes = new ArrayList<RoomType>();
		
		em = factory.createEntityManager();
		em.getTransaction().begin();
		
		Query query = em.createQuery("SELECT rt FROM RoomType rt");
		roomTypes = query.getResultList();
		
		em.getTransaction().commit();
		em.close();

		return roomTypes;
	}
	
	public static void main(String[] args) {
		RoomTypeManager manager = new RoomTypeManager();
		
		List<RoomType> li = manager.findAllRoomTypes();
		
		li.size();
		
	}
}
