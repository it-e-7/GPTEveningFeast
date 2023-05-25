package kosa.hdit5.evenapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosa.hdit5.evenapp.mapper.ProductMapper;
import kosa.hdit5.evenapp.vo.ProductVO;

@Service
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	private ProductMapper mapper;

	@Override
	public List<ProductVO> getRandomProduct() {

		List<ProductVO> vo = mapper.selectRandomProduct();
		return vo;
	}


}
