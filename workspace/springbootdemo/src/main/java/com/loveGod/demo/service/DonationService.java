package com.loveGod.demo.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.loveGod.demo.model.DonationDao;
import com.loveGod.demo.model.DonationModel;

@Transactional
@Service
public class DonationService {
	
	@Autowired
	private DonationDao dDao;
	
	
	
	public DonationModel insert(DonationModel dsg) {
		return dDao.save(dsg);
	}
	
//-------------------找尋-----------------	
	public DonationModel findById(Integer id) {
		Optional<DonationModel> optional = dDao.findById(id);
		
		if(optional.isPresent()) {
			return optional.get();
		}
		return null;
	}
	
//-------------------刪除-----------------
	public void deleteById(Integer id) {
		dDao.deleteById(id);
	}
	
	public List<DonationModel> findAllDonation(){
		 return dDao.findAll();
	}
	
	public DonationModel insertDonation(DonationModel donationmodel) {
		return dDao.save(donationmodel);
	}
	
}


