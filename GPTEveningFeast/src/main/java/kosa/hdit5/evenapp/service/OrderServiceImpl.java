package kosa.hdit5.evenapp.service;

import java.util.HashMap;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosa.hdit5.evenapp.mapper.OrderMapper;
import kosa.hdit5.evenapp.mapper.UserMapper;
import kosa.hdit5.evenapp.vo.CartVO;
import kosa.hdit5.evenapp.vo.UserVO;

@Service
public class OrderServiceImpl implements OrderService {

	Logger log = LogManager.getLogger("case3");
	
	@Autowired
	private UserMapper userMapper;
	
	@Autowired 
	private OrderMapper orderMapper;
	
	@Override
	public UserVO selectUserInfo(String userId) {
		return userMapper.selectOneUser(userId);
	}

	@Override
	public List<CartVO> selectPreOrderProduct(List<CartVO> arrCart) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("cartList",arrCart);
		
		log.debug("service {} {}", arrCart);
		
		
		return orderMapper.selectPreOrderProduct(map);
	}

}
