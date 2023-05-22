package kosa.hdit5.evenapp;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kosa.hdit5.evenapp.mapper.UserMapper;
import kosa.hdit5.evenapp.vo.UserVO;


@Controller
public class HomeController {
	
	Logger log = LogManager.getLogger("case3");

	@Autowired
	SqlSession session;
	
	@Autowired
	UserMapper mapper;
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		getDB();
		
		return "home";
	}


	public void getDB() {
		
		List<UserVO> result = mapper.selectAllUser();
		
		log.debug(result);
		
	}
	
}
