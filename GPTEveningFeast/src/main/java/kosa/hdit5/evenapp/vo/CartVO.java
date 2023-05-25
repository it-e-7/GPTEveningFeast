package kosa.hdit5.evenapp.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CartVO {
	
	private String productId;
	private int productCnt;
	private String userId;
}