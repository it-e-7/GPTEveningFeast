package kosa.hdit5.evenapp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosa.hdit5.evenapp.mapper.CartMapper;
import kosa.hdit5.evenapp.vo.CartVO;

@Service
public class CartServiceImpl implements CartService{
	
	@Autowired
	private CartMapper mapper;

	@Override
	public void insertOrUpdateCart(CartVO vo) {
		mapper.insertOrUpdateCart(vo);
	}
	
}
