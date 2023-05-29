package kosa.hdit5.evenapp.service;

import java.util.List;

import kosa.hdit5.evenapp.vo.CartVO;
import kosa.hdit5.evenapp.vo.UserVO;

public interface OrderService {

	public UserVO selectUserInfo(String userId);
	public List<CartVO> selectPreOrderProduct(List<CartVO> arr_cart);
}
