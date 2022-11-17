package com.loveGod.demo.service;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.loveGod.demo.model.pairDetail;
import com.loveGod.demo.model.pairDetailDao;

@Transactional
@Service
public class pairManagementService {

	
	@Autowired
	private pairDetailDao pdao;
	
	public List<pairDetail> findAllPair(){
		return pdao.findAll();
	}
	
	public pairDetail insert(pairDetail pd) {
		return pdao.save(pd);
	}
	
	public pairDetail findById(Long id) {
		Optional<pairDetail> optional =pdao.findById(id);
		if(optional.isPresent()) {
			return optional.get();
		}
		return null;
	}
	
	public Page<pairDetail>findByPage(Integer pageNumber){
		org.springframework.data.domain.Pageable pgb = PageRequest.of(pageNumber-1, 7,Sort.Direction.ASC,"pairId");
		Page<pairDetail> page = pdao.findAll(pgb);
		return page;
	}
	
	public void deleteById(Long id) {
		pdao.deleteById(id);
	}
}
