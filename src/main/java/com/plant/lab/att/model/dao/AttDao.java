package com.plant.lab.att.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("aDao")
public class AttDao {

	  @Autowired
	   private SqlSession sqlSession;
	  

}
