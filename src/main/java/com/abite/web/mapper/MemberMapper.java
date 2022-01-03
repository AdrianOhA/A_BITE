package com.abite.web.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

/**
 * 한입만 회원 관련 mapper
 * 
 * 관련 테이블 : T_member
 * @author osm077
 * @since 2020-01-20
 * */
@Repository
public interface MemberMapper {
	
	Map<String, Object> getMember(HashMap<String, Object> map);
	Map<String, Object> getMemberForChat(HashMap<String, Object> map);
	Map<String, Object> getMemberForSetting(int userNo);
	List<HashMap<String, Object>> getCategoryPercent(int userNo);
	int exsistMember(HashMap<String, Object> map);
	
	long addMember(HashMap<String, Object> map);
	
	Map<String, Object> getMemberInfo(HashMap<String, Object> map);
}
