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

import kosa.hdit5.evenapp.service.ProductService;
import kosa.hdit5.evenapp.vo.ProductVO;

@Controller
@RequestMapping("/")
public class MainController {

	Logger log = LogManager.getLogger("case3");
	
	@Autowired
	ProductService productService; 
	
	@GetMapping
	public String mainHandler(HttpSession session, Model model) {
		
		try {
			List<ProductVO> list = productService.getRandomProduct();
			
			model.addAttribute("random", list);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return "home";
	}
	
	@GetMapping("mypage")
	public String myPageHandler() {
		return "mypage";
	}

}
