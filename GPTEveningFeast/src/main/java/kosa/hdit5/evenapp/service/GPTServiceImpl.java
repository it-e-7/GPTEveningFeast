package kosa.hdit5.evenapp.service;

import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosa.hdit5.evenapp.mapper.GPTMapper;
import kosa.hdit5.evenapp.util.ChatGPT;
import kosa.hdit5.evenapp.vo.GPTResultVO;

@Service
public class GPTServiceImpl implements GPTService{

	@Autowired
	ChatGPT GPTutil;
	
	@Autowired
	GPTMapper mapper;
	
	@Override
	public GPTResultVO searchToGPT(String keyword, String userId) {
		String json = GPTutil.setGPTQuery(keyword);
		
		try {
			GPTResultVO result = GPTutil.getGPTApi(json);
			result.setUserId(userId);
			result.setKeyword(keyword);
			
			mapper.insertGPTResult(result, result.getIngredients().toString(), Arrays.toString(result.getRecipe()));
			
			return result;
		} catch (Exception err) {
			err.printStackTrace();
			return null;
		}
	}
}
