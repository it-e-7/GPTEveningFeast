package kosa.hdit5.evenapp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kosa.hdit5.evenapp.util.ChatGPT;
import kosa.hdit5.evenapp.vo.GPTResultVO;

@Controller
@RequestMapping("gpt")
public class GPTController {
	
	@Autowired
	ChatGPT GPTutil;

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
			return "gptresult";
		} catch (Exception err) {
			err.printStackTrace();
			return "gpterror";
		}
		
		
	}
}
