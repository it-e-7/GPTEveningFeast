package kosa.hdit5.evenapp.service;

import kosa.hdit5.evenapp.vo.UserVO;

public interface SignupService {
	public boolean createUser(UserVO user);
	public boolean validateUniqueUserId(String userId);
}