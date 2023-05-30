package kosa.hdit5.evenapp.controller;

import java.util.HashMap;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kosa.hdit5.evenapp.interceptor.annotation.Auth;
import kosa.hdit5.evenapp.service.UserService;
import kosa.hdit5.evenapp.vo.UserVO;

@Controller
@RequestMapping("signin")
public class SigninController {

	@Autowired
	private UserService service;

	@Inject
	private BCryptPasswordEncoder pwdEncoder;

	@Auth(role = Auth.Role.UNAUTH)
	@GetMapping
	public String signinGetHandler() {
		return "signin";
	}

	@Auth(role = Auth.Role.UNAUTH)
	@PostMapping
	@ResponseBody
	public HashMap<String, Object> signinPostHandler(UserVO vo, HttpSession session) {
		try {
			UserVO result = service.selectOneUser(vo.getUserId());
			boolean isPasswordMatch = (result != null) && pwdEncoder.matches(vo.getUserPw(), result.getUserPw());

			HashMap<String, Object> map = new HashMap<String, Object>();

			map.put("result", isPasswordMatch ? "success" : "failed");

			if (isPasswordMatch) {
				session.setAttribute("signinUser", result);
			}

			return map;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}
}
