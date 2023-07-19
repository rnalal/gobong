package kr.gobong.controller;

import java.util.Locale;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.gobong.domain.UserDTO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	//0718손승기
	// loginUser : Server 실행될 때 Session Scope 에 생성한 UserDTO 객체
	@Resource(name = "loginUser")
	@Lazy
	private UserDTO loginUser;
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(@ModelAttribute UserDTO tmpUserLogin,Locale locale, Model model) {
//		logger.info("Welcome home! The client locale is {}.", locale);
//		
//		Date date = new Date();
//		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//		
//		String formattedDate = dateFormat.format(date);
//		
//		model.addAttribute("serverTime", formattedDate );
//		
		model.addAttribute("tmpUserLogin", tmpUserLogin);
		return "index";
	}
	//0718손승기
}
