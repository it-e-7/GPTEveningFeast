package kosa.hdit5.evenapp.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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

	@PostMapping()
	public void createCartHandler(HttpSession session, CartVO vo, Model model) {

		log.debug("create controller {}", vo);
	//	UserVO user = (UserVO) session.getAttribute("signinUser");
	//	vo.setUserId(user.getUserId());
		vo.setUserId("tt");
		
		service.insertOrUpdateCart(vo);
		model.addAttribute("cart", vo);
		
	}
	
	@GetMapping()
	public String moveCartPageHandler(HttpSession session, Model model) {
	//	UserVO user = (UserVO) session.getAttribute("signinUser");
	
	//	List<ProductVO> vo = service.selectProductFromCart(user.getUserId());
		List<ProductVO> vo = service.selectProductFromCart("tt");
		
		log.debug("controller {}", vo);
		model.addAttribute("cartInfo", vo);
		
		return "cart";
	}
	
	@PostMapping("delete")
	public String deleteCartProductHandler(@RequestParam("productId") String productId) {
		log.debug("controller {}", productId);
		
		service.deleteCartProduct(productId);
		
		return "redirect:/cart";
	}

}
