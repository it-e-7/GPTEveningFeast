package kosa.hdit5.evenapp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import kosa.hdit5.evenapp.interceptor.annotation.Auth;
import kosa.hdit5.evenapp.service.CartService;
import kosa.hdit5.evenapp.service.ProductService;
import kosa.hdit5.evenapp.util.ChatGPT;
import kosa.hdit5.evenapp.vo.GPTResultVO;
import kosa.hdit5.evenapp.vo.ProductVO;
import kosa.hdit5.evenapp.vo.UserVO;

@Controller
@RequestMapping("gpt")
public class GPTController {
	
	@Autowired
	ChatGPT GPTutil;
	
	@Autowired
	ProductService productService;
	
	@Autowired
	CartService cartService;

	@GetMapping
	public String gptSearchGetHandler() {
		return "gpterror";
	}
	
	@PostMapping
	public String gptSearchPostHandler(@RequestParam("searchParam") String searchParam, Model model) {
		
		String json = GPTutil.setGPTQuery(searchParam);
		
		try {
			GPTResultVO result = GPTutil.getGPTApi(json);
			model.addAttribute("GPTResult", result);
			
			String[] ingredients = result.getIngredients().keySet().toArray(new String[result.getIngredients().size()]);
			
			List<ProductVO> productResult =  productService.getGPTProduct(ingredients);
			model.addAttribute("productResult", productResult);
			
			return "gptresult";
		} catch (Exception err) {
			err.printStackTrace();
			return "gpterror";
		}
		
	}
	
	@Auth
	@PostMapping("cart")
	public String gptCartPostHandler(@SessionAttribute UserVO signinUser, @RequestParam("productList[]") List<String> productList) {
		String userId = signinUser.getUserId();
		
		try {
			cartService.insertOrUpdateGPTCart(userId, productList);
		} catch(Exception err) {
			err.printStackTrace();
		}
		
		return "cart";
	}
	
}
