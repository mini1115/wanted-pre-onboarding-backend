package com.wanted.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.wanted.model.Member;
import com.wanted.repository.MemberRepository;

@Service
public class MemberService {

	
	@Autowired
	private MemberRepository memberRepository;
	
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	public void register(Member member) {
		String rawPassword=member.getPassword();//진짜 password
		String encPassword=encoder.encode(rawPassword);
		member.setPassword(encPassword);//암호화된 password
		member.setRole("ROLE_USER");
		memberRepository.save(member);	}
	
}
