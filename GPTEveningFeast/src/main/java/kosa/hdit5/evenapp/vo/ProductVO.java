package kosa.hdit5.evenapp.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductVO {
	
	private String productId;
	private String productName;
	private int productPrice;
	private String productImgUrl;
	private int sectId;
	private int ctgrId;
	private String detail;
	private int productCnt;
}
