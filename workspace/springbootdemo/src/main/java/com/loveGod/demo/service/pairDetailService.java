package com.loveGod.demo.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.loveGod.demo.model.RegisterDao;
import com.loveGod.demo.model.RegisterModel;
import com.loveGod.demo.model.pairDetail;
import com.loveGod.demo.model.pairDetailDao;

@Transactional
@Service
public class pairDetailService {
	
	@Autowired
	pairDetailDao pairDetailDao;
	@Autowired
	RegisterDao RegisterDao;
	
	
	
	public pairDetail insert(pairDetail pd) {
		return pairDetailDao.save(pd);
	}
	
	public pairDetail findById(Long id) {
		Optional<pairDetail> optional = pairDetailDao.findById(id);
		
		if(optional.isPresent()) {
			return optional.get();		
		}
		
		return null;
	}
	
	public List<pairDetail> findTodayPair(int year,int month,int day){
		
		return pairDetailDao.findTodayPair(year, month, day);
	}
	
	
	
	public void newPairDetail(pairDetail pd) {
//		取得男、女清單
		
		List<RegisterModel> listBoy = RegisterDao.findCustomerBoy();
		List<RegisterModel> listGirl = RegisterDao.findCustomerGirl();
		//將list打亂
		Collections.shuffle(listBoy);							
		Collections.shuffle(listGirl);
		System.out.println("kkk"+listBoy.size());
		System.out.println("kkk"+listGirl.size());
		
		if(listBoy.size()>= listGirl.size()) {
			for(int i=0;i<listBoy.size();i++) {
				pd.setIdBoy(listBoy.get(i)); 
				if(i < listGirl.size()) {
					pd.setIdGirl(listGirl.get(i)); 
				}else {
					pd.setIdGirl(null); 
				}
				System.out.println(pd.getIdBoy());
				pairDetailDao.save(pd);
				pd = new pairDetail();
			}
			
			 
		}else{
			for(int i=0;i<listGirl.size();i++) {
				pd.setIdGirl(listGirl.get(i)); 
				if(i < listBoy.size()) {
					pd.setIdBoy(listBoy.get(i)); 
				}else {
					pd.setIdBoy(null); 
				}
				System.out.println(pd.getIdBoy());
				pairDetailDao.save(pd);
				pd = new pairDetail();
			}
		 
		}
		listBoy = new ArrayList<>();
		listGirl = new ArrayList<>();
		System.out.println("kkk"+listBoy.size());
		System.out.println("kkk"+listGirl.size());
	}

}
