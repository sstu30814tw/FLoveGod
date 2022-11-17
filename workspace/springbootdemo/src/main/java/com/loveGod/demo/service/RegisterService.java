package com.loveGod.demo.service;

import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.loveGod.demo.model.RegisterDao;
import com.loveGod.demo.model.RegisterModel;

	@Transactional
	@Service
	public class RegisterService {

		@Autowired
		private RegisterDao rDao;
		
	//----------- 新增 -------------------
		public RegisterModel insertRegister(RegisterModel reg) {
			return rDao.save(reg);
		}
	//----------- 確認資料庫是否存在此帳戶，有就登入.... -------------------		
		public List<RegisterModel> findLogin(RegisterModel reg) {
			return rDao.findLogin(reg.getMemberId(), reg.getPassword());
		}
		
		public List<RegisterModel> findMemberId(RegisterModel reg) {
			return rDao.findMemberId(reg.getMemberId());
		}

		public List<RegisterModel> viewUser(String MemberId, String Password){
			return rDao.viewUser(MemberId, Password);
		}
		public int updateUser(RegisterModel reg) {
			String name = reg.getName();
			String sex = reg.getSex();
			Date birthday = reg.getBirthday();
			String phone = reg.getPhone();
			String mail = reg.getMail();
			String address = reg.getAddress();
			String mach  = reg.getMach();
			int age = reg.getAge();
			String text = reg.getText();
			String line = reg.getLine();
			String ig = reg.getIg();	
			String MemberId = reg.getMemberId();
			String Password = reg.getPassword();
			int result = rDao.updateUser(name, sex, birthday, phone, mail, address, mach, 
					age, text, line, ig, MemberId, Password);
			
			return result;
			
		}	
	
		
}