package kosa.hdit5.evenapp.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import kosa.hdit5.evenapp.vo.CartVO;
import kosa.hdit5.evenapp.vo.UserVO;

@Repository
@Mapper
public interface OrderMapper {
	public List<CartVO> selectPreOrderProduct(@Param("arr_cart") List<CartVO> arr_cart);
}
