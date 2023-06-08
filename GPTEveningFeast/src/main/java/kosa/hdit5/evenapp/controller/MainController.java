package kosa.hdit5.evenapp.controller;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import kosa.hdit5.evenapp.interceptor.annotation.Auth;
import kosa.hdit5.evenapp.service.GPTService;
import kosa.hdit5.evenapp.service.ProductService;
import kosa.hdit5.evenapp.vo.GPTHistoryVO;
import kosa.hdit5.evenapp.vo.GPTResultVO;
import kosa.hdit5.evenapp.vo.ProductVO;
import kosa.hdit5.evenapp.vo.UserVO;

@Controller
@RequestMapping("/")
public class MainController {

	Logger log = LogManager.getLogger("case3");
	
	@Autowired
	ProductService productService; 
	
	@Autowired
	GPTService gptService;
	
	@GetMapping
	public String mainHandler(Model model) {
		
		try {
			List<ProductVO> list = productService.getRandomProduct();
			
			model.addAttribute("random", list);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return "home";
	}
	
	@Auth
	@GetMapping("mypage")
	public String myPageHandler(@SessionAttribute("signinUser") UserVO signinUser, Model model) {
		String userId = signinUser.getUserId();
		
		try {
			List<GPTHistoryVO> historyList = gptService.getGPTHistoryList(userId);
			
			model.addAttribute("historyList", historyList);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return "mypage";
	}

}
