package kosa.hdit5.evenapp.controller;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kosa.hdit5.evenapp.service.OrderService;
import kosa.hdit5.evenapp.vo.CartVO;
import kosa.hdit5.evenapp.vo.UserVO;

@Controller
@RequestMapping("order")
public class OrderController {
	
	
	Logger log = LogManager.getLogger("case3");
	
	
	@Autowired
	private OrderService service;
	
	@PostMapping
	public String postOrderHandler(@RequestBody List<CartVO> cart, HttpSession session, Model model) {
		
		UserVO userInfo = (UserVO) session.getAttribute("signinUser");
			
		for (CartVO item : cart) {
			item.setUserId(userInfo.getUserId());
		}
		
		List<CartVO> voList = service.selectPreOrderProduct(cart);
		
		
//		log.debug("controller {}", voList);

		model.addAttribute("user", userInfo);
		model.addAttribute("preOrderProduct", voList);
		
		return "order";
	}
	
	@GetMapping
	public String orderHandler(Model model) {
		log.debug("precart {}", model.getAttribute("preOrderProduct"));
		return "order";
	}
	
}
