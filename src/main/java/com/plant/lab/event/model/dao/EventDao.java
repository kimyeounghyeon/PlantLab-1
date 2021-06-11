package com.plant.lab.event.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("eDao")
public class EventDao {
	   @Autowired
	   private SqlSession sqlSession;
	
}
