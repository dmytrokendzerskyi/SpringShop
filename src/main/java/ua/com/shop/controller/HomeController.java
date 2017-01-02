package ua.com.shop.controller;

import java.security.Principal;
import java.util.List;
import java.util.UUID;

import javax.persistence.criteria.CriteriaBuilder.In;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.omg.PortableInterceptor.INACTIVE;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import ua.com.shop.dto.DtoUtilMapped;
import ua.com.shop.entity.Commodity;
import ua.com.shop.entity.User;
import ua.com.shop.service.CommodityService;
import ua.com.shop.service.MailSenderService;
import ua.com.shop.service.SubCategoryService;
import ua.com.shop.service.UserService;

@Controller
public class HomeController {

	@Autowired
	private CommodityService commodityService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private SubCategoryService subCategoryService;
	
	@Autowired
	private MailSenderService mailSenderService;
	
	@RequestMapping(value={"/", "/home"} , method=RequestMethod.GET)
	public String home(Model model){
		List<Commodity> commodities = commodityService.findAll();
		model.addAttribute("users", userService.findAll());
		model.addAttribute("commodities", DtoUtilMapped.CommoditiesToCommodityDTOs(commodityService.findAll()));
		model.addAttribute("user", userService.findUsersWithCommodities());
		return "home";
		
	}
	
	
	@RequestMapping(value={"/home", "/categoryCommodity/home"} )
	public String loginprocesing(){
		
		return "redirect:/home";
	}
	
	
	@RequestMapping(value ="/new" , method=RequestMethod.GET)
	public String signUp(){
		
		return "new";
	}
	
	@RequestMapping(value ={"/buyCommodity/{id}" , "/categoryCommodity/buyCommodity/{id}"} , method=RequestMethod.GET)
	public String buycommodity(Principal principal , @PathVariable int id ,HttpServletRequest request , HttpServletResponse response){
	
		request.getSession(false);
		response.addCookie(userService.intoBasket(id));
		
//		userService.userbuy(principal, id);
		
		return "redirect:/";
	}
	
	@RequestMapping(value="/deletefromuser/{cid}/{uid}")
	public String deletefromuser(@PathVariable int cid ,@PathVariable int uid ){
		
		userService.deletecommodityfromuser(cid, uid);
		
		return "redirect:/";
				
	}
	
	@RequestMapping(value="/back")
	public String back(){
		
		return "redirect:/";
	}
	
	@RequestMapping(value ="/backsignUp")
	public String backsingUp(){
		
		return "redirect:/new";
		
	}
	
	@RequestMapping(value ="/backhome")
	public String backhome(){
		
		return "redirect:/";
	}
	
/*	@RequestMapping(value="/home" , method=RequestMethod.POST)
	public String loginprocesing(){
		return "redirect:/signIn";
	}*/
	
	@RequestMapping(value ={"/logout" ,"/categoryCommodity/logout"} , method=RequestMethod.POST)
	public String logount(){
		return "redirect:/home";
	}
	
	@RequestMapping(value="/loginpage" , method=RequestMethod.GET)
	public String registration(Model model){
		
		model.addAttribute("user", new User());
		return "loginpage";
	}
	
	@RequestMapping(value="/registerUser" , method=RequestMethod.POST)
	public String registration(@ModelAttribute User user, Model model){
		
		model.addAttribute("user" , new User());
		String uuid = UUID.randomUUID().toString();
		
		user.setUUID(uuid);
		
		try{
		userService.save(user);
		} catch (Exception e) {
			model.addAttribute("exception" , e.getMessage());
			return "signIn";
		}
		String theme = "thank's for registration";
		String message = "gl & hf http://localhost:8080/SpringShop/confirm/" + uuid;
		
		mailSenderService.sendMail(theme, message, user.getEmail());
		
		return "redirect:/";
	}
	
	@RequestMapping(value ="/confirm/{uuid}" , method = RequestMethod.GET)
	public String confirm(@PathVariable String uuid){
		User user = userService.findByUUID(uuid);
		user.setEnabeled(true);
		
		userService.update(user);
		
		return "redirect:/";
	}
	
	
	

	
	@RequestMapping("/getOrder/{id}")
	public String getOrder(Principal principal ,@PathVariable String id , HttpServletRequest request , HttpServletResponse response){
	String [] cookiesval = new String [request.getCookies().length];
	String [] cookiesname = new String [request.getCookies().length];
	for (int i = 0; i < request.getCookies().length; i++) {
		cookiesval[i] = request.getCookies()[i].getValue();
		cookiesname[i] = request.getCookies()[i].getName();
	}
		response.addCookie(userService.getOrder(Integer.parseInt(principal.getName()),  Integer.parseInt(id), cookiesval , cookiesname));
		return "redirect:/myProfile";
	}
	
	/*@RequestMapping("/getOrder")
	public String getOrders(Principal principal , HttpServletRequest request , HttpServletResponse response){
	String [] cookiesval = new String [request.getCookies().length];
	String [] cookiesname = new String [request.getCookies().length];
	for (int i = 0; i < request.getCookies().length; i++) {
		cookiesval[i] = request.getCookies()[i].getValue();
		cookiesname[i] = request.getCookies()[i].getName();
	}
		response.addCookie(userService.getOrders(Integer.parseInt(principal.getName()), cookiesval , cookiesname));
		return "redirect:/myProfile";
	}*/
	
	
	
	@RequestMapping("/deleteOrder/{id}")
	public String deleteOrder(@PathVariable String id , HttpServletRequest request ,HttpServletResponse response){
		String [] cookiesval = new String [request.getCookies().length];
		String [] cookiesname = new String [request.getCookies().length];
		for (int i = 0; i < request.getCookies().length; i++) {
			cookiesval[i] = request.getCookies()[i].getValue();
			cookiesname[i] = request.getCookies()[i].getName();
		}
		response.addCookie(userService.deleteOrder(Integer.parseInt(id),  cookiesval , cookiesname));
		return "redirect:/myProfile";
	}
	
	@RequestMapping("/singIN")
	public String signIN(Model model){
		model.addAttribute("user", new User());
		return "signIn";
	}
	@RequestMapping(value = "/subCategory" , method = RequestMethod.GET)
	public String subCategory(){
		return "newSubCategory";
	}
	
	@RequestMapping(value ="/deleteSubCategory/{id}")
	public String deleteSubCategory(@PathVariable int id){
		subCategoryService.delete(id);
		return "redirect:/subCategory";
	}
	
	
}
