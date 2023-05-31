package kosa.hdit5.evenapp.controller;

import java.util.HashMap;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import kosa.hdit5.evenapp.interceptor.annotation.Auth;
import kosa.hdit5.evenapp.service.UserService;
import kosa.hdit5.evenapp.vo.UserVO;

@Controller
@RequestMapping("signin")
@SessionAttributes(value = { "signinUser" })
public class SigninController {

	@Autowired
	private UserService service;

	@Inject
	private BCryptPasswordEncoder pwdEncoder;
	
	@ModelAttribute("signinUser")
	public UserVO createSigninUser() {
		return new UserVO();
	}

	@Auth(role = Auth.Role.UNAUTH)
	@GetMapping
	public String signinGetHandler() {
		return "signin";
	}

	@Auth(role = Auth.Role.UNAUTH)
	@PostMapping
	@ResponseBody
	public HashMap<String, Object> signinPostHandler(UserVO vo, Model model) {
		try {
			UserVO result = service.selectOneUser(vo.getUserId());
			boolean isPasswordMatch = (result != null) && pwdEncoder.matches(vo.getUserPw(), result.getUserPw());

			HashMap<String, Object> map = new HashMap<String, Object>();

			map.put("result", isPasswordMatch ? "success" : "failed");

			if (isPasswordMatch) {
				model.addAttribute("signinUser", result);
			}

			return map;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}
}
