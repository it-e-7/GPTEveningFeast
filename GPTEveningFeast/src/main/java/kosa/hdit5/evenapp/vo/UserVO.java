package kosa.hdit5.evenapp.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserVO {

	private String userId;
	private String userPw;
	private String userName;
	private String userBirth;
	private String userSex;
	private String userAddress;
}
