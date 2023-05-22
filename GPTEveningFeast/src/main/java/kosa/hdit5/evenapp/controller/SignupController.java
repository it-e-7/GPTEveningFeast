package kosa.hdit5.evenapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value = "signup")
public class SignupController {

	@GetMapping
	public String signupButtonHandler(){
		return "signupform";
	}

	@GetMapping(value = "/agreement")
	public String signupAgreementHandler(@RequestParam("button") String agreebutton) {
		if(agreebutton.equals("next"))
			return "signupform";
		else
			return "redirect:/resources/signup/signupbutton.html";
	}
	
	
	
		
}
