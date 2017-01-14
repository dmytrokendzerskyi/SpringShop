package ua.com.shop.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import ua.com.shop.entity.Commodity;
import ua.com.shop.entity.Maker;

public interface MakerDao extends JpaRepository<Maker, Integer> {


	Maker findByName(String name);
	
	 @Query("select m from Maker m left join fetch m.commodities where m.id =:id")
	 Maker deleteMaker(@Param("id") int id);
}
