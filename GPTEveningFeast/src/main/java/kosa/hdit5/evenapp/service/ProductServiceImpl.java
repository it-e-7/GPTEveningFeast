package kosa.hdit5.evenapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosa.hdit5.evenapp.mapper.ProductMapper;
import kosa.hdit5.evenapp.vo.ProductVO;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductMapper mapper;

	@Override
	public List<ProductVO> getRandomProduct() {
		return mapper.selectRandomProduct();
	}

	@Override
	public ProductVO getProductDetail(String productId) {
		return mapper.selectProductDetail(productId);
	}

	@Override
	public List<ProductVO> getGPTProduct(String[] productList) {
		return mapper.selectGPTProduct(productList);
	}

	@Override
	public List<ProductVO> getProductList(String ctgrId, String sectId, int offset) {
		return mapper.selectProductList(ctgrId, sectId, offset);
	}
	
	@Override
	public List<ProductVO> getProductListBySearch(String searchParam, int offset) {
		return mapper.selectProductListBySearch(searchParam, offset);
	}
}
