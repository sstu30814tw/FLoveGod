package com.loveGod.demo.service;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.loveGod.demo.model.Order;
import com.loveGod.demo.model.OrderDao;

@Transactional
@Service
public class ordermanagementService {
	
	
	@Autowired
	private OrderDao odao;
	
	public List<Order> findAllOrders(){
		return odao.findAll();
	}
	
	public Order insert(Order od) {
		return odao.save(od);
	}
	
	public Order findById(Integer id) {
		Optional<Order> optional =odao.findById(id);
		if(optional.isPresent()) {
			return optional.get();
		}
		return null;
	}
	
	public Page<Order>findByPage(Integer pageNumber){
		org.springframework.data.domain.Pageable pgb = PageRequest.of(pageNumber-1, 10,Sort.Direction.DESC,"orderDate");
		Page<Order> page = odao.findAll(pgb);
		return page;
	}
	
	public void deleteById(Integer id) {
		odao.deleteById(id);
	}
	
	

}
