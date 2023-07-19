package kr.gobong.service;

import kr.gobong.domain.TestBoardDTO;

public interface TestService {
	

	public void insertBoardTest(TestBoardDTO testBoardDTO);
	public String getTest();
}
