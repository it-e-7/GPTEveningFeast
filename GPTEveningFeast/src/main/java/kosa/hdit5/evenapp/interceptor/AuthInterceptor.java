package kosa.hdit5.evenapp.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import kosa.hdit5.evenapp.interceptor.annotation.Auth;
import kosa.hdit5.evenapp.vo.UserVO;

public class AuthInterceptor implements HandlerInterceptor{

	Logger log = LogManager.getLogger("case3");

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		log.debug(handler);
		
		HandlerMethod handlerMethod = (HandlerMethod) handler;
		
		Auth auth = handlerMethod.getMethodAnnotation(Auth.class);

		// Auth 어노테이션이 안붙어있으면 모든 사용자가 접근 가능
		if (auth == null) {
			return true;
		}

		// 세션 확인
		HttpSession session = request.getSession(false);
		
		// 인증된 유저만 접근 가능한 경우
		if(auth.role().toString().equals("AUTH")) {
			// 세션이 아예 없는 경우
			if(session == null) {
				response.sendRedirect("/evenapp/signin");
				return false;
			}
			UserVO user = (UserVO) session.getAttribute("signinUser");
			
			// 세션은 있으나 로그인이 안된 경우
			if(user == null || user.getUserId() == null) {
				response.sendRedirect("/evenapp/signin");
				return false;
			}
		} 
		
		// 인증 안된 유저만 접근 가능한 경우 ex) 로그인, 회원가입
		else if(auth.role().toString().equals("UNAUTH")) {
			// 세션이 있고 로그인한 상태면 접근 불가능
			if(session != null) {
				UserVO user = (UserVO) session.getAttribute("signinUser");
				
				if(user != null && user.getUserId() != null) {
					response.sendRedirect("/evenapp");
					return false;
				}
			}
		}

		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
	}
}
