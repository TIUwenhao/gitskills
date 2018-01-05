package com.tiu.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tiu.entity.User;

@Controller
public class IndexController {

	@RequestMapping("/index")
	public String index(ModelMap map){
		map.addAttribute("name", "涂文浩");
		//类似于request.setAttribute
		
		map.put("sex", 1);	//0是男的，1是女的
		
		User user1 = new User();
		user1.setUserID("001");
		user1.setUserName("涂文浩");
		user1.setSex("male");
		user1.setAge(15);
		user1.setAddress("Guangzhou");
		
		User user2 = new User();
		user2.setUserID("002");
		user2.setUserName("tuwenhao");
		user2.setSex("female");
		user2.setAge(25);
		user2.setAddress("ShenZhen");
		
		User user3 = new User();
		user3.setUserID("003");
		user3.setUserName("tuwenqi");
		user3.setSex("female");
		user3.setAge(26);
		user3.setAddress("HuiZhou");
		
		List<User> userList = new ArrayList<User>();
		userList.add(user1);
		userList.add(user2);
		userList.add(user3);

		
		map.addAttribute("userList", userList);
		
		return "index";
	}
}
