package ua.com.shop.controller;

import java.security.Principal;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import ua.com.shop.dto.DtoUtilMapped;
import ua.com.shop.entity.User;
import ua.com.shop.service.MailSenderService;
import ua.com.shop.service.UserService;
import ua.com.shop.validator.Validator;

@Controller
public class UserController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private MailSenderService mailSenderService;

	
	@RequestMapping(value ="/usersignUp" , method =RequestMethod.GET)
      public String usersignUp(Model model){
		model.addAttribute("allUser", DtoUtilMapped.UserToUserDTO(userService.findAll()));
		model.addAttribute("user", new User());
		return "usersignUp";
	}
	
	
	@RequestMapping(value ="/saveUser" , method=RequestMethod.POST)
	public String click(/*@RequestParam String username, @RequestParam String surname ,@RequestParam String login , @RequestParam String password , @RequestParam String phoneNumber ,@RequestParam String email*/ 
			@ModelAttribute User user , Model model){

//		User user = new User(username, surname, login ,password, email, phoneNumber);
		try{
		userService.save(user);
	} catch (Exception e) {
		model.addAttribute("exception" , e.getMessage());
		return "loginpage";
	}
		return "redirect:/signUp";
	}
	
	@RequestMapping(value="/deleteuser/{id}" )
	public String delete(@PathVariable int id){
		userService.delete(id);
		return "redirect:/usersignUp";
	}

	//for myProfile
	
	@RequestMapping(value="/saveImage", method= RequestMethod.POST)
	public String saveImage(Principal principal , @RequestParam MultipartFile image){
		
		userService.saveImage(Integer.parseInt(principal.getName()), image);
		
		return "redirect:/myProfile";
		
	}
	
	
	@RequestMapping({"/myProfile" , "/categoryCommodity/myProfile"})
	public String myprofile(Principal principal , Model model  , HttpServletRequest request){
		model.addAttribute("use",userService.findOne(Integer.parseInt(principal.getName())));
		request.getSession(false);
		model.addAttribute("user", userService.userCommodityCookie(request.getCookies()));
		return "profile";
	}
	

	@RequestMapping(value = {"/userSign" , "/categoryCommodity/userSign"}, method = RequestMethod.GET)
	public String usersign(){
		return "userSignIn";
	}
	
	@RequestMapping("/loginError")
	public String loginError(Model model){
		model.addAttribute("error", "Your password is not correct");
		return "userSignIn";
	}
	
	@RequestMapping(value = "/forgotepassword" )
	public  boolean save(@RequestBody User user , Model  model){
		String uuid = UUID.randomUUID().toString();
		
		user.setUUID(uuid);
		
		try{
		userService.save(user);
		} catch (Exception e) {
			model.addAttribute("exception" , e.getMessage());
			return true;
		}
		String theme = "thank's for registration";
		String message = "gl & hf http://localhost:8080/SpringShop/confirm/" + uuid;
		
		mailSenderService.sendMail(theme, message, user.getEmail());
		return true;
	}
}
