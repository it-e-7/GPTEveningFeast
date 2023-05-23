package kosa.hdit5.evenapp.controller;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kosa.hdit5.evenapp.service.MainService;

@Controller
@RequestMapping("/")
public class MainController {

	Logger log = LogManager.getLogger("case3");
	
	@Autowired
	MainService service; 
	
	@GetMapping
	public String mainHandler() {
		
		log.debug(service.getAllUser());
		
		return "home";
	}
	

}
