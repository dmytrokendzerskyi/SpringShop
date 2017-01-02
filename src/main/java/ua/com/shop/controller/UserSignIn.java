package ua.com.shop.controller;

import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import ua.com.shop.entity.User;
import ua.com.shop.service.MailSenderService;
import ua.com.shop.service.UserService;

@RestController
public class UserSignIn {

	@Autowired
	private UserService userService;
	
	@Autowired
	private MailSenderService mailSenderService;
	

	
	@RequestMapping(value = "/saveuseremail"  , method = RequestMethod.POST)
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
	
	
	@RequestMapping(value= "/validatoremail" , method= RequestMethod.POST)
	public boolean validatoremail(@RequestBody String email){
		if(userService.findByName(email) != null || email.equals("admin")){
			System.out.println("true");
			return true;
		}
		System.out.println("false");
		return false;
		
	}
	

}
