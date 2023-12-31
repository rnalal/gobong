package kr.gobong.service;

import kr.gobong.domain.IntroduceMeDTO;

public interface IntroduceMeService {
	public String getMyIntroduceInfo(String id);
	public void insertIntroduceMe1(IntroduceMeDTO introduceMeDTO);
	public void updateIntroduceMe1(IntroduceMeDTO introduceMeDTO);
	public void deleteMyIntroduceForDeleteUser(String id);
	
}
