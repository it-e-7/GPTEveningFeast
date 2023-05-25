package kosa.hdit5.evenapp.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kosa.hdit5.evenapp.interceptor.annotation.Auth;
import kosa.hdit5.evenapp.service.SigninService;
import kosa.hdit5.evenapp.vo.UserVO;

@Controller
@RequestMapping("signin")
public class SigninController {

	@Autowired
	private SigninService service;

	@Auth(role = Auth.Role.UNAUTH)
	@GetMapping
	public String signinGetHandler() {
		return "signin";
	}

	@Auth(role = Auth.Role.UNAUTH)
	@PostMapping
	@ResponseBody
	public HashMap<String, Object> signinPostHandler(UserVO vo, HttpSession session) {
		UserVO result = service.getUser(vo);

		session.setAttribute("signinUser", result);

		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("result", result == null ? "failed" : "success");

		return map;
	}
}
