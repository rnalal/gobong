package kr.gobong.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import kr.gobong.domain.BoardDTO;

public class BoardCustomValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return BoardDTO.class.isAssignableFrom(clazz);
	}
	
	@Override
	public void validate(Object target, Errors errors) {
		BoardDTO boardDTO = (BoardDTO)target;
		String errorName = errors.getObjectName();
		
		if(errorName.equals("boardInsert")) {
			
			if(boardDTO.getHashtag().indexOf("#") != 0 && boardDTO.getHashtag().length()>0) {
				errors.rejectValue("hashtag", "InsertHashTag");
			}
			
			//대표이미지없을때
			if(boardDTO.getUpload_img1().getSize()==0) {
				errors.rejectValue("upload_img1", "NotUploadImg1");
			}
						
		}		
	}
}
