//package com.loveGod.demo.service;
//
//import java.util.List;
//import java.util.Optional;
//
//import javax.transaction.Transactional;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//
//import com.loveGod.demo.model.RegisterModel;
//import com.loveGod.demo.model.UserDao;
//@Transactional
//@Service
//public class UserService {
//	
//	@Autowired
//	private UserDao uDao;
//	
//	
//	//----------- 新增 -------------------
//	public RegisterModel insertUser(RegisterModel reg) {
//		return uDao.save(reg);
//	}
//
//	//----------- 修改使用者 -----------------
//	public RegisterModel findById(Integer id) {
//		Optional<RegisterModel> optional = uDao.findById(id);
//		
//		if (optional.isPresent()) {
//			return optional.get();
//		}
//		return null;
//	}
//	
//	public List<RegisterModel> findMemberId(RegisterModel reg) {
//		return uDao.findMemberId(reg.getMemberId());
//	}	
//
//}
