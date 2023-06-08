package kosa.hdit5.evenapp.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class GPTHistoryVO {
	
	private String keyword;
	private String menuName;
	private String ingredients;
	private String recipe;
	private List<String> ingredientList;
	private List<String> recipeList;
}
