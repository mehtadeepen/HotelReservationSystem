package dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import beans.Booking;
import beans.User;

public class UserManager {


EntityManagerFactory factory = Persistence.createEntityManagerFactory("HRS");
EntityManager em = null;

public List<User> findAllUsers() {
	List<User> users = new ArrayList<User>();

	em = factory.createEntityManager();
	em.getTransaction().begin();

	Query query = em.createQuery("SELECT u FROM User u  WHERE u.roletype = :Role ");
	query.setParameter("Role", "User");
	users = query.getResultList();
	

	em.getTransaction().commit();
	em.close();

	return users;
}

public UserManager() {
em = factory.createEntityManager();
}

public User createUser(User user)
{
em.getTransaction().begin();
em.persist(user);
em.getTransaction().commit();
return user;
}

public User findByUsername(String username,String password)
{
	System.out.println("UserManager.findByUsername()");
User user = null;
em.getTransaction().begin();
user= em.find(User.class, username);
if(user != null && user.getUsername() != null && user.getPassword().equals(password))
{
	return user;
}
else
	return null;
}

public User findByUsername(String username)
{
	
	System.out.println("UserManager.findByUsername()");
User user = null;
em.getTransaction().begin();
user= em.find(User.class, username);
if(user != null && user.getUsername() != null)
{
	return user;
}
else
	return null;
}

public User updateByUsername(User updateUser)
{
	System.out.println("UserManager.findByUsername()");
User user = null;
em.getTransaction().begin();
user= em.find(User.class, updateUser.getUsername());
if(user != null && user.getUsername() != null)
{
	user.setFirstname(updateUser.getFirstname());
	user.setLastname(updateUser.getLastname());
	user.setDob(updateUser.getDob());
	em.getTransaction().commit();
	return user;
}
else
	return null;
}


public String findNameByUsername(String username)
{
	em = factory.createEntityManager();
	System.out.println("UserManager.findByUsername()");
User user = null;
em.getTransaction().begin();
user= em.find(User.class, username);
if(user != null && user.getUsername() != null)
{
	return user.getFirstname()+" "+user.getLastname();
}
else
	return null;
}



public static void main(String[] args) {
	UserManager dao = new UserManager();
User u1 = new User("d@m.com", "a", "deepen", "mehta", "11-27-1990");
User u2 = dao.createUser(u1);
System.out.println(u2.getUsername());

}

}