package ua.com.shop.dao;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import ua.com.shop.entity.Commodity;

public interface CommodityDao extends JpaRepository<Commodity, Integer> {

	 @Query("select c from Commodity c where c.model LIKE CONCAT('%',:search,'%')")
	    List<Commodity> liveSearch(@Param("search") String search);
	 
/*	 @Query("select distinct c from Commodity c left join fetch c.categories where c.categories.id =:id ")
	 List<Commodity> findPageCommodityByCategory(@Param("id") int id ,Pageable pageable);*/
}
