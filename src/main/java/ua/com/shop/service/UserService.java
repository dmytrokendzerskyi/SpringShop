package ua.com.shop.service;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpRequest;
import org.springframework.web.multipart.MultipartFile;

import ua.com.shop.entity.Commodity;
import ua.com.shop.entity.User;

public interface UserService {

	void save(User user) throws Exception;
	List<User> findAll();
	User findOne(int id);
	void delete(int id);
	
	void  userbuy(int idprincipal , int id);
	
	List<User> findUsersWithCommodities();
	
	void deletecommodityfromuser(int cid ,int uid);
	
	User findOnePricipal(int id);
	
	void saveImage(int idprincipal, MultipartFile multipartFile);
	
	User findByUUID(String uuid);
	
	void update(User user);
	
	User findByName(String email);
	
	// for cookie
	
	Cookie intoBasket(int id);
	
	List<Commodity>	userCommodityCookie(Cookie [] cookies);
	
	Cookie getOrder(int idprincipal ,int id, String [] cookiesval, String [] cookiesname);
	
	/*Cookie []  getOrders(int idprincipal, String [] cookiesval, String [] cookiesname);*/
	
	Cookie deleteOrder(int id, String [] cookiesval, String [] cookiesname);
	
}
