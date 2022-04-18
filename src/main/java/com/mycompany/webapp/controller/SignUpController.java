package com.mycompany.webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class SignUpController {
	@RequestMapping("/signUp")
	public String signup() {
		return "signUp";
	}
	
	@RequestMapping("/mainSignUp")
	public String mainSignUp() {
		return "signUp";
	}
	
	@RequestMapping("/loginSignUp")
	public String loginSignUp() {
		return "signUp";
	}
}
