package kosa.hdit5.evenapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosa.hdit5.evenapp.mapper.CartMapper;
import kosa.hdit5.evenapp.vo.CartVO;
import kosa.hdit5.evenapp.vo.ProductVO;

@Service
public class CartServiceImpl implements CartService{
	
	@Autowired
	private CartMapper mapper;

	@Override
	public void insertOrUpdateCart(CartVO vo) {
		mapper.insertOrUpdateCart(vo);
	}

	@Override
	public List<ProductVO> selectProductFromCart(String userId) {
		return mapper.selectProductFromCart(userId);
	}
	
}
