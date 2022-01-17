package com.abite.common.service;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.abite.common.interceptor.CommonInterceptor;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class CommonApiService {
	private static final Logger logger = LoggerFactory.getLogger(CommonApiService.class);
	@SuppressWarnings("unchecked")
	public Map<String, Object> callApi(String method, HashMap<String, String> param, String urlInfo) {

		String systemUrl = urlInfo;
		
        Map<String, Object> dataJson = new HashMap<String, Object>();

        if (StringUtils.isEmpty(urlInfo)) {
            return null;
        }

        String surl = (systemUrl == null) ? "" : systemUrl;
        
        HttpURLConnection con = null;
        DataOutputStream wr = null;
        BufferedReader in = null;

        try {
            ObjectMapper mapper = new ObjectMapper();
            String urlParameters = getDataString(param);
            byte[] postData = urlParameters.getBytes( StandardCharsets.UTF_8 );
            int postDataLength = postData.length;
            
            URL obj = new URL(surl);
            con = (HttpURLConnection) obj.openConnection();
            con.setRequestMethod(StringUtils.isEmpty(method) ? "POST" : method);
            con.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
            
            if(surl.contains("kapi")) {
            	con.setRequestProperty("Authorization", "Bearer " + param.get("token"));
            }
            con.setRequestProperty("charset", "UTF-8");
            con.setRequestProperty("Content-Length", Integer.toString(postDataLength ));
            con.setUseCaches(false);
            con.setDoOutput(true);
            con.setDoInput(true);
            
            
            wr = new DataOutputStream(con.getOutputStream());
            if(!"kapi".contains(surl)) {
            	wr.write(postData);
            }
            wr.flush();

            int responseCode = con.getResponseCode();

            String inputLine;
            if (responseCode == 200) { // 정상 호출
                in = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
            } else {
                in = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }

            StringBuffer response = new StringBuffer();
            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
            
            dataJson.put("STATUS_CD", responseCode);
            if (responseCode == 200) {
            	dataJson = mapper.readValue(response.toString(), Map.class);
            } else {
            	dataJson.put("RESULT_CODE", "E");
                dataJson.put("RESULT_MSG", "유효하지 않은 서버 응답을 받고 있습니다.<br/>다시 시도해 보거나 관리자에게 문의하십시오.");
            }
            System.out.println(response.toString());

        } catch (Exception ex) {
            ex.printStackTrace();
            dataJson.put("RESULT_CODE", "E");
            dataJson.put("RESULT_MSG", "예상치 못한 에러가 발생했습니다. 관리자에게 문의하십시오.");
        } finally {
            con.disconnect();
            if(in != null) {
                try {
                    in.close();
                } catch (IOException e) {
                    // TODO Auto-generated catch block
                }   
            }

            if(wr != null) {
                try {
                    wr.close();
                } catch (IOException e) {
                    // TODO Auto-generated catch block
                }   
            }           
        }

        return dataJson;
    }
	
	
	private String getDataString(HashMap<String, String> params) throws UnsupportedEncodingException{
		 
	    StringBuilder result = new StringBuilder();
	    boolean first = true;
	    for(Map.Entry<String, String> entry : params.entrySet()){
	    	if (first) {
	            first = false;		
	    	} else {
	    		result.append("&");
	    	}

	    	if(StringUtils.isNotEmpty(entry.getKey()) && StringUtils.isNotEmpty(entry.getValue())) {
	    		result.append(URLEncoder.encode(entry.getKey(), "UTF-8"));
		        result.append("=");
		        result.append(URLEncoder.encode(entry.getValue(), "UTF-8"));	
	    	}
	    }    
	    return result.toString();
	}
}
