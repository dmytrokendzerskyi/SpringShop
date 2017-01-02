package ua.com.shop.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ua.com.shop.entity.User;
import ua.com.shop.service.UserService;

@Controller
public class RegistrationController {

	@Autowired
	private UserService userService;
	
//	@RequestMapping(value="/registration" , method=RequestMethod.GET)
//	public String registration(Model model){
//		
//		model.addAttribute("user", new User());
//		return "loginpage";
//	}
//	
//	@RequestMapping(value="/registerUser" , method=RequestMethod.POST)
//	public String registration(@ModelAttribute User user){
//		
//		userService.save(user);
//		
//		return "redirect:/registration";
//	}
	
	
}
