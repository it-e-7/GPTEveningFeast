package kosa.hdit5.evenapp.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;

import kosa.hdit5.evenapp.interceptor.annotation.Auth;
import kosa.hdit5.evenapp.service.UserService;
import kosa.hdit5.evenapp.vo.UserVO;

@Controller
@RequestMapping("/update")
public class UserupdateController {

	Logger log = LogManager.getLogger("case3");

	
	@Autowired
	private UserService service;

	@Inject
	private BCryptPasswordEncoder pwdEncoder;
	
	@Auth
	@GetMapping
	public String signupHandler() {
		return "userupdate";
	}
	
	@Auth
	@PostMapping(value="updateUser")
	@ResponseBody
	public ResponseEntity<String> userUpdate(
			HttpSession session,
			@RequestBody UserVO edituser, 
			SessionStatus status){
			UserVO userInfo = (UserVO) session.getAttribute("signinUser");

		try {
			userInfo.setUserPw(!edituser.getUserPw().equals("") ? pwdEncoder.encode(edituser.getUserPw()) : "");
			userInfo.setUserAddress(!edituser.getUserAddress().equals("") ? edituser.getUserAddress() : userInfo.getUserAddress());

			service.userUpdate(userInfo);
			status.setComplete();
			return ResponseEntity.status(HttpStatus.OK).body("success");
	
		} catch (Exception e) {
			e.printStackTrace();
			status.setComplete();
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("failed");
		}
	}
}
