package com.abite.web.interceptor;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.util.ObjectUtils;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/**
 * 웹용 인터셉터
 * 세션등을 체크할 용도.
 * 
 * @author	osm077
 * @since	2020-01-06
 */
public class Interceptor extends HandlerInterceptorAdapter{
	
	@Override
	@SuppressWarnings("unchecked")
	public boolean preHandle (HttpServletRequest req, HttpServletResponse res, Object handler) throws Exception
	{
		boolean flag = true;
		HttpSession session = req.getSession(); 
		Map<String, Object> user_info = (Map<String, Object>) session.getAttribute("USER_INFO");
		if(ObjectUtils.isEmpty(user_info)) {
			flag = false;
			res.sendRedirect("/");
		}
		return flag;
	}
}
