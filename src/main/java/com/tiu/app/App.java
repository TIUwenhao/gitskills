package com.tiu.app;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.context.annotation.ComponentScan;
//import org.springframework.web.bind.annotation.RestController;

//@ComponentScan相当于springmvc的dispatcher.xml里面的默认扫描包
@ComponentScan(basePackages="com.tiu.controller")
@EnableAutoConfiguration	//启动
public class App {
	
	public static void main(String[] args){
		SpringApplication.run(App.class, args);
	}
}
