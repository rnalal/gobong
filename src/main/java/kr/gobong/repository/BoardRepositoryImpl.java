package kr.gobong.repository;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.gobong.domain.BoardDTO;

@Repository
public class BoardRepositoryImpl implements BoardRepository {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
  // 글 목록 보기
	List<BoardDTO> boardList = new ArrayList<BoardDTO>();
	
	@Override
	public List<BoardDTO> getBoardList(){
		return sqlSessionTemplate.selectList("board.getBoardList");
	}

}
