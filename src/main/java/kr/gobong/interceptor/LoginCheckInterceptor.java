package kr.gobong.interceptor;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.Lazy;
import org.springframework.web.servlet.HandlerInterceptor;

import kr.gobong.domain.UserDTO;

public class LoginCheckInterceptor implements HandlerInterceptor {

	@Resource(name = "loginUser")
	@Lazy
	private UserDTO loginUser;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		// 로그인 상태가 아니라면 index로 이동하고 false를 반환
		if(loginUser.isUserLogin() == false) {
			String path = request.getContextPath();
			response.sendRedirect(path + "/index");
			return false;
		}
		return true;
	}
	
	
}
