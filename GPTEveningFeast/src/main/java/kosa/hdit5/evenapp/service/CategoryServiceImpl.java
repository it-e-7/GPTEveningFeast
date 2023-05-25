package kosa.hdit5.evenapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import kosa.hdit5.evenapp.mapper.CategoryMapper;
import kosa.hdit5.evenapp.vo.CategoryVO;

@Service
public class CategoryServiceImpl implements CategoryService {
	
	@Autowired
	CategoryMapper mapper;
	
	@Override
	public CategoryVO getCategory(String ctgrId) {
		CategoryVO result = mapper.selectOneCategory(ctgrId);
		
		return result;
	}
	
	@Override
	public List<CategoryVO> getCategoryList() {
		List<CategoryVO> result = mapper.selectAllCategory();
		
		return result;
	}

}
