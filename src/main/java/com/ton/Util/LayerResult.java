package com.ton.Util;

import java.util.HashMap;

import java.util.List;
import java.util.Map;


import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

public class LayerResult {
	 public static JSON getJson(List list){
	        Map<String,Object> map = new HashMap<>();
	        map.put("code",0);//状态码
	        map.put("msg","");//消息
	        map.put("count",list.size());//数据长度
	        map.put("data",list);//数据

	        JSON json = (JSON) JSONObject.toJSON(map);

	        return json;
	    }

}
