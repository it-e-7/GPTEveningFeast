package kosa.hdit5.evenapp.service;

import kosa.hdit5.evenapp.vo.UserVO;

public interface SigninService {
	
	public UserVO selectOneUser(String userId);
}
