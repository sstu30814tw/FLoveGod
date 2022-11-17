package com.loveGod.demo.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.loveGod.demo.model.Order;
import com.loveGod.demo.model.OrderDao;

@Transactional
@Service
public class OrderService {
	
	@Autowired
	private OrderDao oDao;
	
	public Order insertOrder(Order or) {
		return oDao.save(or);
	}
	
	public List<Order> findAllOrder() {
		return oDao.findAll();
	}
	
	public Order getProducts(Integer id) {
		Optional<Order> optional=oDao.findById(id);
		
		if(optional.isPresent()) {
			return optional.get();
		}
		return null;
	}

	public List<Order> findUserId(String UserId) {
		return oDao.findByUserId(UserId);
	}
	

	public Page<Order> findByPage(Integer pageNumber){
		//pageNumber-1 pageNumber設定為從第1頁開始 0=第一頁， 每五筆一頁， 依照 orderDate 做降幕排序  
		Pageable pgb = PageRequest.of(pageNumber-1, 5, Sort.Direction.DESC, "orderDate");
		Page<Order> page = oDao.findAll(pgb);
		return page;
	}
	

}
