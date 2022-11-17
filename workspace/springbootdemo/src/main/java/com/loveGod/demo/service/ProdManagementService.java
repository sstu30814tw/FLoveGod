package com.loveGod.demo.service;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.loveGod.demo.model.ProductDao;
import com.loveGod.demo.model.Products;

@Transactional
@Service
public class ProdManagementService {

	@Autowired
	private ProductDao pdao;
	
	public List<Products> findAllProducts(){
		return pdao.findAll();
	}
	
	public Products insert(Products pro) {
		return pdao.save(pro);
	}
		
	public Products findById(Integer id) {
		Optional<Products> optional = pdao.findById(id);
		if(optional.isPresent()) {
			return optional.get();
		}
		return null;
	}
	
	public Page<Products>findByPage(Integer pageNumber){
		org.springframework.data.domain.Pageable pgb = PageRequest.of(pageNumber-1, 7,Sort.Direction.ASC,"prodId");
		Page<Products> page = pdao.findAll(pgb);
		return page;
	}
	public void deleteById(Integer id) {
		pdao.deleteById(id);
	}
	
	
		
}
