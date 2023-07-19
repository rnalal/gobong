package kr.gobong.controller;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.gobong.domain.TestBoardDTO;
import kr.gobong.domain.TestUserDTO;
import kr.gobong.domain.UserDTO;
import kr.gobong.service.TestService;
import kr.gobong.service.UserService;


@Controller
@RequestMapping("/test")
public class TestController {
	
	@Autowired
	private TestService testService;
	
	@Autowired
	private UserService userService;
	
	//연동DB테스트
	
	@GetMapping("/home")
	public String testHome() {
		return "home";
	}
	
	
	@GetMapping("/test")
	public String test1(@RequestParam String id , Model model) {
		
		UserDTO userDTO = userService.getUserTest("test1");
		model.addAttribute("user", userDTO);
		return "test";
	}
	
	//발리데이션 테스트
	
	@GetMapping("validateTest")
	public String validateTest(TestUserDTO testUserDTO) {

		return "test/validateTest";
	}
	
	@PostMapping("validateTest_procedure")
	public String validateTest_procedure(@Valid TestUserDTO testUserDTO,BindingResult result) {
		if(result.hasErrors()) {
			
			//에러코드 출력
			for(ObjectError error : result.getAllErrors()) {
				System.out.println("에러메세지 : "+error.getDefaultMessage());
				System.out.println("에러코드 : "+error.getCode());
				System.out.println("object name : "+error.getObjectName());
				
				System.out.println("------------------------");
			}
			return "test/validateTest";
		}
		return "test/validateTest_success";
	}
	
	//파일업로드 테스트
	//리얼패스 테스트 (프로퍼티스는 서버 변경될때 디렉토리를 새로 설정해야하기때문에 리얼패스를 해본다)
	@GetMapping("serverDirectoryTest")
	public String serverDirectoryTest(HttpServletRequest request, Model model) {
		
		String rootPath = request.getSession().getServletContext().getRealPath("/") ;
		System.out.println(rootPath);
		model.addAttribute("serverDirectoryTest", rootPath+"resources\\upload");
		return "test/serverDirectoryTest";
	}
	//리얼패스를 활용하여 파일업로드테스트
	@GetMapping("serverDirectoryTest2")
	public String serverDirectoryTest2(@ModelAttribute("testBoardDTO") TestBoardDTO testBoardDTO,HttpServletRequest request) {
		String rootPath = request.getSession().getServletContext().getRealPath("/") ;
		System.out.println(rootPath+"resources\\upload");

		return "test/serverDirectoryTest2";
	}
	@PostMapping("serverDirectoryTest2_procedure")
	public String serverDirectoryTest2_procedure(@Valid @ModelAttribute("testBoardDTO") TestBoardDTO testBoardDTO,BindingResult result) {
		System.out.println("보드프로시져");
		if(result.hasErrors()) {
			//에러코드 출력
			for(ObjectError error : result.getAllErrors()) {
				System.out.println("에러메세지 : "+error.getDefaultMessage());
				System.out.println("에러코드 : "+error.getCode());
				System.out.println("object name : "+error.getObjectName());
				
				System.out.println("------------------------");
			}
			System.out.println("에러");
			return "test/serverDirectoryTest2";
		}
		testService.insertBoardTest(testBoardDTO);

		return "test/serverDirectoryTest2_success";
	}
	
}
