package kr.gobong.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.gobong.domain.IntroduceMeDTO;
import kr.gobong.repository.IntroduceMeDAO;

@Service
public class IntroduceMeServiceImpl implements IntroduceMeService {

	@Autowired
	IntroduceMeDAO introduceMeDao;
	@Override
	public String getMyIntroduceInfo(String id) {
		return introduceMeDao.getMyIntroduceInfo(id);
	}
	@Override
	public void insertIntroduceMe1(IntroduceMeDTO introduceMeDTO) {
		introduceMeDao.insertIntroduceMe1(introduceMeDTO);
	}
	@Override
	public void updateIntroduceMe1(IntroduceMeDTO introduceMeDTO) {
		introduceMeDao.updateIntroduceMe1(introduceMeDTO);
	}

	@Override
	public void deleteMyIntroduceForDeleteUser(String id) {
		introduceMeDao.deleteMyIntroduceForDeleteUser(id);
	}

}
