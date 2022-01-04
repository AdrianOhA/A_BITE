package com.abite.common.config;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.codehaus.jackson.map.ObjectMapper;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.HashOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.util.ObjectUtils;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;




public class EchoHandler extends TextWebSocketHandler{
	
	private static final Logger logger = LoggerFactory.getLogger (EchoHandler.class);
	@Autowired
	private RedisTemplate<String, Object> redisTemplate;
	private ObjectMapper objectMapper;
	
    private List<WebSocketSession> users;
    private Map<String, Object> userMap;
    private List<Object> write_msg_list;
    /* private static int idx = 0;*/
    
    public EchoHandler() {
		users = new ArrayList<WebSocketSession>();
		userMap = new HashMap<String, Object>();
		objectMapper = new ObjectMapper();
	}
    
    @Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		//소켓 연결
		super.afterConnectionEstablished(session);
		users.add(session);
	}
    
	@Override
	@SuppressWarnings({ "unchecked"})
	public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		logger.info("Text Web socketHanler : 메세지 수신 !");
		logger.info("message:" + message.getPayload());
		JSONObject object = new JSONObject(message.getPayload());
		String type = object.getString("type");
		HashOperations<String, String, Object> hash = redisTemplate.opsForHash();
		Map<String, Object> map = (Map<String, Object>)session.getAttributes();
		Map<String, Object> userInfo = (Map<String, Object>)map.get("USER_INFO");
		String userId = (String)userInfo.get("USER_ID");
		
		if(type != null && "register".equals(type)){
			String user = object.getString("userid");
			userMap.put(user, session);
		} else if(type != null && "read".equals(type)){
			try {
				String target = object.getString("target");
				WebSocketSession ws = (WebSocketSession)userMap.get(target);
				int recipeNo = object.getInt("recipeNo");
				write_msg_list = (List<Object>) hash.get(userId, target + "_" + recipeNo);
				
				for(Object msg : write_msg_list) {
					Map<String, Object> _msg = (Map<String, Object>) msg;
					if(!userId.equals(_msg.get("witer"))) {
						_msg.put("readYN", "Y");	
					}
				}
				hash.put(userId, target + "_" + recipeNo, write_msg_list);
				Map<String, Object> reData = new HashMap<String, Object>();
				reData.put("id", recipeNo);
				reData.put("recipeNo", recipeNo);
				reData.put("readYN", "Y");
				reData.put("type", type);
				if(ws != null) {
					ws.sendMessage(new TextMessage(objectMapper.writeValueAsString(reData)));
				}
			} catch (Exception e) {
				logger.info("연결 할 대상이 없습니다.");
			}
		} else {
			try {
				String target = object.getString("target");
				WebSocketSession ws = (WebSocketSession)userMap.get(target);
				String msg = object.getString("msg");
				int recipeNo = object.getInt("recipeNo");
				int checkID = object.getInt("id");
				
				long time = System.currentTimeMillis( );
				Map<String, Object> chat_msg = new HashMap<String, Object>();
				chat_msg.put("msg", msg);
				chat_msg.put("time", time);
				chat_msg.put("readYN", "N");
				chat_msg.put("writer", userId);
				
				Map<String, Object> reData = chat_msg;
				reData.put("id", checkID);
				reData.put("type", type);
				write_msg_list = !ObjectUtils.isEmpty(hash.get(userId, target + "_" + recipeNo)) ? (List<Object>) hash.get(userId, target + "_" + recipeNo) : new ArrayList<>();
				write_msg_list.add(chat_msg);
				hash.put(userId, target + "_" + recipeNo, write_msg_list);
				hash.put(target, userId + "_" + recipeNo, write_msg_list);
				if(ws != null) {
					ws.sendMessage(new TextMessage(objectMapper.writeValueAsString(reData)));
				}
			} catch (Exception e) {
				// TODO: handle exception
				logger.info("연결 할 대상이 없습니다.");
			}
			
		}
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		logger.info("Text Web socketHanler : 연결종료!");
		users.remove(session);
		super.afterConnectionClosed(session, status);
	}
}