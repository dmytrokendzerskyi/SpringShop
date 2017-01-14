package ua.com.shop.controller;

import java.util.Locale.Category;

import org.jboss.logging.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javassist.bytecode.stackmap.BasicBlock.Maker;
import ua.com.shop.dto.CommodityDTO;
import ua.com.shop.dto.DtoUtilMapped;
import ua.com.shop.editor.CategoryEditor;
import ua.com.shop.editor.MakersEditor;
import ua.com.shop.entity.Commodity;
import ua.com.shop.service.CategoryService;
import ua.com.shop.service.CommodityService;
import ua.com.shop.service.MakerService;

@Controller
public class CommodityController {

	@Autowired
	private CommodityService commodityService;
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private MakerService makerService;

	@InitBinder
	protected void initBinderCategory(WebDataBinder binder){
		binder.registerCustomEditor(Category.class, new CategoryEditor(categoryService) );
	}
	
	@InitBinder
	protected void initBinderMaker(WebDataBinder binder){
		binder.registerCustomEditor(Maker.class, new MakersEditor(makerService));
	}
	
	@RequestMapping(value ="/commoditysignUp", method =RequestMethod.GET)
	public String singUpCommodity(Model model){
			
		model.addAttribute("commodities",DtoUtilMapped.CommoditiesToCommodityDTOs(commodityService.findAll()));
		model.addAttribute("categories" , DtoUtilMapped.CategoriesToCategoryDTO(categoryService.findAll()));
		model.addAttribute("makers" , DtoUtilMapped.MakerToMakerDTO(makerService.findAll()));
		model.addAttribute("commodity", new Commodity()); 
		return "newCommodity";
	}
	
	
	@RequestMapping(value ="/saveCommodity" , method=RequestMethod.POST )
	public void newCommodity(@RequestBody CommodityDTO commodityDTO){
	System.out.println(commodityDTO);
		commodityService.savecategoryCommodity(commodityDTO.getName(), commodityDTO.getModel(), commodityDTO.getPrice(),
				Integer.parseInt(commodityDTO.getMaker()),commodityDTO.getCategories());		
	}
	
	
	@RequestMapping(value="/deletecommodity/{id}" , method=RequestMethod.GET)
	public String delete(@PathVariable int id){
		
		commodityService.delete(id);
		
		return "redirect:/commoditysignUp";
		
	}
	
	
}
