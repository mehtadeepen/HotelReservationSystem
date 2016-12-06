package dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import beans.RoleType;
import beans.RoomType;

public class RoleTypeManager {
	
	EntityManagerFactory factory = Persistence.createEntityManagerFactory("HRS");
	EntityManager em = null;
	
	public RoleTypeManager() {
		em = factory.createEntityManager();
		}
	
	public List<RoleType> findAllRoleTypes() {
		List<RoleType> roleTypes = new ArrayList<RoleType>();
		
		em = factory.createEntityManager();
		em.getTransaction().begin();
		
		Query query = em.createQuery("SELECT rt FROM RoleType rt");
		roleTypes = query.getResultList();
		
		em.getTransaction().commit();
		em.close();

		return roleTypes;
	}
	
	public static void main(String[] args) {
		RoleTypeManager manager = new RoleTypeManager();
		
		List<RoleType> li = manager.findAllRoleTypes();
		
		li.size();
		System.out.println(li.size());
		
	}
}



