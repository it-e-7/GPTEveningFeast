package kosa.hdit5.evenapp.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kosa.hdit5.evenapp.vo.CartVO;
import kosa.hdit5.evenapp.vo.ProductVO;

@Repository
@Mapper
public interface CartMapper {
	
	public void insertOrUpdateCart(CartVO vo);
	public List<ProductVO> selectProductFromCart(String userId);
	
}
