package kosa.hdit5.evenapp.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
import kosa.hdit5.evenapp.vo.OrderVO;
import kosa.hdit5.evenapp.vo.UserVO;

@Controller
@RequestMapping("order")
@SessionAttributes(value = { "preOrderProduct", "price" })
public class OrderController {
	
	Logger log = LogManager.getLogger("case3");
	
	@Autowired
	private OrderService service;
	
	@ModelAttribute("preOrderProduct")
	public List<CartVO> createPreOrderProduct() {
		return new ArrayList<CartVO>();
	}
	
	@ModelAttribute("price")
	public int createPrice() {
		return 0;
	}

	@Auth
	@PostMapping
	@ResponseBody
	public ResponseEntity<Object> postOrderHandler(@RequestBody OrderVO order, HttpSession session, Model model) {
	    
	    UserVO userInfo = (UserVO) session.getAttribute("signinUser");
	    
	    for (CartVO item : order.getCart()) {
	        item.setUserId(userInfo.getUserId());
	    }
	        
	    try {
	        List<CartVO> voList = service.selectPreOrderProduct(order.getCart());
	        
	        model.addAttribute("preOrderProduct", voList);
	        model.addAttribute("price", order.getProductPrice());
	        
	        log.debug("controller {} {}", order.getProductPrice(), order.getCart());
	        
	        return ResponseEntity.status(HttpStatus.OK).body("{\"status\":\"success\"}");
	    } catch (Exception e) {
	        e.printStackTrace();
	        
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("{\"status\":\"failed\"}");
	    }
	    
	}
	
	
	@Auth
	@PostMapping("quick")
	@ResponseBody
	public String quickOrderHandler(@RequestBody OrderVO order, Model model) {
		    
        model.addAttribute("preOrderProduct", order.getCart());
        model.addAttribute("price", order.getProductPrice());
		    
		return "success";
	} 
	
	@Auth
	@GetMapping
	public String orderHandler(@ModelAttribute("preOrderProduct") List<CartVO> voList, @ModelAttribute("price") int price) {
		return "order";
	}
}
