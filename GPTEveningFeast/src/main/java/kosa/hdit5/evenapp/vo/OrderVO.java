package kosa.hdit5.evenapp.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderVO {

	private List<CartVO> cart;
	private int productPrice;
}
