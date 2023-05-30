package kosa.hdit5.evenapp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kosa.hdit5.evenapp.service.CategoryService;
import kosa.hdit5.evenapp.vo.CategoryVO;

@RestController
@RequestMapping("category")
public class CategoryController {

	@Autowired
	private CategoryService service;
	
	@GetMapping
	public List<CategoryVO> getCategoryHandler() {
		try {
			return service.getCategoryList();
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}
}
