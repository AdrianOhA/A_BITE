package com.abite.web.mapper;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

/**
 * 가드너스 회원 관련 mapper
 * 
 * 관련 테이블 : gd_member
 * @author osm077
 * @since 2020-01-20
 * */
@Repository
public interface CodeMapper {
	List<HashMap<String, Object>> getCodeList(HashMap<String, Object> map);
}
