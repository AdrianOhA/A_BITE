package com.abite.web.service;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Base64;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

/**
 * web main Service (BizLogic)
 * 
 * @author 오승민
 * @since 2020-01-20
 **/

@Service
public class FileService {
	private static final Logger logger = LoggerFactory.getLogger(FileService.class);
	
	public String fileUpload(HashMap<String, Object> param) throws Exception{
		
		logger.info("fileService call");
		String image = (String)param.get("encodedImg");
		String imageDataBytes = image.substring(image.indexOf(",")+1);
		byte[] decodedImg = Base64.getDecoder().decode(imageDataBytes);
		
		String target = (String) param.get("target");
		String ext = (String)param.get("ext");
		String fileName =  "";
		int no = (int)param.get("recipeNo");
		
		if ("profile".equals(target)) {
			fileName = "profile_" + System.currentTimeMillis() + ".";
		} else if("recipe".equals(target)){
			fileName = "recipe_" + no + "_" + System.currentTimeMillis() + ".";
		} else {
			int seq = (int)param.get("seq");
			fileName = "detail_" + no + "_" + seq + "_" + System.currentTimeMillis() + ".";
		}
		fileName += ext;
		
		Path destinationFile = Paths.get("C:\\A_BITE\\workspace\\A_BITE\\src\\main\\webapp\\public\\images", fileName);
		Files.write(destinationFile, decodedImg);
		
		return fileName;
	}
}
