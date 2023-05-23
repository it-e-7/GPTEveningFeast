package kosa.hdit5.evenapp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosa.hdit5.evenapp.mapper.UserMapper;
import kosa.hdit5.evenapp.vo.UserVO;

@Service
public class SigninServiceImpl implements SigninService {

	@Autowired
	UserMapper mapper;
	
	@Override
	public UserVO getUser(UserVO vo) {
		UserVO result = mapper.getUser(vo);
		
		return result;
	}
}
