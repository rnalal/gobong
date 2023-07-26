package kr.gobong.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import kr.gobong.domain.UserDTO;

public class UserCustomValidator implements Validator{
	
	@Override
	public boolean supports(Class<?> clazz) {
		return UserDTO.class.isAssignableFrom(clazz);
	}
	@Override
	public void validate(Object target, Errors errors) {
		UserDTO userDTO = (UserDTO)target;
		String errorName = errors.getObjectName();
		if(errorName.equals("userInfo")||errorName.equals("joinUserDto")) {
			if(!userDTO.getPw().equals(userDTO.getPw2())) {
				errors.rejectValue("pw", "NotEquals");
			}
		}
		
	}
}
