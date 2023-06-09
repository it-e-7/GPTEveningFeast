package kosa.hdit5.evenapp.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kosa.hdit5.evenapp.vo.CategoryVO;

@Repository
@Mapper
public interface CategoryMapper {

	public List<CategoryVO> selectAllCategory();
	public CategoryVO selectOneCategory(String ctgrId);
}
