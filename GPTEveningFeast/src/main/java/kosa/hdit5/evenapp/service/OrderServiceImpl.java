package kosa.hdit5.evenapp.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosa.hdit5.evenapp.mapper.OrderMapper;
import kosa.hdit5.evenapp.mapper.UserMapper;
import kosa.hdit5.evenapp.vo.CartVO;
import kosa.hdit5.evenapp.vo.OrderProductVO;
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
		
		List<CartVO> result = orderMapper.selectPreOrderProduct(map);
		
		for(CartVO cartItem : arrCart) {
			for(CartVO resultItem : result) {
				if(resultItem.getProductId().equals(cartItem.getProductId())) {
					resultItem.setProductCnt(cartItem.getProductCnt());
				}
			}
		}
		
		return result;
	}

	@Override
	public int insertOrder(String userId, List<CartVO> orderProduct) {

	    Map<String, Object> params = new HashMap<String, Object>();
	    params.put("userId", userId);
	    params.put("orderProduct", orderProduct);
	    params.put("orderId", 0);
	    		
		orderMapper.insertOrder(params);
		
		return (int) params.get("orderId");
	}


	@Override
	public List<OrderProductVO> selectOrderProduct(int orderId) {

		List<OrderProductVO> vo = orderMapper.selectOrderProduct(orderId);
		
		return vo;
	}

	@Override
	public List<OrderProductVO> selectOrderList(String userId) {
		
		return orderMapper.selectOrderList(userId);
	}
	

}
