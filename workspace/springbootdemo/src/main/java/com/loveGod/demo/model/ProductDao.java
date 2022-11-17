package com.loveGod.demo.model;

import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductDao extends JpaRepository<Products, Integer> {
//	@Query(value = "from Products where name = :name")
//	List<Products> findProductsByName(@Param("name")String name);
//	

}
