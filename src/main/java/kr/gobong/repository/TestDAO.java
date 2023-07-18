package kr.gobong.repository;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TestDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	

	public String getTest() {
		return sqlSessionTemplate.selectOne("test01.getTest");
	}
}
