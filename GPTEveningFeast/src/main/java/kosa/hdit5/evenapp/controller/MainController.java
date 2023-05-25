package kosa.hdit5.evenapp.controller;

import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import kosa.hdit5.evenapp.service.MainService;
import kosa.hdit5.evenapp.vo.UserVO;

@Controller
@RequestMapping("/")
public class MainController {

	Logger log = LogManager.getLogger("case3");
	
	@Autowired
	MainService service; 
	
	@GetMapping
	public String mainHandler(HttpSession session) {
		
		UserVO vo = (UserVO) session.getAttribute("signinUser");
		
		if(vo == null || vo.getUserId() == null) {
			log.debug("로그인하지 않은 유저가 접속했습니다");
		} else {
			log.debug("로그인 유저 : " + vo.getUserId() + ", " + vo.getUserName());
		}
		
		return "home";
	}

}
