package kosa.hdit5.evenapp.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kosa.hdit5.evenapp.vo.UserVO;

@Repository
@Mapper
public interface UserMapper {

	public int insertUser(UserVO user);
	public UserVO selectOneUser(String userId);
	public int updateUser(UserVO user);
}
