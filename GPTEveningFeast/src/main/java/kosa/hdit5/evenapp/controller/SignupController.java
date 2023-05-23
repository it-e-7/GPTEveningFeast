package kosa.hdit5.evenapp.controller;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import kosa.hdit5.evenapp.vo.UserVO;

@SessionAttributes(value = "userInfo")
@Controller
@RequestMapping(value = "signup")
public class SignupController {

	Logger log = LogManager.getLogger("case3");

	@ModelAttribute(value = "userInfo")
	public UserVO createUser() {
		return new UserVO();
	}
	@GetMapping
	public String signupHandler() {
		return "redirect:/resources/signup/signup.html";
	}
	@GetMapping(value = "agreement")
	public String signupButtonHandler() {
		return "agreement";
	}

	@GetMapping(value = "form")
	public String signupAgreementHandler() {
		return "redirect:/resources/signup/form.html";
	}

	@PostMapping(value = "success")
	public String signupFormHandler(@ModelAttribute(value = "userInfo") UserVO user) {
		if (user.getUserSex().equals("여성"))
			log.debug("female");
		else
			log.debug("male");

		return "redirect:/resources/signup/success.html";

	}

}
