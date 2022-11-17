package com.loveGod.demo.model;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

public interface DrawlotsDao extends JpaRepository<DrawlotsModel, Integer> {

	@Transactional
	@Modifying
	@Query(value="delete from customer where id = ?1", nativeQuery = true)
	public void deletelotsById(Integer id);

	@Query("select r from DrawlotsModel r where id = ?1 ")
	Optional<DrawlotsModel> findById(Integer id);

//	@Query(value="SELECT TOP 1 [drawId]\r\n"
//			+ "      ,[drawMean]\r\n"
//			+ "      ,[drawName]\r\n"
//			+ "FROM [SpringBootDB].[dbo].[drawlots]\r\n"
//			+ "ORDER BY NEWID()", nativeQuery = true)
//	List<DrawlotsModel> findByByNewId();
	//改list
	
	@Query(value="SELECT TOP 1 drawId,drawMean,drawName FROM drawlots ORDER BY NEWID()", nativeQuery = true)
	List<DrawlotsModel> findByByNewId();
	

	
}
