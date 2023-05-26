package kosa.hdit5.evenapp.controller;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import kosa.hdit5.evenapp.service.ProductService;
import kosa.hdit5.evenapp.vo.ProductVO;

@Controller
@RequestMapping("product")
public class ProductDetailController {

	Logger log = LogManager.getLogger("case3");
	
	@Autowired
	ProductService service;

	@GetMapping("{productId}")
	public String productDetailGetHandler(@PathVariable("productId") String productId, Model model) {
		
		ProductVO vo = service.getProductDetail(productId);
		model.addAttribute("productDetail", vo);

		return "productdetail";
	}
}
