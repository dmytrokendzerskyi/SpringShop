package ua.com.shop.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ua.com.shop.dao.SubCategoryDao;
import ua.com.shop.entity.SubCategory;
import ua.com.shop.service.SubCategoryService;

@Service
public class SubCategoryServiceImpl implements SubCategoryService{

	@Autowired
	private SubCategoryDao subCategoryDao;
	
	public void save(SubCategory subCategory) {
		subCategoryDao.save(subCategory);
	}

	public SubCategory findOne(int id) {
		return subCategoryDao.findOne(id);
	}

	public List<SubCategory> findAll() {
		return subCategoryDao.findAll();
	}

	public void delete(int id) {
		subCategoryDao.delete(id);
	}

}
