package ua.com.shop.service;

import java.util.List;

import ua.com.shop.dto.CommodityDTO;
import ua.com.shop.entity.Commodity;


public interface CommodityService {

	void save(Commodity commodity);
	List<Commodity> findAll();
	Commodity findOne(int id);
	void delete(int id);
	
	void savecategoryCommodity(String name , String model , double price, int maker , String[] categories);
	
	List<Commodity> search(String search);
	
}
