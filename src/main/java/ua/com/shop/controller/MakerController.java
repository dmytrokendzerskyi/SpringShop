package ua.com.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ua.com.shop.dto.DtoUtilMapped;
import ua.com.shop.entity.Maker;
import ua.com.shop.service.MakerService;

@Controller
public class MakerController {

	@Autowired
	private MakerService makerService;
	
	@RequestMapping(value="/newMaker" , method=RequestMethod.GET)
	public String makersignUp(Model model){
		
		model.addAttribute("makers",DtoUtilMapped.MakerToMakerDTO(makerService.findAll()));
		model.addAttribute("maker",new Maker());
		return "newMaker";
	}
	
	@RequestMapping(value="/saveMaker" , method=RequestMethod.POST)
	public String saveMaker(@ModelAttribute Maker maker){
		
		makerService.save(maker);
		
		return "redirect:/newMaker";
		
		
	}
	
	@RequestMapping(value="/savenewMaker" , method=RequestMethod.POST)
	public String newMaker(@ModelAttribute Maker maker){
		
		makerService.save(maker);
		
		return "redirect:/newMaker";
	}
	
	
	
	@RequestMapping(value="/deletemaker/{id}")
	public String delete(@PathVariable String id){
		makerService.deleteMakerWithCommodity(id);
		return "redirect:/newMaker";
	}
}
