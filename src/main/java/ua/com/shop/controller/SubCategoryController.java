package ua.com.shop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import ua.com.shop.dto.CommodityDTO;
import ua.com.shop.dto.DtoUtilMapped;
import ua.com.shop.dto.SubCategoryDTO;
import ua.com.shop.entity.SubCategory;
import ua.com.shop.service.CommodityService;
import ua.com.shop.service.SubCategoryService;

@RestController
public class SubCategoryController {

	@Autowired
	private SubCategoryService subCategoryService;
	
	@Autowired
	private CommodityService commodityService;
	
	@RequestMapping(value ="/saveSubCategory" , method =RequestMethod.POST)
	public @ResponseBody boolean save(@RequestBody SubCategory subCategory){
		
		subCategoryService.save(subCategory);
		
		return  true;
	}
	
	@RequestMapping( value = "/loadSubCategory" , method =RequestMethod.POST)
	public  List<SubCategoryDTO> load(){    
		return DtoUtilMapped.SubCategorytoSubCategoryDTO(subCategoryService.findAll());
	}
 	
	
	@RequestMapping(value="search" , method=RequestMethod.POST)
	public List<CommodityDTO> search(@RequestBody String search){
		return DtoUtilMapped.CommoditiesToCommodityDTOs(commodityService.search(search));
	}
	

}
