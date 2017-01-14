package ua.com.shop.serviceImpl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import ua.com.shop.dao.CategoryDao;
import ua.com.shop.dao.CommodityDao;
import ua.com.shop.dao.MakerDao;
import ua.com.shop.dto.CommodityDTO;
import ua.com.shop.entity.Category;
import ua.com.shop.entity.Commodity;
import ua.com.shop.entity.Maker;
import ua.com.shop.service.CommodityService;

@Service
public class CommodityServiceImpl implements CommodityService{

	@Autowired
	private CommodityDao commodityDao;
	
	@Autowired
	private CategoryDao categoryDao;
	
	@Autowired
	private MakerDao makerDao;
	
	public void save(Commodity commodity) {
		commodityDao.save( commodity);
	}

	public List<Commodity> findAll() {
		return commodityDao.findAll();
	}

	public Commodity findOne(int id) {
		return commodityDao.findOne(id);
	}

	public void delete(int id) {
		commodityDao.delete(id);
	}

	@Transactional
	public void savecategoryCommodity(String name , String model , double price, int maker , String [] categories ) {		
		Commodity commodity = new Commodity(name , model , price);
		commodityDao.saveAndFlush(commodity);
		System.out.println(maker);
		Maker makert = makerDao.findOne(maker);
		
		for (int i = 0; i < categories.length; i++) {
		Category category = categoryDao.findOne(Integer.parseInt(categories[i]));
			commodity.getCategories().add(category);
			
			categoryDao.save(category);
		
		}
		commodity.setMaker(makert);
		makerDao.save(makert);
		commodityDao.save(commodity);
	}

	public List<Commodity> search(String search) {
		return commodityDao.liveSearch(search);
	}

	public Page<Commodity> findAllPage(int currentPage, int numberOfItem) {
		Pageable pageable = new PageRequest(currentPage, numberOfItem);
		return commodityDao.findAll(pageable);
	}

/*	public Page<Commodity> findPageCommodityByCategory(int id, int currentPage, int totalElement) {
		Pageable pageable = new PageRequest(currentPage, totalElement);
		return (Page<Commodity>) commodityDao.findPageCommodityByCategory(id, pageable);
	}*/
}
