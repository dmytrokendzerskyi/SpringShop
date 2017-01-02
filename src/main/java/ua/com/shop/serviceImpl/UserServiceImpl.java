package ua.com.shop.serviceImpl;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transactional;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.Validate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import ua.com.shop.dao.CommodityDao;
import ua.com.shop.dao.UserDao;
import ua.com.shop.entity.Commodity;
import ua.com.shop.entity.Role;
import ua.com.shop.entity.User;
import ua.com.shop.service.UserService;
import ua.com.shop.validator.Validator;

@Service("userDetailsService")
public class UserServiceImpl implements UserService,UserDetailsService{

	@Autowired
	private UserDao userDao;
	
	@Autowired
	private CommodityDao commodityDao;
	
	@Autowired
	@Qualifier("userValidator")
	private Validator validator;
	
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	public void save(User user) throws Exception {
		
		validator.validate(user);
		
		user.setRole(Role.ROLE_USER);
		user.setPassword(encoder.encode(user.getPassword()));
	userDao.save(user);	
	}

	public List<User> findAll() {
		return userDao.findAll();
	}

	public User findOne(int id) {
		return userDao.findOne(id);
	}

	public void delete(int id) {
		userDao.delete(id);
	}
	
	
	

	@Transactional
	public void userbuy(int idprincipal ,int id) {
		
		User user = userDao.findOne(idprincipal);
		Commodity commodity = commodityDao.getOne(id);
		user.getCommodities().add(commodity);
		
	}

	@Transactional
	public List<User> findUsersWithCommodities() {
		return userDao.findUserwithCommodity();
	}
	
	@Transactional
	public void deletecommodityfromuser(int cid, int uid) {
		
	Commodity commodity = commodityDao.findOne(cid);
		User user = userDao.findUserwithCommodity(uid);
		user.getCommodities().remove(commodity);
		/*List<Commodity> list = user.getCommodities();
		
		
		for (Iterator iterator = list.iterator(); iterator.hasNext();) {
			Commodity commod = (Commodity) iterator.next();
			if(commod.getId() == cid){
				iterator.remove();
			}
			
		}
		user.setCommodities(list);*/
		userDao.save(user);
		
		
		
	}

	public User findByName(String email){
		return userDao.findByEmail(email);
	}
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
		return userDao.findByEmail(email);
	}

	public  User findOnePricipal(int  id) {
		User user = userDao.findUserwithCommodity(id);
		return user;
	}

	@Transactional
	public void saveImage(int idprincipal, MultipartFile multipartFile) {

	    User user = userDao.findOne(idprincipal);

	    String path = System.getProperty("catalina.home") + "/resources/"
	            + user.getName() + "/" + multipartFile.getOriginalFilename();

	    user.setPathImage("resources/" + user.getName() + "/" + multipartFile.getOriginalFilename());

	    File file = new File(path);

	    try {
	        file.mkdirs();
	        try {
	            FileUtils.cleanDirectory
	                    (new File(System.getProperty("catalina.home") + "/resources/" + user.getName() + "/"));
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	        multipartFile.transferTo(file);
	    } catch (IOException e) {
	        System.out.println("error with file");
	    }
	    userDao.save(user);
	}

	public User findByUUID(String uuid) {

		return userDao.findByUUID(uuid);
	}

	public void update(User user) {
		userDao.save(user);
	}

	// for cookie

	public Cookie intoBasket(int id) {
			
		Commodity commodity = commodityDao.findOne(id);
		
		Cookie cookieCommodity = new Cookie(commodity.getName(), String.valueOf(commodity.getId()));
		
		cookieCommodity.setHttpOnly(true);
		cookieCommodity.setMaxAge(24*60*60*100);
		cookieCommodity.setPath("/");

		
		return cookieCommodity;
	}

	public List<Commodity> userCommodityCookie(Cookie [] cookies) {

		
		List<Commodity> commodities = new ArrayList<Commodity>();
		
		for (Cookie cookie : cookies) {
			
			if(cookie.getName().equals("JSESSIONID")){
				
			}else{
				commodities.add(commodityDao.findOne(Integer.parseInt(cookie.getValue())));
				
			}
			
		}
		return commodities;
	}
	
	@Transactional
	public Cookie getOrder(int idprincipal, int id, String [] cookiesval, String [] cookiesname) {
		
		User user = userDao.findUserwithCommodity(idprincipal);
		Commodity commodity = commodityDao.findOne(id);
		
		user.getCommodities().add(commodity);
		
		return sortCookies(cookiesval , cookiesname , id );
		
	}

/*	@Transactional
	public Cookie [] getOrders(int idprincipal, String [] cookiesval, String [] cookiesname) {
		
		User user = userDao.findUserwithCommodity(idprincipal);
		
		
		user.getCommodities().add(commodity);
		
		return sortCookies(cookiesval , cookiesname , id );
		
	}*/
	
	public Cookie deleteOrder(int id, String [] cookiesval, String [] cookiesname) {
		return sortCookies(cookiesval , cookiesname, id);
	}
	
	public Cookie sortCookies(String [] cookiesval , String [] cookiesname , int id ){
		for (int i = 0; i < cookiesval.length; i++) {
			if(String.valueOf(id).equals(cookiesval[i])){
				Cookie cookie = new Cookie(cookiesname[i], null);
				cookie.setPath("/");
				cookie.setMaxAge(0);
				cookie.setValue(null);
				cookie.setHttpOnly(true);
				
				return cookie;
			}
		}
		return null;
	}

	
}
