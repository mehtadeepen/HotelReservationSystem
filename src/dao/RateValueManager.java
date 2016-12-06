package dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import beans.Hotel;
import beans.RateValue;

public class RateValueManager {
	
	EntityManagerFactory factory = Persistence.createEntityManagerFactory("HRS");
	EntityManager em = null;
	
	public List<RateValue> findAllRateValues() {
		List<RateValue> rateValues = new ArrayList<RateValue>();
		
		em = factory.createEntityManager();
		em.getTransaction().begin();
		
		Query query = em.createQuery("SELECT rv FROM RateValue rv");
		rateValues = query.getResultList();
		
		em.getTransaction().commit();
		em.close();

		return rateValues;
	}
}
