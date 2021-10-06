package com.abite.mo.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/**
 * 모바?�� ?�� ?��?��?��?��
 * ?��?��?��?�� 체크?�� ?��?��.
 * 
 * @author osm077
 * @since 2020-01-06
 * */
public class MoInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle (HttpServletRequest req, HttpServletResponse res, Object handler) throws Exception
	{
		String uri = req.getRequestURI();
		System.out.println(uri);
//		LoginVO login = LoginVO.of(LoginManager.getFC(req));  
//		ValidateTool.isTrue(login.isLogined(), new LoginRequiredException());
//		ValidateTool.isTrue(login.isFranchiseHqOrStaff() == true || login.isAdminGlobal() == true, new AuthenticationException());
		
		// 쿠키 갱신
//		LoginManager.setFC(res, login);
		// top.jsp?��?�� ?��?��. menu 
//		req.setAttribute (Server.KEY_LOGIN, null);	
			
		return true;
	}
	
}
