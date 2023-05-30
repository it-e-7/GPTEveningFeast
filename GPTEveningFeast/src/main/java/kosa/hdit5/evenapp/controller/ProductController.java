package kosa.hdit5.evenapp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kosa.hdit5.evenapp.service.CategoryService;
import kosa.hdit5.evenapp.service.ProductService;
import kosa.hdit5.evenapp.vo.CategoryVO;
import kosa.hdit5.evenapp.vo.ProductVO;

@Controller
@RequestMapping("product")
public class ProductController {

	@Autowired
	ProductService productService;

	@Autowired
	CategoryService categoryService;

	@GetMapping
	public String getProductListHandler(@RequestParam("category") String ctgrId, 
										@RequestParam("section") String sectId,
										Model model) {
		
		try {
			CategoryVO categoryVO = categoryService.getCategory(ctgrId);
			List<ProductVO> productList = productService.getProductList(ctgrId, sectId);
			
			model.addAttribute("category", categoryVO);
			model.addAttribute("productList", productList);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "productlist";
	}
	
	@GetMapping("{productId}")
	public String productDetailGetHandler(@PathVariable("productId") String productId, Model model) {

		try {
			ProductVO vo = productService.getProductDetail(productId);
			model.addAttribute("productDetail", vo);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "productdetail";
	}
}
