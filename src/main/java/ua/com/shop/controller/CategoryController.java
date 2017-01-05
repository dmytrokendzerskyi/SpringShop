package ua.com.shop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import ua.com.shop.dto.CategoryDTO;
import ua.com.shop.dto.DtoUtilMapped;
import ua.com.shop.entity.Category;
import ua.com.shop.service.CategoryService;
import ua.com.shop.service.CommodityService;

@Controller
public class CategoryController {
	
	@Autowired
	private CategoryService categoryService;
	
	
	@RequestMapping(value ="/newCategory")
	public String category(Model model){
		
		model.addAttribute("categories",new DtoUtilMapped().CategoriesToCategoryDTO(categoryService.findAll()) );
		model.addAttribute("category" , new CategoryDTO());
		return "newCategory";
	}
	
	@RequestMapping(value ="/saveCategory" , method = RequestMethod.POST)
	public @ResponseBody List<CategoryDTO> click(@RequestBody Category category){
						
		categoryService.save(category);		
		
		return DtoUtilMapped.CategoriesToCategoryDTO(categoryService.findAll());
	}
	
	@RequestMapping(value ="/deletecategory/{id}" )
	public String delete(@PathVariable int id){
		
		categoryService.delete(id);
		return "redirect:/newCategory";
		
	}
	@RequestMapping(value = "/loadCategory" , method = RequestMethod.POST )
	public @ResponseBody List<CategoryDTO> load(){
		
		return  DtoUtilMapped.CategoriesToCategoryDTO(categoryService.findAll());
		
	}
	
	@RequestMapping(value = "/categoryCommodity/{id}")
	public String categoryCommodity(@PathVariable int id , Model model){
		model.addAttribute("category", (categoryService.findCommodityByCategory(id)));
		return "categoryCommodity";
	}
	
	@RequestMapping(value="/deleteCategory/{id}")
	public String deleteCategory(@PathVariable int id){
		categoryService.delete(id);
		return "redirect:/newCategory";
	}
	
	
	
}
