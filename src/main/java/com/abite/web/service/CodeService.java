package com.abite.web.service;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.abite.web.mapper.CodeMapper;

/**
 * web main Service (BizLogic)
 * 
 * @author 오승민
 * @since 2020-01-20
 **/

@Service
public class CodeService {
	private static final Logger logger = LoggerFactory.getLogger(CodeService.class);
	
	@Autowired
	private CodeMapper codeMapper;
	
	public List<HashMap<String, Object>> getCategory(HashMap<String, Object> param) throws Exception {
		return codeMapper.getCodeList(param);
	}
}
