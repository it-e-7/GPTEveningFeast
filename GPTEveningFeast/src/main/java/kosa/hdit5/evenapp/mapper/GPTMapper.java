package kosa.hdit5.evenapp.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import kosa.hdit5.evenapp.vo.GPTHistoryVO;
import kosa.hdit5.evenapp.vo.GPTResultVO;

@Repository
@Mapper
public interface GPTMapper {

	public void insertGPTResult(@Param("result") GPTResultVO result, @Param("ingredientsString") String ingredientsString, @Param("recipeString") String recipeString);
	public List<GPTHistoryVO> selectAllGPTHistory(String userId);
}
