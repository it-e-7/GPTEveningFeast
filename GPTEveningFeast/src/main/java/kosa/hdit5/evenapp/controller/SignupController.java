package kosa.hdit5.evenapp.controller;

import javax.inject.Inject;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import kosa.hdit5.evenapp.interceptor.annotation.Auth;
import kosa.hdit5.evenapp.service.UserService;
import kosa.hdit5.evenapp.vo.UserVO;

@SessionAttributes(value = { "userInfo", "agreement" } )
@Controller
@RequestMapping(value = "signup")
public class SignupController {

	Logger log = LogManager.getLogger("case3");
	
	@Autowired
	private UserService service;
	
	@Inject
	private BCryptPasswordEncoder pwdEncoder;
	
	@ModelAttribute(value = "userInfo")
	public UserVO createUser() {
		return new UserVO();
	}
	
	@ModelAttribute("agreement")
	public boolean createAgreement() {
		return false;
	}
	
	//로그인 첫화면으로 이동
	@Auth(role = Auth.Role.UNAUTH)
	@GetMapping
	public String signupHandler() {
		return "signup";
	}
	
	//약관동의 화면으로 이동
	@Auth(role = Auth.Role.UNAUTH)
	@GetMapping(value = "agreement")
	public String signupButtonHandler() {
		return "agreement";
	}
	
	//약관 동의 후 세션 생성
	@Auth(role = Auth.Role.UNAUTH)
	@PostMapping(value = "agreement")
	public String signupAgreementHandler(@RequestParam("agreement") boolean agreement, Model model) {

		if (agreement) {
			model.addAttribute("agreement", true);
			return "form";
		} else {
			return "agreement";
		}
	}

	// 회원정보 입력 페이지로 이동
	@Auth(role = Auth.Role.UNAUTH)
	@GetMapping(value = "form")
	public String signupFormPageHandler(@SessionAttribute("agreement") boolean agreement, Model model) {
		if (agreement) {
			return "form";
		} else {
			return "signup";
		}
	}
	
	//중복확인 버튼 처리
	@Auth(role = Auth.Role.UNAUTH)
	@PostMapping(value = "validation", produces = "text/plain;charset=UTF-8")
	public ResponseEntity<String> validation(@RequestParam("userId") String userId) {
		
		try {
			boolean check = service.validateUniqueUserId(userId); 
			
			return ResponseEntity.ok(check ? "success" : "failed");
		} catch(Exception e) {
			e.printStackTrace();
			
			return ResponseEntity.badRequest().body(e.getMessage());
		}
		
	}
	

	//회원가입 완료 처리 및 회원가입 성공 페이지로 이동 
	@Auth(role = Auth.Role.UNAUTH)
	@PostMapping(value = "success")
	public ResponseEntity<String> signupFormHandler(@ModelAttribute(value = "userInfo") UserVO user, SessionStatus status) {
		
		try {
			user.setUserPw(pwdEncoder.encode(user.getUserPw()));
			service.createUser(user);
			status.setComplete();
			return ResponseEntity.status(HttpStatus.OK).body("success");
	
		} catch (Exception e) {
			e.printStackTrace();
			status.setComplete();
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("failed");
		}
	}
	
	
	@Auth(role = Auth.Role.UNAUTH)
	@GetMapping("success")
	public String signupSuccessHandler() {
		return "success";
	}
	
}
