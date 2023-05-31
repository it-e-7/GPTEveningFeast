package kosa.hdit5.evenapp.controller;

import java.util.List;

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
import org.springframework.web.bind.annotation.SessionAttribute;

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
	public ResponseEntity<String> createCartHandler(@SessionAttribute UserVO signinUser, CartVO vo) {

		vo.setUserId(signinUser.getUserId());

		try {
			service.insertOrUpdateCart(vo);
			return ResponseEntity.ok("success");
		} catch (Exception e) {
			return ResponseEntity.badRequest().body("failed");
		}
		
	}
	
	@Auth
	@GetMapping()
	public String moveCartPageHandler(@SessionAttribute UserVO signinUser, Model model) {
		
		try {
			List<ProductVO> vo = service.selectProductFromCart(signinUser.getUserId());
			model.addAttribute("userInfo", signinUser.getUserId());
			model.addAttribute("cartInfo", vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "cart";
	}
	
	@Auth
	@PostMapping(value="delete", produces = "text/plain;charset=UTF-8")
	public ResponseEntity<String> deleteCartProductHandler(@RequestParam("productId") String productId) {
		
		try {
			int check = service.deleteCartProduct(productId);
			
			return ResponseEntity.ok(check==1 ? "success" : "failed");
		} catch(Exception e) {
			e.printStackTrace();
			
			return ResponseEntity.internalServerError().body(e.getMessage());
		}
		
	}

}
