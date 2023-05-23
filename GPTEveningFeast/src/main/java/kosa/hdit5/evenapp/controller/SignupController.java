package kosa.hdit5.evenapp.controller;

import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import kosa.hdit5.evenapp.service.SignupService;
import kosa.hdit5.evenapp.vo.UserVO;

@SessionAttributes(value = "userInfo")
@Controller
@RequestMapping(value = "signup")
public class SignupController {

	Logger log = LogManager.getLogger("case3");
	
	@Autowired
	private HttpSession session;
	
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
	//약관 동의 후 세션 생성
	@PostMapping(value = "agreement")
	public String signupAgreementHandler(@RequestParam("agree") boolean agree) {
		if (agree) {
			session.setAttribute("agreement", true);
			return "redirect:/signup/form";
		} else {
			return "redirect:/signup/signup";
		}
	}

	// 회원정보 입력 페이지로 이동
	@GetMapping(value = "form")
	public String signupFormPageHandler() {
		if (session.getAttribute("agreement") != null && (Boolean) session.getAttribute("agreement")) {
			return "form";
		} else {
			return "redirect:/resources/signup/signup.html";
		}
	}
	//중복확인 버튼 처리
	@PostMapping(value = "validation", produces = "text/plain;charset=UTF-8")
	public ResponseEntity<String> validation(@RequestParam("userId") String userId) {
		log.debug(userId);
		
		boolean check = service.validateUniqueUserId(userId); 
		
		return ResponseEntity.ok(check ? "success" : "failed");
	}
	

	//회원가입 완료 처리 및 회원가입 성공 페이지로 이동 
	@PostMapping(value = "success")
	public String signupFormHandler(@ModelAttribute(value = "userInfo") UserVO user) {
		
		boolean test = service.createUser(user);

		log.debug(user);
		log.debug(test);
		if (user.getUserSex().equals("여성"))
			log.debug("female");
		else
			log.debug("male");
		
		session.removeAttribute("agreement");
		return "redirect:/resources/signup/success.html";

	}

}
