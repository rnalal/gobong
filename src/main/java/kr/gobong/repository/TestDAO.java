package kr.gobong.repository;

import kr.gobong.domain.TestBoardDTO;

public interface TestDAO {

	public String getTest();
	
	public void insertBoardTest(TestBoardDTO testBoardDTO);
}
