package com.plant.lab.event.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.plant.lab.event.model.service.EventService;

@Controller
public class EventController {

	@Autowired
	private EventService eService;
}
