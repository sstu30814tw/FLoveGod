package com.loveGod.demo.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;


public interface pairDetailDao extends JpaRepository<pairDetail, Long> {
	
	@Query(value="SELECT * FROM pairDetail where YEAR(pairDate) =:year and MONTH(pairDate)=:month and DAY(pairDate) = :day",nativeQuery = true)
	public List<pairDetail> findTodayPair(int year,int month,int day);
	

}
