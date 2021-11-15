package com.abite.common.interceptor;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

/**
 * 소켓 통신 시, session 정보를 가져오는 interceptor
 * 
 * <p>
 * Server.DEBUG 가 true 일 경우 request 에 담긴 파라미터값을 출력
 * </p>
 * 
 * @author osm077
 * @since 2020-01-06
 */
public class HandshakeInterceptor extends HttpSessionHandshakeInterceptor{

	private static final Logger logger = LoggerFactory.getLogger(HandshakeInterceptor.class);
	 @Override
    public boolean beforeHandshake(ServerHttpRequest request,ServerHttpResponse response, WebSocketHandler wsHandler,
        Map<String, Object> attributes) throws Exception {    
		logger.info("Before Handshake");
          
        ServletServerHttpRequest ssreq = (ServletServerHttpRequest) request;
        logger.info("URI:"+request.getURI());
        HttpServletRequest req =  ssreq.getServletRequest();
 
        /*String userId = req.getParameter("userid");
        System.out.println("param, id:"+userId);
        attributes.put("userId", userId);*/
  
        // HttpSession 에 저장된 이용자의 아이디를 추출하는 경우
        Map<String, Object> map = (Map<String, Object>)req.getSession().getAttribute("USER_INFO");
        
        attributes.put("USER_INFO", map);
        System.out.println("HttpSession에 저장된 id:"+ map);
         
        return super.beforeHandshake(request, response, wsHandler, attributes);
    }
  
    @Override
    public void afterHandshake(ServerHttpRequest request,
            ServerHttpResponse response, WebSocketHandler wsHandler,
            Exception ex) {
        System.out.println("After Handshake");
  
        super.afterHandshake(request, response, wsHandler, ex);
    }
}
