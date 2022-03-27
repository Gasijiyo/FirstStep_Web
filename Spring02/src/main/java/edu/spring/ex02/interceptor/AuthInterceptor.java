package edu.spring.ex02.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.UriUtils;

// 로그인 상태인 지 아닌 지를 (세션에 로그인 아이디가 저장되어 있는 지) 검사
// 로그인 상태 -> 이동하려 했던 페이지로 진행
// 로그인 안 한 상태 -> 로그인 페이지로 redirect

public class AuthInterceptor implements HandlerInterceptor{
	
	private static final Logger log = LoggerFactory.getLogger(AuthInterceptor.class);
	
	// 요청 URL과 요청 방식에 매핑된 컨트롤러 메소드가 호출되기 전에 
	// 요청 (request)와 응답(response)을 가로채서 실행되는 메소드.
	// 요청 처리 전에 해야할 일을 작성함
	// 리턴 값의 의미: 
	//		(1) true: 다음 handler chain 실행됨 (다음 pre핸들인터셉터 또는 컨트롤러 메소드 호출) 
	//		(2) false: 요청 처리를 진행하지 않음 (redirect)
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		log.info("preHandle() 호출");
		
		// 로그인 상태 검사 -> (1) OK -> 진행, (2) not OK -> redirect signin 페이지
		HttpSession session = request.getSession();
		String signInUserId = (String)session.getAttribute("signInUserId");
		
		if (signInUserId != null) {	// 로그인 정보가 있으면
			log.info("로그인 정보 있음, 아이디: {}", signInUserId);			
			return true;
			
		} else {	// 없으면
			log.info("로그인 정보 없음");
			
			//요청 URL정보를 찾아서 signin 요청에 요청파라미터를 추가.
			String reqURL = request.getRequestURL().toString();
			log.debug("requestURL: {}", reqURL);
			
			// 질의 문자열이 (요청 파라미터) 가 있는 지 확인
			String query = request.getQueryString();
			log.debug("QueryString = {}", query);
			
			String target = "";
			if (query == null) {	// 질의 문자열이 없는 경우
				target = UriUtils.encode(reqURL, "UTF-8");	//특수기호(:, /, ?)들을 UTF-8 변환
			} else {	// 있는 경우
				target = UriUtils.encode(reqURL + "?" + query, "UTF-8");
			}
			
			log.debug("URI 디코딩 후: {}", target);
			// forward는 request, redirect는 response
			response.sendRedirect("/ex02/user/signin?url=" + target);
			return false;	//기존 요청을 진행하지 않음.
			
		}
		
	}
	
	// 컨트롤러 메소드가 리턴한 후 View(jsp)에 모델 객체가 전달되기 전 호출되는 메소드.
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		log.info("postHandle() 호출");		
	}
	
	// View(JSP)가 호출돼서 화면(UI)이 완성된 이 후 호출되는 메소드
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		log.info("afterCompletion() 호출");
	}
	
	

}
