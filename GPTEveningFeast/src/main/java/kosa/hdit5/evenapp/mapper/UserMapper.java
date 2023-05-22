package kosa.hdit5.evenapp.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kosa.hdit5.evenapp.vo.UserVO;

@Repository
@Mapper
public interface UserMapper {
	
	public List<UserVO> selectAllUser();
}
