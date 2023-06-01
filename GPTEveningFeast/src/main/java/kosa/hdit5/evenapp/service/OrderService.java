package kosa.hdit5.evenapp.service;

import java.util.List;

import kosa.hdit5.evenapp.vo.CartVO;
import kosa.hdit5.evenapp.vo.OrderProductVO;
import kosa.hdit5.evenapp.vo.UserVO;

public interface OrderService {

	public UserVO selectUserInfo(String userId);
	public List<CartVO> selectPreOrderProduct(List<CartVO> arr_cart);
	public int insertOrder(String userId, List<CartVO> orderProduct);
	public List<OrderProductVO> selectOrderProduct(int orderId);
	public List<OrderProductVO> selectOrderList(String userId);
	
}
