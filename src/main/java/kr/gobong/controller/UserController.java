package kr.gobong.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.gobong.domain.BoardDTO;
import kr.gobong.domain.FollowsDTO;
import kr.gobong.domain.IntroduceMeDTO;
import kr.gobong.domain.ReplyDTO;
import kr.gobong.domain.UserDTO;
import kr.gobong.domain.UserVO;
import kr.gobong.service.BoardService;
import kr.gobong.service.FollowsService;
import kr.gobong.service.IntroduceMeService;
import kr.gobong.service.LikeService;
import kr.gobong.service.ReplyService;
import kr.gobong.service.UserService;
import kr.gobong.validator.UserCustomValidator;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private FollowsService followsService;
	
	@Autowired
	private LikeService likeService;
	
	@Autowired
	private ReplyService replyService;
	
	@Autowired
	private IntroduceMeService introduceMeService; 
	
	@Resource(name = "loginUser")
	@Lazy
	private UserDTO loginUser;
		
	  // 회원가입	
	  @GetMapping("/join") // GetMapping : 조회
	  public String join(@ModelAttribute("joinUserDto") UserDTO joinUserDto) {
		return "user/join";
	  }
	  
	  @PostMapping("/join_procedure") // PostMapping : 저장
	  public String joinProcedure(@Valid @ModelAttribute("joinUserDto") UserDTO joinUserDto, BindingResult result){
		  
	  	if(result.hasErrors()) {
	  		return "user/join";
		}	
	  userService.addUserInfo(joinUserDto);	
		
			return "user/join_success";
	  }
	  
		//로그인
		@PostMapping("/loginPro")
		public String loginPro(@ModelAttribute("tmpUserLogin") UserDTO tmpUserLogin, BindingResult result) {
			
			if(result.hasErrors()) {
				return "index";
			}
			
			System.out.println("tmpUserLogin : " + tmpUserLogin);
			userService.getUserLogin(tmpUserLogin);
			
			if(loginUser.isUserLogin() == true) {
				System.out.println("loginUser : " + loginUser);
				return "redirect:/";
			} else {
				return "user/login_fail";
			}
		}

		//마이페이지 이동
		@GetMapping("/mypage")
		public String myPage(@ModelAttribute("userInfo") UserDTO userInfo) {
			userService.getUserInfo(userInfo);
			return "user/mypage";
		}
		
		//정보수정하기
		@PostMapping("/userInfoModifyPro")
		public String userInfoModifyPro(@Valid @ModelAttribute("userInfo") UserDTO userInfo, BindingResult result) {
			if(result.hasErrors()) {			
				return "user/mypage";
			}
			userService.userModifyPro(userInfo);
			return "redirect:/user/mypage";
		}
		
		//나의 프로필 보기
		@GetMapping("/profile")
		public String getUserProfile(@RequestParam("id") String id, UserDTO userInfo, Model model) {
			model.addAttribute("id", id);
			int followingCnt = followsService.followingCnt(id);
			model.addAttribute("followingCnt", followingCnt);

			int followerCnt = followsService.followerCnt(id);
			model.addAttribute("followerCnt", followerCnt);
			
			List<FollowsDTO> followingList = followsService.followingList(id);
			model.addAttribute("followingList", followingList);
			//System.out.println(followingList);
			List<FollowsDTO> followerList = followsService.followerList(id);
			model.addAttribute("followerList", followerList);
			//System.out.println(followerList);
			List<UserVO> userProfile = userService.getUserProfile(id);
			//System.out.println("userProfile : " + userProfile);
			model.addAttribute("userProfile", userProfile);
			
			List<UserVO> search = userService.searchUser(id);
			model.addAttribute("search", search);
			
			model.addAttribute("userInfo", userInfo);
			
		    String introdueMe_content1 = introduceMeService.getMyIntroduceInfo(id);
		    model.addAttribute("introdueMe_content1", introdueMe_content1);

			return "user/profile"; 
		}

		//로그아웃
		@GetMapping("/logout")
		public String logout(HttpServletRequest request, HttpServletResponse response) {
			HttpSession session = request.getSession();
			session.invalidate();
			
//			Cookie[] cookies = request.getCookies();
//			if(cookies!=null) {
//				for(Cookie data : cookies) {
//					data.setMaxAge(0);
//					response.addCookie(data);
//				}
//			}
			return "redirect:/";
		}
		
	
		//탈퇴
		@GetMapping("/userDel")
		public String userDel(@RequestParam("id") String id, Model model){

			//자기소개 페이지 삭제
			introduceMeService.deleteMyIntroduceForDeleteUser(id);

			//모든 댓글 삭제
			userService.deleteReplyForUserDelete(id);
			//모든 좋아요 삭제
			userService.deleteLikeForUserDelete(id);
			List<Integer> boardNoList = userService.selectBoardNoForUserDelete(id);
			for(Integer no : boardNoList) {
				userService.deleteLikeForUserDeleteToBoard(no);
				userService.deleteReplyForUserDeleteToBoard(no);
			}
			//모든 팔로잉삭제
			userService.deleteFollowsForUserDelete(id);
			//모든 게시글 삭제
			userService.deleteBoardForUserDelete(id);

			
			//유저삭제
			userService.userDel(id);
			model.addAttribute("id", id);
			return "user/user_del";
		}

		@GetMapping("/searchUser")
		public String searchUser(@RequestParam("id") String id, Model model) {
			//System.out.println(id);
			if(id.indexOf("#")==-1) { //&& id.indexOf("%23")==-1) {
				List<UserVO> search = userService.searchUser(id);
				List<UserVO> userProfile = userService.getUserProfile(id);
				
				model.addAttribute("userProfile", userProfile);
				model.addAttribute("search", search);
				model.addAttribute("id", id);
				
			    String introdueMe_content1 = introduceMeService.getMyIntroduceInfo(id);
			    model.addAttribute("introdueMe_content1", introdueMe_content1);

				return "user/profile";
			}else {
				String hashtag = "#%"+id.substring(1)+"%";
				List<BoardDTO> boardSearchHashList = boardService.getBoardListByHashtag(hashtag);
				model.addAttribute("boardList", boardSearchHashList);
				return "board/board_list";
			}
		}

		//아이디 중복체크
		@GetMapping("/duplicationCheckId.do")
		@ResponseBody
		public int duplicationCheckId(@RequestParam String id) {
			return userService.duplicationCheckId(id);
		}

		//내가 좋아요 누른 글 목록
		@GetMapping("/myLikeList")
		public String myLikeList(Model model){
			List<BoardDTO> myLikeList = likeService.myLikeList(loginUser.getId());
			model.addAttribute("myLikeList", myLikeList);
			return "user/myLikeList";
		}
		
		
		//내가 쓴 댓글보기
		@GetMapping("/myReply")
		public String myReply(Model model) {
//			List<BoardDTO> myReply = replyService.myReply(loginUser.getId());
			List<ReplyDTO> myReply = replyService.myReply(loginUser.getId());
			model.addAttribute("myReply", myReply);
			return "user/myReply";
		}		
		
		@GetMapping("/introduceMe")
		public String firstIntroduceMe(@RequestParam int sw,Model model) {
			//sw 0 은 새로만들기 sw 1은 수정
			model.addAttribute("sw", sw);
			return "user/introduceMe";
		}
		
		@PostMapping("/introduceMe.do")
		public void introduceMe_procedure(@ModelAttribute IntroduceMeDTO introduceMeDTO,@RequestParam int sw) {
			if(sw==0) {
				introduceMeService.insertIntroduceMe1(introduceMeDTO);
			}else {
				introduceMeService.updateIntroduceMe1(introduceMeDTO);
			}
		}
		

		//커스텀발리데이션
		@InitBinder({"joinUserDto","userInfo"})
		public void initBinder(WebDataBinder binder) {
			UserCustomValidator ucv = new UserCustomValidator();
			binder.addValidators(ucv);
		}

}
