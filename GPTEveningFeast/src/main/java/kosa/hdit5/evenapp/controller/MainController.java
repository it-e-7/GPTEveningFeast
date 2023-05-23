package kosa.hdit5.evenapp.controller;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import kosa.hdit5.evenapp.service.MainService;
import kosa.hdit5.evenapp.vo.UserVO;

@Controller
@RequestMapping("/")
@SessionAttributes(value = { "signinUser" })
public class MainController {

	Logger log = LogManager.getLogger("case3");
	
	@Autowired
	MainService service; 
	
	@ModelAttribute("signinUser")
	public UserVO createSigninUser() {
		return new UserVO();
	}
	
	@GetMapping
	public String mainHandler() {
		
		log.debug(service.getAllUser());
		
		return "home";
	}
}
