package com.loveGod.demo.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface OrderDao extends JpaRepository<Order, Integer> {
	
	@Query(value="from Order  where userId = :userId order by order_Date desc")
	public List <Order> findByUserId(String userId);
//	

	

}
