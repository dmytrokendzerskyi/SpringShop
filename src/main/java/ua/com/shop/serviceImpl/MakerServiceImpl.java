package ua.com.shop.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ua.com.shop.dao.CommodityDao;
import ua.com.shop.dao.MakerDao;
import ua.com.shop.entity.Commodity;
import ua.com.shop.entity.Maker;
import ua.com.shop.service.MakerService;

@Service
public class MakerServiceImpl implements MakerService{

	@Autowired
	private MakerDao makerDao;
	
	@Autowired
	private CommodityDao commodityDao;
	
	public void save(Maker maker) {
		makerDao.save(maker);
	}

	public List<Maker> findAll() {
		return makerDao.findAll();
	}

	public Maker findOne(int id) {
		return makerDao.findOne(id);
	}

	public void delete(int id) {
		makerDao.delete(id);
	}

	public Maker findByName(String name) {
		return makerDao.findByName(name);
	}

	public void deleteMakerWithCommodity(String id) {
		Maker maker = makerDao.deleteMaker(Integer.parseInt(id));
		System.out.println(maker);
		for (Commodity commodity : maker.getCommodities()) {
			commodity.setMaker(null);
			commodityDao.save(commodity);
		}
		int idmaker = Integer.parseInt(id);
		makerDao.delete(idmaker);
	}

	
	
	
}
