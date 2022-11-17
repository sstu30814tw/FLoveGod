//package com.loveGod.demo.model;
//
//import java.util.List;
//import java.util.Optional;
//
//import org.springframework.data.jpa.repository.JpaRepository;
//import org.springframework.data.jpa.repository.Query;
//
//	public interface UserDao extends JpaRepository<RegisterModel, Integer> {
//	
//		@Query("select r from RegisterModel r where r.Id = ?1 ")
//		Optional<RegisterModel> findById(Integer id);
//	
//		@Query("select r from RegisterModel r where r.memberId = ?1 ")
//		List<RegisterModel> findMemberId(String memberId);
//}
