package ua.com.shop.service;

import java.util.List;

import ua.com.shop.entity.Maker;


public interface MakerService  {

	void save(Maker maker);
	List<Maker> findAll();
	Maker findOne(int id);
	void delete(int id);
	
	Maker findByName(String name);
	
	void deleteMakerWithCommodity(String id);
	
	
}
