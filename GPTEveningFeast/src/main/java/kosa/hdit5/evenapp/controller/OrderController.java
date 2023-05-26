package kosa.hdit5.evenapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("order")
public class OrderController {

	@GetMapping
	public String moveOrderPageHandler() {
		return "order";
	}
	
}
