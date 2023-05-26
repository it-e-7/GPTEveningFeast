package kosa.hdit5.evenapp.service;

import java.util.List;

import kosa.hdit5.evenapp.vo.CartVO;
import kosa.hdit5.evenapp.vo.ProductVO;

public interface CartService {

	public void insertOrUpdateCart(CartVO vo);
	public List<ProductVO> selectProductFromCart(String userId);

}
