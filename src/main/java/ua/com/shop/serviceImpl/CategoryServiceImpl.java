package ua.com.shop.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import ua.com.shop.dao.CategoryDao;
import ua.com.shop.entity.Category;
import ua.com.shop.entity.Commodity;
import ua.com.shop.service.CategoryService;

@Service
public class CategoryServiceImpl implements CategoryService{

	@Autowired
	private CategoryDao categoryDao;
	
	public void save(Category category) {
		categoryDao.save(category);
	}

	public List<Category> findAll() {
		return categoryDao.findAll();
	}

	public Category findOne(int id) {
		return categoryDao.findOne(id);
	}

	public void delete(int id) {
		categoryDao.delete(id);
	}

	public Category findByName(String name) {
		return categoryDao.findByName(name);
	}

/*	public Page<Commodity> findPageCmmodityByCategory(int id ,int currentPage, int totalElement) {
		Pageable pageable = new PageRequest(currentPage, totalElement);
		
		return (Page<Commodity>) categoryDao.findCategoryWithCommodity(id, pageable).getCommodities();
	}*/

	public List<Commodity> findCommodityByCategory(int id) {

		return categoryDao.findCategoryWithCommodity(id).getCommodities();
	}

}
