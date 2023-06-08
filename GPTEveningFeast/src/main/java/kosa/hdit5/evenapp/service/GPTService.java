package kosa.hdit5.evenapp.service;

import kosa.hdit5.evenapp.vo.GPTResultVO;

public interface GPTService {
	
	public GPTResultVO searchToGPT(String keyword, String userId);
}
