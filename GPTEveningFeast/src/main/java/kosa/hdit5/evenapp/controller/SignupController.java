package kosa.hdit5.evenapp.controller;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import kosa.hdit5.evenapp.service.SignupService;
import kosa.hdit5.evenapp.vo.UserVO;

@SessionAttributes(value = "userInfo")
@Controller
@RequestMapping(value = "signup")
public class SignupController {

	Logger log = LogManager.getLogger("case3");
	
	@Autowired
	private SignupService service;
	
	@ModelAttribute(value = "userInfo")
	public UserVO createUser() {
		return new UserVO();
	}
	
	//로그인 첫화면으로 이동
	@GetMapping
	public String signupHandler() {
		return "redirect:/resources/signup/signup.html";
	}
	
	//약관동의 화면으로 이동
	@GetMapping(value = "agreement")
	public String signupButtonHandler() {
		return "agreement";
	}

	//회원정보 입력 페이지로 이동
	@GetMapping(value = "form")
	public String signupAgreementHandler() {
		return "redirect:/resources/signup/form.html";
	}
	//중복확인 버튼 처리
	@PostMapping(value = "validation")
	@ResponseBody
	public String validation(@RequestParam("userId") String userId) {
		log.debug(userId);
		
		boolean check = service.validateUniqueUserId(userId); 
		
		if(check) {
			return "success";
		} else {
			return "failed";
		}
		
	}

	//회원가입 완료 처리 및 회원가입 성공 페이지로 이동 
	@PostMapping(value = "success")
	public String signupFormHandler(@ModelAttribute(value = "userInfo") UserVO user) {
		
		
		if (user.getUserSex().equals("여성"))
			log.debug("female");
		else
			log.debug("male");

		return "redirect:/resources/signup/success.html";

	}

}
