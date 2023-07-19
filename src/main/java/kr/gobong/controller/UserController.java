package kr.gobong.controller;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.gobong.domain.UserDTO;
import kr.gobong.service.UserService;

/* 0719김우주 */
@Controller
@RequestMapping("/user")
public class UserController {
/*//0719김우주 */	
	@Autowired
	private UserService userService;
	
	@Resource(name = "loginUser")
	@Lazy
	private UserDTO loginUser;
	
	  @GetMapping("/join")
	  public String join(@ModelAttribute("joinUserDto") UserDTO joinUserDto) {
		return "user/join";
	  }
	  
	  @PostMapping("/join_procedure")
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
		
		//로그아웃
		@GetMapping("/logout")
		public String logout() {
			loginUser.setUserLogin(false);
			return "redirect:/";
		}
}
