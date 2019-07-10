package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import service.ScheduledService;

@Controller
public class TestController {
	
	@Autowired
	ScheduledService service;
	
	@RequestMapping(value= "/testP", method=RequestMethod.GET)
	public String insertP() {
		service.addTagsPrice();
		return "redirect:/";
	}
}
