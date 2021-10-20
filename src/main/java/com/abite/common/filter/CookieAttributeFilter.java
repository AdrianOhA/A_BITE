package com.abite.common.filter;

import java.io.IOException;
import java.util.Collection;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpHeaders;

public class CookieAttributeFilter implements Filter{

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletResponse httpServletRespons = (HttpServletResponse) response;
		chain.doFilter(request, response);
		addSameSite(httpServletRespons, "None");
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}
	
	private void addSameSite(HttpServletResponse response, String sameStie) {
		Collection<String> headers = response.getHeaders(HttpHeaders.SET_COOKIE);
		boolean firstHeader = true;
		for(String header : headers) {
			if(firstHeader) {
				response.setHeader(HttpHeaders.SET_COOKIE, String.format("$s; Secure; $s", header, "SameSite=" + sameStie));
				firstHeader = false;
				continue;
			}
			response.addHeader(HttpHeaders.SET_COOKIE,  String.format("$s; Secure; $s", header, "SameSite=" + sameStie));
		}
	}
}
