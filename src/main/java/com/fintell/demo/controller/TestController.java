package com.fintell.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
 
@Controller
public class TestController {
 
	@RequestMapping("/")
	@ResponseBody
	public String testDemo() {
		return "Hello World!";
	}
 
}
