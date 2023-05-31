package kosa.hdit5.evenapp.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import kosa.hdit5.evenapp.vo.CartVO;
import kosa.hdit5.evenapp.vo.OrderProductVO;
import kosa.hdit5.evenapp.vo.OrderVO;

@Repository
@Mapper
public interface OrderMapper {
	
	public List<CartVO> selectPreOrderProduct(Map<String, Object> params);
	public void insertOrder(Map<String, Object> params);
	public List<OrderProductVO> selectOrderProduct(int orderId);

}
