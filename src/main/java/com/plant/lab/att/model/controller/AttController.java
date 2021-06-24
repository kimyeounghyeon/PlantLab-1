package com.plant.lab.att.model.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.plant.lab.att.model.service.AttService;

@Controller
public class AttController {

	@Autowired
	private AttService aService;
	
	private static final Logger logger = LoggerFactory.getLogger(AttController.class);
}
