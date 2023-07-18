package kr.gobong.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.gobong.domain.UserDTO;
import kr.gobong.service.TestService;
import kr.gobong.service.UserService;

//이곳이 DAO
@Controller
public class TestController {
	
	@Autowired
	private TestService testService;
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/test")
	public String test1(@RequestParam String id , Model model) {
		
		UserDTO userDTO = userService.getUserTest("test1");
		model.addAttribute("user", userDTO);
//		String test01 = testService.getTest();
//		
//		System.out.println(test01);
//		model.addAttribute("test01", test01);
		
		return "test";
	}
}
