package kosa.hdit5.evenapp.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kosa.hdit5.evenapp.interceptor.annotation.Auth;
import kosa.hdit5.evenapp.service.CartService;
import kosa.hdit5.evenapp.vo.CartVO;
import kosa.hdit5.evenapp.vo.ProductVO;
import kosa.hdit5.evenapp.vo.UserVO;

@Controller
@RequestMapping("cart")
public class CartController {

	Logger log = LogManager.getLogger("case3");

	@Autowired
	private CartService service;

	@Auth
	@PostMapping()
	public ResponseEntity<String> createCartHandler(HttpSession session, CartVO vo) {

		UserVO user = (UserVO) session.getAttribute("signinUser");
		vo.setUserId(user.getUserId());

		try {
			service.insertOrUpdateCart(vo);
			return ResponseEntity.ok("success");
		} catch (Exception e) {
			return ResponseEntity.badRequest().body("failed");
		}
		
	}
	
	@Auth
	@GetMapping()
	public String moveCartPageHandler(HttpSession session, Model model) {
		UserVO user = (UserVO) session.getAttribute("signinUser");
	
		List<ProductVO> vo = service.selectProductFromCart(user.getUserId());

		model.addAttribute("userInfo", user.getUserId());
		model.addAttribute("cartInfo", vo);
		
		return "cart";
	}
	
	@Auth
	@PostMapping(value="delete", produces = "text/plain;charset=UTF-8")
	public ResponseEntity<String> deleteCartProductHandler(@RequestParam("productId") String productId) {
		
		int check = service.deleteCartProduct(productId);
		
		return ResponseEntity.ok(check==1 ? "success" : "failed");
	}

}
