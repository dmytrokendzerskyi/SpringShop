package ua.com.shop.service;

import java.util.List;

import ua.com.shop.entity.SubCategory;

public interface SubCategoryService {

	void save(SubCategory subCategory);
	
	SubCategory findOne(int id);
	
	List<SubCategory> findAll();
	
	void delete(int id);

}
