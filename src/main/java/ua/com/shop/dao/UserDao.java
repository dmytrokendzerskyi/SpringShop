package ua.com.shop.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import ua.com.shop.entity.User;


public interface UserDao  extends JpaRepository<User, Integer>{

	@Query("select distinct  u from User u left join fetch u.commodities")
	List<User> findUserwithCommodity();
	
	@Query("select distinct u from User u left join fetch u.commodities where u.id =:id")
	User findUserwithCommodity(@Param("id") int id);
	
	@Query("SELECT CASE WHEN COUNT(u)>0 THEN true ELSE false END FROM User u WHERE u.email =:email")
	boolean userExistsByEmail(@Param("email") String email);
	
	@Query("select u from User u where u.UUID =:UUID")
	User findByUUID(@Param("UUID") String uuid);
	
	
	
	
	User findByEmail(String email);
	
}
