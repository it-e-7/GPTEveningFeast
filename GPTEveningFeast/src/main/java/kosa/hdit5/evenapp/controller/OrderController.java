package kosa.hdit5.evenapp.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import kosa.hdit5.evenapp.interceptor.annotation.Auth;
import kosa.hdit5.evenapp.service.OrderService;
import kosa.hdit5.evenapp.vo.CartVO;
import kosa.hdit5.evenapp.vo.UserVO;

@Controller
@RequestMapping("order")
@SessionAttributes(value = { "preOrderProduct" })
public class OrderController {
	
	Logger log = LogManager.getLogger("case3");
	
	@Autowired
	private OrderService service;
	
	@ModelAttribute("preOrderProduct")
	public List<CartVO> createPreOrderProduct() {
		return new ArrayList<CartVO>();
	}

	@Auth
	@PostMapping
	@ResponseBody
	public String postOrderHandler(@RequestBody List<CartVO> cart, HttpSession session, Model model) {
	    UserVO userInfo = (UserVO) session.getAttribute("signinUser");
	    
	    for (CartVO item : cart) {
	        item.setUserId(userInfo.getUserId());
	    }
	    
	    log.debug("controller {}", cart);
	    
	    try {
	    	List<CartVO> voList = service.selectPreOrderProduct(cart);
		    
		    model.addAttribute("preOrderProduct", voList);
		    
		    log.debug("controller voList{}", voList);
		    
		    return "success";
		} catch (Exception e) {
			e.printStackTrace();
			
			return "failed";
		}
	    
	}   

	
	@Auth
	@GetMapping
	public String orderHandler(@ModelAttribute("preOrderProduct") List<CartVO> voList) {
		return "order";
	}
	
	
	@Auth
	@PostMapping("quick")
	@ResponseBody
	public String quickOrderHandler(@RequestBody List<CartVO> cart, Model model) {
		    
		model.addAttribute("preOrderProduct", cart);
		    
		return "success";
	}   
}
