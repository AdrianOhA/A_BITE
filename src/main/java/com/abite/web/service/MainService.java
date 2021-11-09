package com.abite.web.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.abite.web.mapper.MenuMapper;

/**
 * web main Service (BizLogic)
 * 
 * @author 오승민
 * @since 2020-01-20
 **/

@Service
public class MainService {
	private static final Logger logger = LoggerFactory.getLogger(MainService.class);
	
	@Autowired
	private MenuMapper menuMapper;
	
	public List<HashMap<String, Object>> getMenuList(HashMap<String, Object> param) throws Exception {
		List<HashMap<String, Object>> mainMenuList = menuMapper.getMainMenuList(param);
		List<HashMap<String, Object>> subMenuList =  menuMapper.getSubMenuList(param);
		
		for(HashMap<String, Object> mmenu : mainMenuList) {
			List<HashMap<String, Object>> subList = new ArrayList<HashMap<String, Object>>();
			for(HashMap<String, Object> smenu: subMenuList) {
				int menuNo = (int) mmenu.get("MENU_NO");
				int pmenuNo = (int) smenu.get("PARENT_MENU_NO");
				if (menuNo == pmenuNo) {
					subList.add(smenu);
				}
			}
			mmenu.put("SUB_MENU_LIST", subList);
		}
		
		return mainMenuList;
	}
}
