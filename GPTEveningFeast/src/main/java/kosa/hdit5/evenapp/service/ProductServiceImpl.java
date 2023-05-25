package kosa.hdit5.evenapp.service;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosa.hdit5.evenapp.mapper.ProductMapper;
import kosa.hdit5.evenapp.vo.ProductVO;

@Service
public class ProductServiceImpl implements ProductService{
	
	Logger log = LogManager.getLogger("case3");
	
	@Autowired
	private ProductMapper mapper;

	@Override
	public List<ProductVO> getRandomProduct() {

		List<ProductVO> vo = mapper.selectRandomProduct();
		return vo;
	}

	@Override
	public ProductVO getProductDetail(String productId) {
	
		ProductVO vo = mapper.selectProductDetail(productId);
		log.debug("service {}", vo);
		
		return vo;
	}
	



}
