package com.tiu.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 
 * 全局拦截异常
 *
 */
//切面拦截异常
@ControllerAdvice
public class GlobalExceptionHandler {
	
	@ExceptionHandler(RuntimeException.class)
	@ResponseBody	//拦截返回是Json格式的结果
	public Map<String, Object> exceptionHander(){
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("code", 500);
		result.put("msg", "系统错误，请重试...");
		
		return result;
	}

}
