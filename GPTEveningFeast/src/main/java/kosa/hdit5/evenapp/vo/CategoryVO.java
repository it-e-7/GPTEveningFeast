package kosa.hdit5.evenapp.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CategoryVO {
	
	private int ctgrId;
	private String name;
	private List<SectionVO> sections;
}
