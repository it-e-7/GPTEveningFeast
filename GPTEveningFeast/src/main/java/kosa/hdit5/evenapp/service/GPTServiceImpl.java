package kosa.hdit5.evenapp.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.ObjectMapper;

import kosa.hdit5.evenapp.mapper.GPTMapper;
import kosa.hdit5.evenapp.util.ChatGPT;
import kosa.hdit5.evenapp.vo.GPTHistoryVO;
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
	
	@Override
	public List<GPTHistoryVO> getGPTHistoryList(String userId) {
		List<GPTHistoryVO> result = mapper.selectAllGPTHistory(userId);
		
		for(GPTHistoryVO history : result) {
			String ingredients = history.getIngredients();
			ingredients = ingredients.substring(1, ingredients.length() - 1);
			List<String> ingredientList = new ArrayList<String>();
			for(String ingredient : ingredients.split(", ")) {
				ingredientList.add(ingredient.replace("=", " "));
			}
			history.setIngredientList(ingredientList);
			
			String recipe = history.getRecipe();
			recipe = recipe.substring(1, recipe.length() - 1);
			List<String> recipeList = new ArrayList<String>();
			for(String line : recipe.split("([0-9]. )")) {
				if(!line.equals("")) {
					recipeList.add(line.replaceAll(", $", ""));
				}
			}
			history.setRecipeList(recipeList);
			System.out.println(history);
		}
		
		return result;
	}
}
