package kosa.hdit5.evenapp.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;

import kosa.hdit5.evenapp.service.SigninService;
import kosa.hdit5.evenapp.vo.UserVO;

@Controller
@RequestMapping("signin")
@SessionAttributes(value = { "signinUser" })
public class SigninController {
	
	@Autowired
	SigninService service;
	
	@ModelAttribute("signinUser")
	public UserVO createSigninUser() {
		return new UserVO();
	}

	@GetMapping
	public String signinGetHandler() {
		return "signin";
	}
	
	@PostMapping
	@ResponseBody
	public HashMap<String, Object> signinPostHandler(@ModelAttribute("signinUser") UserVO vo, Model model) {
		UserVO result = service.getUser(vo);
		model.addAttribute("signinUser", result);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		if(result != null) {
			map.put("result", "success");
		} else {
			map.put("result", "failed");
		}
		return map;
	}
}