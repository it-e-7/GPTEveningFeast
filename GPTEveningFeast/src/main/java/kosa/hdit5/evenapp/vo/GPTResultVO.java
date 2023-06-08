package kosa.hdit5.evenapp.vo;

import java.util.Map;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class GPTResultVO {
	
	private String userId;
	private String keyword;
	private String menu;
	private String[] recipe;
	private Map<String, String> ingredients;
}
