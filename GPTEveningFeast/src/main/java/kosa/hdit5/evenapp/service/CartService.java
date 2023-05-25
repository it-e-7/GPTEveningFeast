package kosa.hdit5.evenapp.service;

import kosa.hdit5.evenapp.vo.CartVO;

public interface CartService {

	public int createCart(CartVO vo);
	public void insertOrUpdateCart(CartVO vo);
}
