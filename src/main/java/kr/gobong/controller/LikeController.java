package kr.gobong.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.gobong.domain.LikeDTO;
import kr.gobong.domain.UserDTO;
import kr.gobong.service.LikeService;

@Controller
@RequestMapping("/like")
public class LikeController {
	
	@Autowired
	LikeService likeService;
	
	@Resource(name = "loginUser")
	@Lazy
	private UserDTO loginUser;
	
	@GetMapping("/upLike.do")
	public void upLike(@RequestParam("no") int no,LikeDTO likeDto) {
		likeService.upLike(no);
		likeDto.setNo(no);
		likeService.registLike(likeDto);
		
	}
	
	@GetMapping("/disLike.do")
	public void disLike(@RequestParam("no") int no,@RequestParam("id") String id,LikeDTO likeDto) {
		likeService.disLike(no);
		likeService.deleteLikeFromId(no, id);
		
	}
		
	@GetMapping("/likeList.do")
	@ResponseBody
	public List<LikeDTO> likeList(@RequestParam("no") int no){
		
		List<LikeDTO> likeList = likeService.likeListInBoard(no);
		return likeList;
	}

	@GetMapping("/likeCheck.do")
	@ResponseBody
	public int likeCheck(@RequestParam int no,@RequestParam String id) {
		
		return likeService.likeCheck(no,id);
	}
	
	
}
