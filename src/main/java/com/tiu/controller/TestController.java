package com.tiu.controller;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
//@EnableAutoConfiguration
public class TestController {

	/**
	 * @RestController = @Controller + @ResponseBody
	 *  
	 * @ResponseBody：请求返回Json格式
	 * 
	 */ 
	
	@RequestMapping("/hello")
	public String hello(){
		  
		return "success";
	}
	
	@RequestMapping("/testException")
	public String testException(){
		int i = 1/0;
		
		return "Exception";
	}
	
	@RequestMapping("/testGitCommit")
	public String testGitCommit(){
		
		return "success";
	}
	
	@RequestMapping("/testRemotePush")
	public String testRemotePush(){
		return "success";
	}
	

	@RequestMapping("/testSwtichToMaster")
	public String testSwtichToMaster(){
		return "success";
	}

	@RequestMapping("/testBranch")
	public String testBranch(){
		return "success";
	}
	
//	@RequestMapping("/AfterOperateMaster")
//	public String AfterOperateMaster(){
//		return "success";
//
//	}
	
	public static void main(String[] args){
		SpringApplication.run(TestController.class, args);
	}
}
