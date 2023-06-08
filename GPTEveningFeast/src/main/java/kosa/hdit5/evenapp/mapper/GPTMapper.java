package kosa.hdit5.evenapp.mapper;


import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import kosa.hdit5.evenapp.vo.GPTResultVO;

@Repository
@Mapper
public interface GPTMapper {

	public void insertGPTResult(@Param("result") GPTResultVO result, @Param("ingredientsString") String ingredientsString, @Param("recipeString") String recipeString);
}
