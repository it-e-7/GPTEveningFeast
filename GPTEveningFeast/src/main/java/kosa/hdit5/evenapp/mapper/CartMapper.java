package kosa.hdit5.evenapp.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kosa.hdit5.evenapp.vo.CartVO;

@Repository
@Mapper
public interface CartMapper {
	
	public void insertOrUpdateCart(CartVO vo); 
	
}
