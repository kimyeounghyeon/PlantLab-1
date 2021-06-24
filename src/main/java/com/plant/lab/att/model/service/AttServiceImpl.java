package com.plant.lab.att.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.plant.lab.att.model.dao.AttDao;

@Service("aService")
public class AttServiceImpl implements AttService{

	@Autowired
	private AttDao aDao;

}
