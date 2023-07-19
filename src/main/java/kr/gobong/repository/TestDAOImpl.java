package kr.gobong.repository;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.gobong.domain.TestBoardDTO;

@Repository
public class TestDAOImpl implements TestDAO{
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public String getTest() {
		return sqlSessionTemplate.selectOne("test01.getTest");
	}
	
	@Override
	public void insertBoardTest(TestBoardDTO testBoardDTO) {
		sqlSessionTemplate.insert("testBoard.insertBoardTest", testBoardDTO);
	}
}
