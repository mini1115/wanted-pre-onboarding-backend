package com.wanted.config.auth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.wanted.model.Member;
import com.wanted.repository.MemberRepository;
@Service
public class PrincipalDetailService implements UserDetailsService {

	@Autowired
	private MemberRepository memberRepository;
	
	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
		System.out.println("loadUserByUsername");
		
		Member member = memberRepository.findByEmail(email);
		
		if (member==null) {
			throw new UsernameNotFoundException(email);
		}
		PrincipalDetails pmember = new PrincipalDetails(member);
		System.out.println("pmember: "+pmember);
		
		return pmember;
	}

}
