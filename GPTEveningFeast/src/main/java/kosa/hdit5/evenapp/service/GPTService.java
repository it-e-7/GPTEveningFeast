package kosa.hdit5.evenapp.service;

import java.util.List;

import kosa.hdit5.evenapp.vo.GPTHistoryVO;
import kosa.hdit5.evenapp.vo.GPTResultVO;

public interface GPTService {
	
	public GPTResultVO searchToGPT(String keyword, String userId);
	public List<GPTHistoryVO> getGPTHistoryList(String userId);
}
