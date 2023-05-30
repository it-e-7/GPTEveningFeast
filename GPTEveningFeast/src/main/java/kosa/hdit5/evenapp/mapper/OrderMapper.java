package kosa.hdit5.evenapp.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kosa.hdit5.evenapp.vo.CartVO;

@Repository
@Mapper
public interface OrderMapper {
	
	public List<CartVO> selectPreOrderProduct(Map<String, Object> params);
	public int insertOrder(String userId);
}
