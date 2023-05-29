package kosa.hdit5.evenapp.controller;

import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kosa.hdit5.evenapp.service.CartService;
import kosa.hdit5.evenapp.vo.CartVO;
import kosa.hdit5.evenapp.vo.UserVO;

@Controller
@RequestMapping("cart")
public class CartController {

	Logger log = LogManager.getLogger("case3");

	@Autowired
	private CartService service;
	
	@GetMapping
	public String getCartHandler() {
		return "cart";
	}

	@PostMapping
	public String createCartHandler(HttpSession session, CartVO vo, Model model) {

		UserVO user = (UserVO) session.getAttribute("signinUser");
		vo.setUserId(user.getUserId());
		service.insertOrUpdateCart(vo);
		model.addAttribute("cart", vo);
		
		return "cart";
	}
}
