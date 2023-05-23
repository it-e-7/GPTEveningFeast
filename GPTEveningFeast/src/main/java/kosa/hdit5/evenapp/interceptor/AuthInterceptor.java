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

		HandlerMethod handlerMethod = (HandlerMethod) handler;

		Auth auth = handlerMethod.getMethodAnnotation(Auth.class);

		if (auth == null) {
			return true;
		}

		// 세션 확인 후 로그인 화면으로 이동시키기
		HttpSession session = request.getSession(false);

		if (session == null) {
			response.sendRedirect("/evenapp/signin");
			return false;
		}

		UserVO user = (UserVO) session.getAttribute("signinUser");
		// 세션은 있으나 로그인 안됨
		if (user == null) {
			response.sendRedirect("/evenapp/signin");
			return false;
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
