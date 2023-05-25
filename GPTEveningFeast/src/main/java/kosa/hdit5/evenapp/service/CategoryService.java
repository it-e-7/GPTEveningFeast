package kosa.hdit5.evenapp.service;

import java.util.List;

import kosa.hdit5.evenapp.vo.CategoryVO;

public interface CategoryService {
	
	public CategoryVO getCategory(String ctgrId);
	public List<CategoryVO> getCategoryList();
}
