package kosa.hdit5.evenapp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosa.hdit5.evenapp.mapper.UserMapper;
import kosa.hdit5.evenapp.vo.UserVO;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserMapper mapper;

	@Override
	public boolean createUser(UserVO user) {
		int result = mapper.insertUser(user);
		return result == 1 ? true : false;
	}

	@Override
	public boolean validateUniqueUserId(String userId) {
		UserVO result = mapper.selectOneUser(userId);
		return result == null ? true : false;
	}
	
	@Override
	public UserVO selectOneUser(String userId) {
		UserVO result = mapper.selectOneUser(userId);
		
		return result;
	}
	
	@Override
	public boolean userUpdate(UserVO user) {
		int result = mapper.updateUser(user);
		return result == 1 ? true : false;
	}
}
