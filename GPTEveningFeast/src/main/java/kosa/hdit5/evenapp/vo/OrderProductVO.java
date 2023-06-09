package kosa.hdit5.evenapp.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderProductVO {
	
	private int orderId;
	private String productId;
	private int productCnt;
	private String productName;
	
	private String productImgUrl;
	private String productPrice;
	private String date;
	

}
