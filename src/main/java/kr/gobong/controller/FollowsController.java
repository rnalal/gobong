package kr.gobong.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.gobong.domain.FollowsDTO;
import kr.gobong.domain.UserDTO;
import kr.gobong.service.FollowsService;

@RequestMapping("/follows")
@Controller
public class FollowsController {

	@Autowired
	private FollowsService followsService;
	
	@Resource(name = "loginUser")
	@Lazy
	private UserDTO loginUser;
	
	/*
	 * @GetMapping("/followingList") public String followingList(@RequestParam("id")
	 * String id, Model model) { List<FollowsDTO> followingList =
	 * followsService.followingList(id); model.addAttribute("followingList",
	 * followingList); return "follows/followingList"; }
	 * 
	 * @GetMapping("/followerList") public String followerList(@RequestParam("id")
	 * String id, Model model) {
	 * 
	 * List<FollowsDTO> followerList = followsService.followerList(id);
	 * model.addAttribute("followerList", followerList); return
	 * "follows/followerList"; }
	 */
	
	@GetMapping("/doFollow")
	   public String doFollow(@RequestParam("followingId") String followingId, @RequestParam("name") String name, FollowsDTO followsDto, Model model) {
	      followsDto.setId(loginUser.getId());
	      followsDto.setFollowing_id(followingId);
	      
	      model.addAttribute("followingDto", followsDto);
	      model.addAttribute("followingId", followingId);
	      model.addAttribute("name", name);
	      
	      followsService.doFollow(followsDto);
	      return "follows/follow_success";  
	   } 
	
	@GetMapping("/unFollow")
	public String unFollow(@RequestParam("followingId") String followingId, @RequestParam("name") String name, FollowsDTO followsDto, Model model) {
		
		followsDto.setId(loginUser.getId());
		followsDto.setFollowing_id(followingId);
		followsService.unFollow(followsDto);
		
//		System.out.println("언팔 id : " + followsDto.getId());
//		System.out.println("언팔 following_id : " + followsDto.getFollowing_id());
		
		model.addAttribute("followingId", followingId);
		model.addAttribute("name", name);
			
		return "follows/unfollow_success";
	}
	
}
