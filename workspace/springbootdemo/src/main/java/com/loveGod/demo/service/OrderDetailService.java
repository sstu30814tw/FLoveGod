package com.loveGod.demo.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.loveGod.demo.model.OrderDetail;
import com.loveGod.demo.model.OrderDetailDao;

@Transactional
@Service
public class OrderDetailService {
	
	@Autowired
	private OrderDetailDao oDDao;
	
//	@Autowired
//	private SumProdQuanity sPQDao;
	
	public OrderDetail insertOrderDetail(OrderDetail od) {
		return oDDao.save(od);
	}
	
	public List<OrderDetail> saveAllOrderDetail(List<OrderDetail> od) {
		return oDDao.saveAll(od);
	}
	
	public List<OrderDetail> listOrderDetail(){
		List<OrderDetail> list = oDDao.findAll();
		return list;
	}
	
	
	public OrderDetail getOrderDetail(Integer id) {
		Optional<OrderDetail> optional=oDDao.findById(id);
		
		if(optional.isPresent()) {
			return optional.get();
		}
		return null;

	}
	
	public List<OrderDetail> findOrderID(Integer orderId ) {
		 return  oDDao.findByOrderId(orderId);
		
	}
	
//	public List<SumProdQuanity> findByName() {
//		  List<SumProdQuanity> list = sPQDao.findByOrderDetailName();
//		  return list;
//	}
}
