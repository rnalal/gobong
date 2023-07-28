package kr.gobong.repository;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.gobong.domain.IntroduceMeDTO;

@Repository
public class IntroduceMeDAOImpl implements IntroduceMeDAO{
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public String getMyIntroduceInfo(String id) {
		return sqlSessionTemplate.selectOne("introduceMe1.getMyIntroduceInfo", id);
	}
	@Override
	public void insertIntroduceMe1(IntroduceMeDTO introduceMeDTO) {
		sqlSessionTemplate.insert("introduceMe1.insertIntroduceMe1", introduceMeDTO);
	}
	@Override
	public void updateIntroduceMe1(IntroduceMeDTO introduceMeDTO) {
		sqlSessionTemplate.update("introduceMe1.updateIntroduceMe1", introduceMeDTO);
	}
	
	@Override
	public void deleteMyIntroduceForDeleteUser(String id) {
		sqlSessionTemplate.delete("introduceMe1.deleteMyIntroduceForDeleteUser", id);
	}
}
