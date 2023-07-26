package kr.gobong.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.gobong.domain.BoardDTO;
import kr.gobong.domain.LikeDTO;

@Repository
public class LikeDAOImpl implements LikeDAO{
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public void upLike(int no) {
		sqlSessionTemplate.update("like1.upLike", no);
	}
	
	@Override
	public void registLike(LikeDTO likeDto) {
		sqlSessionTemplate.insert("like1.registLike", likeDto);
		
	}
	
	@Override
	public void deleteLikeForBoard(int no) {
		sqlSessionTemplate.delete("like1.deleteLike", no);
	}
	
	@Override
	public void disLike(int no) {
		sqlSessionTemplate.update("like1.disLike", no);
	}
	@Override
	public List<LikeDTO> likeListInBoard(int no) {
		return sqlSessionTemplate.selectList("like1.likeListInBoard", no);
	}
	@Override
	public int likeCheck(LikeDTO likeDto) {
		return sqlSessionTemplate.selectOne("like1.likeCheck", likeDto);
	}
	@Override
	public void deleteLikeFromId(LikeDTO likeDto) {
		sqlSessionTemplate.delete("like1.deleteLikeFromId", likeDto);
		
	}
	//내가 좋아요 누른 글 목록 0724이재호
	@Override
	public List<BoardDTO> myLikeList(String id) {
		return sqlSessionTemplate.selectList("like1.myLikeList",id);
	}
	//내가 좋아요 누른 글 목록 0724이재호
}
