package ua.com.shop.dto;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import ua.com.shop.dao.MakerDao;
import ua.com.shop.entity.Category;
import ua.com.shop.entity.Commodity;
import ua.com.shop.entity.Maker;
import ua.com.shop.entity.SubCategory;
import ua.com.shop.entity.User;

public class DtoUtilMapped {
	
	public static List<CommodityDTO> CommoditiesToCommodityDTOs(List<Commodity> commodities){

		List<CommodityDTO> commodityDTOs  = new ArrayList<CommodityDTO>();
		
		for (Commodity commodity : commodities) {
			
			CommodityDTO commodityDTO = new CommodityDTO();
			commodityDTO.setId(commodity.getId());
			commodityDTO.setName(commodity.getName());
			commodityDTO.setModel(commodity.getModel());
			commodityDTO.setPrice(commodity.getPrice());
			commodityDTO.setPathImage(commodity.getPathImage());
			
			commodityDTOs.add(commodityDTO);
		}
		
		return commodityDTOs;
	}

	public static List<CategoryDTO> CategoriesToCategoryDTO(List<Category> categories){
		
		List<CategoryDTO> categoryDTOs = new ArrayList<CategoryDTO>();
		
		for (Category category : categories) {
			
			CategoryDTO categoryDTO = new CategoryDTO();
			
			categoryDTO.setId(category.getId());
			categoryDTO.setName(category.getName());
			
			categoryDTOs.add(categoryDTO);
		}
		
		return categoryDTOs;
	}
	
	public static List<UserDTO> UserToUserDTO(List<User> users){
		
		
		List<UserDTO> userDTOs = new ArrayList<UserDTO>();
		for (User user : users) {
			UserDTO userDTO = new UserDTO();
			
			userDTO.setId(user.getId());
			userDTO.setName(user.getName());
			userDTO.setSurname(user.getSurname());
			userDTO.setEmail(user.getEmail());
			
			userDTOs.add(userDTO);
		} 
		return userDTOs;
	}
	
	public static List<MakerDTO> MakerToMakerDTO(List<Maker> makers){
		
		List<MakerDTO> makerDAOs = new ArrayList<MakerDTO>();
		
		
		for (Maker maker : makers) {
			MakerDTO makerDTO = new MakerDTO(maker.getId(), maker.getName(), maker.getAdress());
			
			makerDAOs.add(makerDTO);
		}
		
		
		return makerDAOs;
	}
	
	public static List<SubCategoryDTO> SubCategorytoSubCategoryDTO(List<SubCategory> subCategories){
		
		List<SubCategoryDTO> subCategoryDTOs = new ArrayList<SubCategoryDTO>();
		
		for (SubCategory subCategory : subCategories) {
			
			SubCategoryDTO subCategoryDTO = new SubCategoryDTO(subCategory.getId(), subCategory.getName());
			subCategoryDTOs.add(subCategoryDTO);
		}
		
		return subCategoryDTOs;
		
	}
	
	
}
