package ua.com.shop.service;

import java.util.List;

import org.springframework.data.domain.Page;

import ua.com.shop.entity.Category;
import ua.com.shop.entity.Commodity;

public interface CategoryService {

	void save(Category category);
	List<Category> findAll();
	Category findOne(int id);
	void delete(int id);
	
	Category findByName(String name);
	
	List<Commodity> findCommodityByCategory(int id);
	
}
