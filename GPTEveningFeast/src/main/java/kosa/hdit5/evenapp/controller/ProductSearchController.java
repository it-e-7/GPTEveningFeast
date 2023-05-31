package kosa.hdit5.evenapp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kosa.hdit5.evenapp.service.ProductService;
import kosa.hdit5.evenapp.vo.ProductVO;

@Controller
@RequestMapping("search")
public class ProductSearchController {

	@Autowired
	ProductService productService;
	
	@GetMapping
	public String searchProductHandler(String searchParam, Model model) {
		
		try {
			List<ProductVO> productList = productService.getProductListBySearch(searchParam, 1);
			model.addAttribute("searchParam", searchParam);
			model.addAttribute("productList", productList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "searchresult";
	}
	
	@PostMapping("scroll")
	@ResponseBody
	public List<ProductVO> listScrollHandler(String searchParam, int offset) {
		try {
			List<ProductVO> productList = productService.getProductListBySearch(searchParam, offset);
			
			return productList;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
