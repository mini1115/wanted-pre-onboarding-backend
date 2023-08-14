package com.wanted.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wanted.model.Member;
import com.wanted.repository.MemberRepository;
import com.wanted.service.MemberService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class HomeController {
	@Autowired
	private final MemberRepository memberRepository;
	@Autowired
	private final MemberService memberService;

	@GetMapping("/")
	public String home() {
		return "redirect:/board/list";
	}

	@GetMapping("/login")
	public String loginForm() {
		return "/user/login";

	}

	@GetMapping("/login/error")
	public String login(Model model) {
		model.addAttribute("errorMsg", "아이디가 또는 비밀번호가 일치하지 않습니다");
		return "/user/login";
	}

	@GetMapping("register")
	public String register() {
		return "/user/join";
	}

	@PostMapping("/register")
	@ResponseBody
	public String register(@RequestBody Member member) {
		if (memberRepository.findByEmail(member.getEmail()) != null) {
			return "fail";
		}
		memberService.register(member);
		return "success";
	}
}
