package com.plant.lab.event.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.plant.lab.event.model.dao.EventDao;

@Service("eService")
public class EventServiceImpl implements EventService {

		@Autowired
		private EventDao eDao;
}
