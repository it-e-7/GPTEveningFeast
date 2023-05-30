package kosa.hdit5.evenapp.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kosa.hdit5.evenapp.service.CategoryService;
import kosa.hdit5.evenapp.service.MainService;
import kosa.hdit5.evenapp.service.ProductService;
import kosa.hdit5.evenapp.vo.CategoryVO;
import kosa.hdit5.evenapp.vo.ProductVO;
import kosa.hdit5.evenapp.vo.UserVO;

@Controller
@RequestMapping("/")
public class MainController {

	Logger log = LogManager.getLogger("case3");
	
	@Autowired
	MainService service; 
	
	@Autowired
	ProductService productService; 
	
	@GetMapping
	public String mainHandler(HttpSession session, Model model) {
		
		UserVO user = (UserVO) session.getAttribute("signinUser");
		List<ProductVO> list = productService.getRandomProduct();
		
		model.addAttribute("random", list);
		
		if(user == null || user.getUserId() == null) {
			log.debug("로그인하지 않은 유저가 접속했습니다");
		} else {
			log.debug("로그인 유저 : " + user.getUserId() + ", " + user.getUserName());
		}
		
		return "home";
	}

}
