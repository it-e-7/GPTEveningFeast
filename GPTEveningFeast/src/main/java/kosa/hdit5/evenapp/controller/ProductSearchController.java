package kosa.hdit5.evenapp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kosa.hdit5.evenapp.service.ProductService;
import kosa.hdit5.evenapp.vo.ProductVO;

@Controller
@RequestMapping("search")
public class ProductSearchController {

	@Autowired
	ProductService productService;
	
	@GetMapping
	public String searchProductHandler(@RequestParam("searchParam") String searchParam, Model model) {
		
		List<ProductVO> productList = productService.getProductListBySearch(searchParam);
		model.addAttribute("searchParam", searchParam);
		model.addAttribute("productList", productList);
		
		return "searchresult";
	}
}
