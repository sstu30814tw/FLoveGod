package com.loveGod.demo.service;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.loveGod.demo.model.DonationDao;
import com.loveGod.demo.model.DonationModel;

@Transactional
@Service
public class donationManagementService {

	@Autowired
	private DonationDao ddao;
	
	public List<DonationModel> findAlldonations(){
		return ddao.findAll();
	}
	
	public DonationModel insert(DonationModel dm) {
		return ddao.save(dm);
	}
		
	public DonationModel findById(Integer id) {
		Optional<DonationModel> optional = ddao.findById(id);
		if(optional.isPresent()) {
			return optional.get();
		}
		return null;
	}
	
	public Page<DonationModel>findByPage(Integer pageNumber){
		org.springframework.data.domain.Pageable pgb = PageRequest.of(pageNumber-1, 10,Sort.Direction.DESC,"time");
		Page<DonationModel> page = ddao.findAll(pgb);
		return page;
	}
	public void deleteById(Integer id) {
		ddao.deleteById(id);
	}
	
	
	
}
