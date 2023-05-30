package kosa.hdit5.evenapp.service;

import java.util.List;

import kosa.hdit5.evenapp.vo.ProductVO;

public interface ProductService {
	
	public List<ProductVO> getRandomProduct();
	public ProductVO getProductDetail(String productId);
	public List<ProductVO> getGPTProduct(String[] productList);
	public List<ProductVO> getProductList(String ctgrId, String sectId, int offset);
	public List<ProductVO> getProductListBySearch(String searchParam);
}
