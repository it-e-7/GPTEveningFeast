package kosa.hdit5.evenapp.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.core.json.JsonReadFeature;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import kosa.hdit5.evenapp.vo.GPTResultVO;

@Component
public class ChatGPT {
	
	@Value("${api.gptKey}")
	private String GPTKey;
	
	public GPTResultVO getGPTApi(String sendData) throws Exception {

		URL url = new URL("https://api.openai.com/v1/chat/completions");
		String line;
		StringBuilder sb = new StringBuilder();
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("POST");
		conn.setDoOutput(true);
		conn.setInstanceFollowRedirects(true);
		conn.setRequestProperty("Content-type", "application/json; charset=UTF-8");
		conn.setRequestProperty("Authorization", "Bearer " + GPTKey);

		OutputStream outputStream = conn.getOutputStream();

		outputStream.write(sendData.getBytes("UTF-8"));
		outputStream.flush();

		BufferedReader rd;
		if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream(), "UTF-8"));
		}
		while ((line = rd.readLine()) != null) {
			sb.append(line);
		}
		rd.close();
		conn.disconnect();
		String text = sb.toString();
		
		ObjectMapper mapper = new ObjectMapper();
		mapper.configure(DeserializationFeature.ACCEPT_SINGLE_VALUE_AS_ARRAY, true);
		mapper.enable(JsonReadFeature.ALLOW_NON_NUMERIC_NUMBERS.mappedFeature());

		JsonNode responseNode = mapper.readTree(text);

		JsonNode choicesNode = responseNode.get("choices");
		if (choicesNode.isArray() && choicesNode.size() > 0) {
			JsonNode messageNode = choicesNode.get(0).get("message");
			if (messageNode != null) {
				String content = messageNode.get("content").asText();
				return convertResult(content);
			}
		}
		return null;

	}

	public String setGPTQuery(String searchParam) {

		HashMap<String, Object> sendData = new HashMap<String, Object>();
		HashMap<String, Object> message = new HashMap<String, Object>();
		List<HashMap<String, Object>> messages = new ArrayList<HashMap<String, Object>>();

		sendData.put("model", "gpt-3.5-turbo-0301");

		message.put("role", "user");
		searchParam = searchParam + "요청과 관련된 메뉴 추천 딱 하나만 해줘."
				+ "해당 메뉴의 이름, 레시피와 재료를 menu, recipe, ingredients 라는 key를 가지는 json 형태로 반환해줘."
				+ "recipe는 요리하는 방법이 순서대로 들어간 배열, ingredients는 재료 이름을 key값으로 양을 value값으로 최대한 자세하게 작성해줘."
				+ "형용사를 제거한 재료명을 사용하고 ingredients의 key, value는 모두 String 타입으로 작성해줘.(10초 이내로)";
	
		message.put("content", searchParam);
		messages.add(message);
		sendData.put("messages", messages);
		sendData.put("max_tokens", 2048);
		sendData.put("temperature", 0.6);
	    sendData.put("top_p", 1.0);
	    sendData.put("frequency_penalty", 0.0);
	    sendData.put("presence_penalty", 0.0);
		ObjectMapper mapper = new ObjectMapper();

		String json = "";
		try {
			json = mapper.writeValueAsString(sendData);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return json;
	}

	public GPTResultVO convertResult(String jsonString) throws Exception {

		// JSON 파싱
		ObjectMapper objectMapper = new ObjectMapper();
		int startIndex = jsonString.indexOf("{");
		String jsonContent = jsonString.substring(startIndex);
		JsonNode jsonNode = objectMapper.readTree(jsonContent);

		// menu, recipe, ingredients 정보 추출
		String menu = jsonNode.get("menu").asText();
		JsonNode recipeNode = jsonNode.get("recipe");
		JsonNode ingredientsNode = jsonNode.get("ingredients");

		// recipe 배열 추출
		String[] recipeArray = objectMapper.convertValue(recipeNode, String[].class);

		// ingredients 배열 추출
		Map<String, String> ingredientsArray = objectMapper.convertValue(ingredientsNode, Map.class);
		
		GPTResultVO vo = new GPTResultVO();
		vo.setMenu(menu);
		vo.setRecipe(recipeArray);
		vo.setIngredients(ingredientsArray);
		// Menu 객체 생성 및 반환
		return vo;

	}
}