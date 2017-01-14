package ua.com.shop.dao;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import ua.com.shop.entity.Category;
import ua.com.shop.entity.Commodity;

public interface CategoryDao extends JpaRepository<Category, Integer> {
	
	Category findByName(String name);
	
	@Query("select distinct c from Category c left join fetch c.commodities where c.id =:id")
	Category findCategoryWithCommodity(@Param("id") int id);
}
