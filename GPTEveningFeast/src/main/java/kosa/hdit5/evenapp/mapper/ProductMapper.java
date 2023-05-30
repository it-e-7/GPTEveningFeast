package kosa.hdit5.evenapp.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import kosa.hdit5.evenapp.vo.ProductVO;

@Repository
@Mapper
public interface ProductMapper {

	public List<ProductVO> selectRandomProduct();
	public ProductVO selectProductDetail(String productId);
	public List<ProductVO> selectGPTProduct(String[] productList);
	public List<ProductVO> selectProductList(@Param("ctgrId") String ctgrId, @Param("sectId") String sectId);
	public List<ProductVO> selectProductListBySearch(String searchParam);
}
