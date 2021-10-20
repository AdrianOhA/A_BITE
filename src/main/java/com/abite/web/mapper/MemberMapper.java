package com.abite.web.mapper;

import java.util.HashMap;

import org.springframework.stereotype.Repository;

/**
 * 가드너스 회원 관련 mapper
 * 
 * 관련 테이블 : gd_member
 * @author osm077
 * @since 2020-01-20
 * */
@Repository
public interface MemberMapper {
	
	int getMember(HashMap<String, Object> map);
	
	int exsistMember(HashMap<String, Object> map);
	
	long addMember(HashMap<String, Object> map);
}
