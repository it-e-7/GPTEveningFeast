package kosa.hdit5.evenapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosa.hdit5.evenapp.mapper.UserMapper;
import kosa.hdit5.evenapp.vo.UserVO;

@Service
public class MainServiceImpl implements MainService {
	
	@Autowired
	UserMapper mapper;
	
	@Override
	public List<UserVO> getAllUser() {
		
		List<UserVO> result = mapper.selectAllUser();
		
		return result;
	}
	
}
