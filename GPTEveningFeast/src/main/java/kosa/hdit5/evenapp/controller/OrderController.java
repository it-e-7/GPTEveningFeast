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
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import kosa.hdit5.evenapp.interceptor.annotation.Auth;
import kosa.hdit5.evenapp.service.OrderService;
import kosa.hdit5.evenapp.vo.CartVO;
import kosa.hdit5.evenapp.vo.OrderProductVO;
import kosa.hdit5.evenapp.vo.OrderVO;
import kosa.hdit5.evenapp.vo.UserVO;

@Controller
@RequestMapping("order")
@SessionAttributes(value = { "preOrderProduct", "price", "orderProduct" })
public class OrderController {
	
	Logger log = LogManager.getLogger("case3");
	
	@Autowired
	private OrderService service;
	
	@ModelAttribute("preOrderProduct")
	public List<CartVO> createPreOrderProduct() {
		return new ArrayList<CartVO>();
	}
	
	@ModelAttribute("orderProduct")
	public List<OrderProductVO> createOrderProduct() {
		return new ArrayList<OrderProductVO>();
	}
	
	@ModelAttribute("price")
	public int createPrice() {
		return 0;
	}

	@Auth
	@PostMapping
	@ResponseBody
	public ResponseEntity<Object> postOrderHandler(@RequestBody OrderVO order, @SessionAttribute UserVO signinUser, Model model) {
	    
	    for (CartVO item : order.getCart()) {
	        item.setUserId(signinUser.getUserId());
	    }
	        
	    try {
	        List<CartVO> voList = service.selectPreOrderProduct(order.getCart());
	        
	        model.addAttribute("preOrderProduct", voList);
	        model.addAttribute("price", order.getProductPrice());
	        
	        return ResponseEntity.status(HttpStatus.OK).body("{\"status\":\"success\"}");
	    } catch (Exception e) {
	        e.printStackTrace();
	        
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("{\"status\":\"failed\"}");
	    }
	    
	}
	
	// 바로구매 기능
	@Auth
	@PostMapping("quick")
	@ResponseBody
	public String quickOrderHandler(@RequestBody OrderVO order, Model model) {
		    
        model.addAttribute("preOrderProduct", order.getCart());
        model.addAttribute("price", order.getProductPrice());
		    
		return "success";
	} 
	
	// 주문하기 페이지 로드
	@Auth
	@GetMapping
	public String orderHandler(HttpSession session) {
		
		List<CartVO> pre = (List<CartVO>) session.getAttribute("preOrderProduct");
		
		if (pre == null) {
			return "redirect:/cart";
		}
		
		return "order";
	}
	
	// 주문하기 완료
	@Auth
	@PostMapping("success")
	public String successOrderHandler(@SessionAttribute UserVO signinUser, 
			@ModelAttribute("preOrderProduct") List<CartVO> voList, 
			@ModelAttribute("price") int price,
			Model model) {
		
		try {
			int orderId = service.insertOrder(signinUser.getUserId(), voList);

			List<OrderProductVO> vo = service.selectOrderProduct(orderId);
		
			model.addAttribute("orderProduct", vo);
		
			return "ordersuccess";
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
		
	}
	
	
	@Auth
	@GetMapping("ordersuccess")
	public String moveOrderSuccessHandler(@SessionAttribute List<OrderProductVO> orderProduct, SessionStatus status, Model model) {
		model.addAttribute("productList", orderProduct);
		status.setComplete();
		return "ordersuccess";
	}
	
	
	@Auth
	@GetMapping("orders")
	public String getOrderListHandler(@SessionAttribute UserVO signinUser, Model model) {
		
		try {
			List<OrderProductVO> vo = service.selectOrderList(signinUser.getUserId());
			model.addAttribute("orderList", vo);
			
			return "orders";
		} catch (Exception e) {
			e.printStackTrace();
			
			return null;
		}
	}

}
