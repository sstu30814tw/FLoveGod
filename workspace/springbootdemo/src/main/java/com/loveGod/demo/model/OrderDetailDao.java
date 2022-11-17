package com.loveGod.demo.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface OrderDetailDao extends JpaRepository<OrderDetail, Integer> {
	@Query(value="from OrderDetail  where orderId = :orderId")
	public List <OrderDetail> findByOrderId(Integer orderId);

//	@Query(value="select prod_name,sum(quanity)as prod_total_q from orderDetail_test3 group by prod_name",nativeQuery = true)
//	public List <SumProdQuanity> findByOrderDetailName();
	
//	@Query(value = "FROM OrderDetail", nativeQuery = true)
//	@Query(value = "FROM OrderDetail ")
//	public	List<OrderDetail> findByOrderDetailName();

}
