package com.loveGod.demo.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.loveGod.demo.model.ProductDao;
import com.loveGod.demo.model.Products;


@Transactional
@Service
public class ProductService {

	@Autowired
	private ProductDao pDao;
	
	public Products insertProducts(Products pr) {
		return pDao.save(pr);
	}
	
	public List<Products> listProducts(){
		return pDao.findAll();
	}
	
	public Products getProducts(Integer id) {
		Optional<Products> optional=pDao.findById(id);
		
		if(optional.isPresent()) {
			return optional.get();
		}
		return null;
	}
	


}
