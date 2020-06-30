package com.ton.Util;

import java.io.BufferedReader;

import javax.servlet.http.HttpServletRequest;

public class ReadJsonString {
	
	
	  //json字符串拼接
    public static String readJSONString(HttpServletRequest request){
        StringBuffer json = new StringBuffer();

        String line = null;
        try {
            BufferedReader reader = request.getReader();
            while((line = reader.readLine()) != null) {
                json.append(line);
            }
        }
        catch(Exception e) {
            System.out.println(e.toString());
        }
        return json.toString();
    }


}
