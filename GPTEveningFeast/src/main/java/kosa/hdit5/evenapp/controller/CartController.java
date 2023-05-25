package kosa.hdit5.evenapp.controller;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kosa.hdit5.evenapp.service.CartService;
import kosa.hdit5.evenapp.vo.CartVO;

@Controller
@RequestMapping("cart")

public class CartController {

	Logger log = LogManager.getLogger("case3");

	@Autowired
	private CartService service;

	@PostMapping
	public String createCartHandler(CartVO vo, Model model) {

		vo.setUserId("tt");
		service.createCart(vo);
	
		
		model.addAttribute("cart", vo);

		log.debug("controller {}", vo);
		return "cartpage";
	}

}
